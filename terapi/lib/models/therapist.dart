import 'appointment.dart';

class Therapist {
  final String uid;
  final String name;
  final String email;
  final List<Appointment> appointments;
  final List<String> reviews;
  final String specialization;
  final String description;

  Therapist({
    required this.uid,
    required this.name,
    required this.email,
    this.appointments = const [],
    this.reviews = const [],
    required this.specialization,
    required this.description,
  });
}
