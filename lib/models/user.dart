import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.uid,
    required this.name,
    required this.email,
    this.premium = false,
    required this.createdAt,
    this.deleted = false,
    this.deletedAt,
    this.schedules = const [],
  });

  final String uid;
  final String name;
  final String email;
  final bool premium;
  final bool deleted;
  final Timestamp createdAt;
  final Timestamp? deletedAt;
  final List<Map<String, dynamic>> schedules;

  factory User.fromFirestore(DocumentSnapshot doc) {
    final d = doc.data() as Map<String, dynamic>;
    return User(
      uid: doc.id,
      name: d["name"],
      email: d["email"],
      premium: d["premium"] ?? false,
      createdAt: d["createdAt"] as Timestamp,
      deleted: d["deleted"] ?? false,
      deletedAt: d["deletedAt"] as Timestamp?,
      schedules: List<Map<String, dynamic>>.from(d["schedules"] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "premium": premium,
      "createdAt": createdAt,
      "deleted": deleted,
      "deletedAt": deletedAt,
      "schedules": schedules,
    };
  }
}
