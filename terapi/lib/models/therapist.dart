import 'appointment.dart';

class Therapist {
  final String uid;
  final String name;
  final String gender;
  final String email;
  final List<Appointment>? appointments;
  final List<String>? comments;
  final String specialization;
  final String? description;
  final double review;
  final double totalreview;
  final String location;

  Therapist({
    required this.uid,
    required this.name,
    required this.gender,
    required this.email,
    this.appointments = const [],
    this.comments = const [],
    required this.specialization,
    this.description,
    required this.review,
    required this.totalreview,
    required this.location,
  });
}
