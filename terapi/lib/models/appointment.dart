 import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Appointment {
  final String uid;
  final String therapistId;
  final DateTime date;
  final TimeOfDay time;
  // You can add more appointment properties as needed

  Appointment({
    String? uid, // Allow optional uid parameter
    required this.therapistId,
    required this.date,
    required this.time,
  }) : uid = uid ?? Uuid().v4(); // Generate a UUID if uid is not provided
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