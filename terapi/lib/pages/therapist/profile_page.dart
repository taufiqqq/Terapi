import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:terapi/pages/therapist/appointment_page.dart';
import 'package:terapi/pages/therapist/portfolio.dart';
import 'package:terapi/pages/therapist/therapist_money.dart';
import 'package:terapi/pages/user/book_page.dart';

import '../login_page.dart';
import 'my_review.dart';

class TherapistProfilePage extends StatelessWidget {
  const TherapistProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('lib/assets/img/therapist-2.jpg'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'En Karim Anwar',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('My contact',
                        style: TextStyle(fontSize: 13, color: Colors.black)),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.chat_bubble, color: Colors.blue),
                        SizedBox(width: 5),
                        Text('@karimanwar',
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.blue),
                        SizedBox(width: 5),
                        Text('123-456-7890',
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 59, 225, 26),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Rating',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '4.9/5.0 stars',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Me',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TherapistPortfolio()));
                    },
                    child: buildClickableRow(
                        'Edit My Porfolio', 'lib/assets/img/logo.png'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TherapistMoney()));
                    },
                    child: buildClickableRowIcon(
                        'My Earnings', Icon(Icons.attach_money)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewAllReviewsPage()));
                    },
                    child:
                        buildClickableRowIcon('My Reviews', Icon(Icons.star)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TherapistAppointmentPage(
                              initialStatus: FilterStatus.past),
                        ),
                      );
                    },
                    child: buildClickableRow(
                        'My customers', 'lib/assets/img/doctorblack.png'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TherapistAppointmentPage(),
                        ),
                      );
                    },
                    child: buildClickableRow(
                        'Appointments', 'lib/assets/img/calendarblack.png'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EbookPage()));
                    },
                    child: buildClickableRow(
                        'Ebook', 'lib/assets/img/bookblack.png'),
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        await FirebaseAuth.instance.signOut();

                        final GoogleSignIn googleSignIn = GoogleSignIn();
                        await googleSignIn.signOut();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) =>
                              false, // Remove all previous routes from the stack
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    },
                    child: buildClickableRow(
                        'Log out', 'lib/assets/img/logout.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClickableRow(String title, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(imagePath,
              width: 28, height: 28), // Use the provided image path
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }

  Widget buildClickableRowIcon(String title, Icon imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          imagePath, // Use the provided image path
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}

class EBookPage {}
