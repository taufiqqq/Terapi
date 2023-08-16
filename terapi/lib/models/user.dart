import 'appointment.dart';
import 'test.dart';

class User {
  final String uid;
  final String email;
  final List<Appointment> appointments;
  final List<Test> tests; // List to store test results
  // You can add more user properties as needed

  User({
    required this.uid,
    required this.email,
    this.appointments = const [],
    this.tests = const [],
  });
}
