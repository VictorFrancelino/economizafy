import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  Schedule({
    required this.id,
    required this.title,
    required this.target,
    required this.current,
    required this.checkin,
    required this.deadline,
    required this.status,
    required this.createdAt,
    this.deletedAt,
  });

  final String id;
  final String title;
  final double target;
  final double current;
  final double checkin;
  final Timestamp deadline;
  final String status;
  final Timestamp createdAt;
  final Timestamp? deletedAt;

  factory Schedule.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Schedule(
      id: doc.id,
      title: data["title"] ?? "",
      target: (data["target"] as num).toDouble(),
      current: (data["current"] as num).toDouble(),
      checkin: (data["checkin"] as num).toDouble(),
      deadline: data["deadline"] as Timestamp,
      status: data["status"] ?? "active",
      createdAt: data["createdAt"] as Timestamp,
      deletedAt:
          data["deletedAt"] == null ? null : data["deletedAt"] as Timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "target": target,
      "current": current,
      "checkin": checkin,
      "deadline": deadline,
      "status": status,
      "createdAt": FieldValue.serverTimestamp(),
      if (deletedAt != null) "deletedAt": deletedAt,
    };
  }
}
