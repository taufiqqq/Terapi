import 'package:terapi/models/therapist.dart';

class TherapistProvider {
  static List<Therapist> therapists = [
    Therapist(
      therapistId: "1",
      name: "Dr. Haji Ahmad",
      email: "ahmad@gmail.com",
      specialization: "Psychologist",
      location: "Putrajaya",
      gender: "Male",
      review: 4.8,
      totalreview: 4,
    ),
    Therapist(
      therapistId: "2",
      gender: "Male",
      email: "karim@gmail.com",
      name: "En Karim Anwar",
      specialization: "Counselor",
      location: "Cyberjaya",
      review: 4.9,
      totalreview: 21,
    ),
    Therapist(
      therapistId: "3",
      gender: "Female",
      email: "syaf@gmail.com",
      name: "Syafiqah Ilaya",
      specialization: "Career Therapist",
      location: "Johor Bahru",
      review: 4.0,
      totalreview: 50,
    ),
    Therapist(
      therapistId: "4",
      gender: "Male",
      email: "brown@gmail.com",
      name: "Brown Michael",
      specialization: "Psychiatrist",
      location: "Kuala Lumpur",
      review: 4.3,
      totalreview: 5,
    ),
    Therapist(
      therapistId: "5",
      gender: "Female",
      email: "ajijah@gmail.com",
      name: "Dr. Ajijah",
      specialization: "Islamic Counsellor",
      location: "Kuala Lumpur",
      review: 4.7,
      totalreview: 15,
    ),
    Therapist(
      therapistId: "6",
      gender: "Female",
      email: "ajijah@gmail.com",
      name: "Dr. Nuraini",
      specialization: "Counsellor",
      location: "Kelantan",
      review: 3.9,
      totalreview: 88,
    ),
    Therapist(
      therapistId: "7",
      gender: "Male",
      email: "lai@gmail.com",
      name: "Mr Lai Xii ",
      specialization: "Marriage and Family",
      location: "Sabah",
      review: 3.4,
      totalreview: 88,
    ),
  ];

  static Therapist getTherapistById(String therapistId) {
    for (Therapist therapist in therapists) {
      if (therapist.therapistId == therapistId) {
        return therapist;
      }
    }
    // Throw an exception if no therapist is found with the given ID
    throw Exception('Therapist not found with ID: $therapistId');
  }
}
