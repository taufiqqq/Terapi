import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import '../models/appointment.dart';
import '../models/test.dart';
import '../models/user.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to create a new user in Firestore
  Future<void> createUser(UserClient user) async {
    await _firestore.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'email': user.email,
      'name': user.name,
      'appointments': user.appointments?.map((appointment) => appointment.toMap()).toList(),
      'tests': user.tests?.map((test) => test).toList(),
    });
  }

  // Method to get user details from Firestore
  Future<UserClient?> getUserDetails(String uid) async {
    try {
      DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(uid).get();
      if (userSnapshot.exists) {
        Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
        return UserClient(
          uid: userData['uid'],
          email: userData['email'],
          name: userData['name'],
          appointments: _parseAppointments(userData['appointments']),
          tests: _parseTests(userData['tests']),
        );
      }
      return null;
    } catch (e) {
      print('Error fetching user details: $e');
      return null;
    }
  }

  // Helper method to parse a list of appointments
  List<Appointment> _parseAppointments(List<dynamic>? appointmentsData) {
    if (appointmentsData == null) {
      return [];
    }
    return appointmentsData.map((data) => Appointment.fromMap(data)).toList();
  }

  // Helper method to parse a list of tests
  List<Test> _parseTests(List<dynamic>? testsData) {
    if (testsData == null) {
      return [];
    }
    return testsData.map((data) => Test.fromMap(data)).toList();
  }

  // Other methods for updating user data, creating appointments, etc.
}
