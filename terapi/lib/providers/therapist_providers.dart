import 'package:terapi/models/therapist.dart';

class TherapistProvider {
  static List<Therapist> therapists = [
    Therapist(
      uid: "1",
      name: "Dr. Haji Ahmad",
      email: "ahmad@gmail.com",
      specialization: "Psychologist",
      location: "Putrajaya",
      gender: "Male",
      review: 4.8,
      totalreview: 4,
    ),
    Therapist(
      uid: "2",
      gender: "Male",
      email: "karim@gmail.com",
      name: "En Karim Anwar",
      specialization: "Counselor",
      location: "Cyberjaya",
      review: 4.9,
      totalreview: 21,
    ),
    Therapist(
      uid: "3",
      gender: "Female",
      email: "syaf@gmail.com",
      name: "Syafiqah Ilaya",
      specialization: "Therapist",
      location: "Johor Bahru",
      review: 4.0,
      totalreview: 50,
    ),
    Therapist(
      uid: "4",
      gender: "Male",
      email: "brown@gmail.com",
      name: "Brown Michael",
      specialization: "Psychiatrist",
      location: "Kuala Lumpur",
      review: 4.3,
      totalreview: 5,
    ),
    Therapist(
      uid: "5",
      gender: "Female",
      email: "ajijah@gmail.com",
      name: "Dr. Ajijah",
      specialization: "Islamic Counsellor",
      location: "Kuala Lumpur",
      review: 4.7,
      totalreview: 15,
    ),
    Therapist(
      uid: "5",
      gender: "Female",
      email: "ajijah@gmail.com",
      name: "Dr. Nuraini",
      specialization: "Counsellor",
      location: "Kelantan",
      review: 3.9,
      totalreview: 88,
    ),
  ];

  // Add methods to manipulate the therapists list, if needed
}
