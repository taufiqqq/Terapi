import 'appointment.dart';
import 'test.dart';

class UserClient {
  final String uid;
  final String email;
  final String name;
  final List<Appointment>? appointments;
  final List<Test>? tests;
  // List to store test results
  // You can add more user properties as needed

  UserClient({
    required this.uid,
    required this.email,
    required this.name,
    this.appointments = const [],
    this.tests = const [],
  });
}
