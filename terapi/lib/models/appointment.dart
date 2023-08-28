import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Appointment {
  String uid;
  String therapistId;
  DateTime date;
  TimeOfDay time;
  String status;

  Appointment({
    String? uid,
    required this.therapistId,
    required this.date,
    required this.time,
    required this.status,
  }) : uid = uid ?? Uuid().v4();

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'therapistId': therapistId,
      'date': Timestamp.fromDate(date),
      'time': '${time.hour}:${time.minute}', // Convert TimeOfDay to string
      'status': status,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      uid: map['uid'],
      therapistId: map['therapistId'],
      date: (map['date'] as Timestamp).toDate(),
      time: TimeOfDay(
        hour: int.parse(map['time'].split(':')[0]),
        minute: int.parse(map['time'].split(':')[1]),
      ),
      status: map['status'],
    );
  }
}


/* 
// Creating an appointment with a custom UID
Appointment appointmentWithCustomUid = Appointment(
  uid: 'custom_uid_here',
  therapistId: 'therapist123',
  date: DateTime.now(),
  time: TimeOfDay.now(),
);

// Creating an appointment without a custom UID (generates a unique UUID)
Appointment appointmentWithGeneratedUid = Appointment(
  therapistId: 'therapist456',
  date: DateTime.now(),
  time: TimeOfDay.now(),
);
 */