import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleService {
  ScheduleService(this.userId);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId;

  CollectionReference get schedulesRef =>
      _firestore.collection("users/$userId/schedules");

  Future<void> createSchedule(Map<String, dynamic> newSchedule) async {
    await schedulesRef.add({
      ...newSchedule,
      "createdAt": FieldValue.serverTimestamp(),
      "status": "active",
    });
  }

  Stream<List<DocumentSnapshot>> getActiveSchedules() {
    return schedulesRef
        .where("status", isEqualTo: "active")
        .orderBy("deadline")
        .orderBy("createdAt")
        .snapshots()
        .map((snap) => snap.docs);
  }
}
