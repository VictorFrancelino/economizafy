import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> restoreUser() async {
    final User? user = _firebaseAuth.currentUser;
    if (user == null) throw Exception("Usuário não autenticado");

    await _firestore.collection("users").doc(user.uid).update({
      "deleted": false,
      "deletedAt": null,
    });
  }

  Future<void> softDeleteUser() async {
    final User? user = _firebaseAuth.currentUser;
    if (user == null) throw Exception("Usuário não autenticado");

    await _firestore.collection("users").doc(user.uid).update({
      "deleted": true,
      "deletedAt": FieldValue.serverTimestamp(),
    });

    await user.delete();
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) throw "Login cancelado";
    final googleAuth = await googleUser.authentication;

    final cred = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final userCredential = await _firebaseAuth.signInWithCredential(cred);

    final user = userCredential.user!;
    final docRef = _firestore.collection("users").doc(user.uid);
    final snap = await docRef.get();
    if (!snap.exists) {
      await docRef.set({
        "uid": user.uid,
        "name": user.displayName,
        "email": user.email,
        "premium": false,
        "createdAt": FieldValue.serverTimestamp(),
        "deleted": false,
        "deletedAt": null,
        "schedules": [],
      });
    }

    return userCredential;
  }

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user!;

      final batch = _firestore.batch();
      final docRef = _firestore.collection("users").doc(user.uid);
      batch.set(docRef, {
        "uid": user.uid,
        "name": name,
        "email": email,
        "premium": false,
        "createdAt": FieldValue.serverTimestamp(),
        "deleted": false,
        "deletedAt": null,
        "schedules": [],
      });

      await batch.commit();
      await user.updateDisplayName(name);
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (_) {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        await currentUser.delete();
      }
      rethrow;
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      final userDoc =
          await _firestore
              .collection("users")
              .doc(userCredential.user!.uid)
              .get();

      if (userDoc["deleted"] == true) {
        if (userDoc["deletedAt"].toDate().difference(DateTime.now()).inDays <=
            30) {
          // função pra deixar o atributo "delete" como false
        } else {
          throw "Conta permanentemente excluída";
        }
      }
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    }
  }

  String _handleFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case "email-already-in-use":
        return "Este e-mail já está cadastrado";
      case "invalid-email":
        return "Formato de e-mail inválido";
      case "account-exists-with-different-credential":
        return "Conta já existe com outro método de login";
      case "weak-password":
        return "Senha fraca (mínimo 6 caracteres)";
      case "user-disabled":
        return "Conta desativada";
      case "user-not-found":
        return "Usuário não encontrado";
      case "wrong-password":
        return "Senha incorreta";
      case "operation-not-allowed":
        return "Método de login não habilitado";
      default:
        return "Erro de autenticação: ${e.message}";
    }
  }
}
