import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:terapi/pages/user/book_page.dart';

import '../login_page.dart';
import 'appointment_page.dart';
import 'booking_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Unlock Premium Features'),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Upgrade to Premium to enjoy:'),
                          SizedBox(height: 10),
                          Text('- Ad-free experience'),
                          Text('- Exclusive content access'),
                          Text('- Priority customer support'),
                          Text('- Unlimited saved items'),
                          Text('- Enhanced data analytics'),
                          // ... (you can add more points here)
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Implement the action for continuing with the subscription
                            Navigator.of(context).pop();
                          },
                          child: const Text('Subscribe Now'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Upgrade',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
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
                  backgroundImage:
                      AssetImage('lib/assets/img/user_picture.jpg'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
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
                        Text('@Afique2002',
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
                    'Depression Anxiety Stress Level',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Normal',
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  const Center(
                    child: Text('75%',
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 5),
                  const LinearProgressIndicator(
                    value: 0.75,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement the complete your profile functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Complete Your Profile',
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                    ),
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
                              builder: (context) => BookingPage()));
                    },
                    child: buildClickableRow(
                        'My therapist', 'lib/assets/img/doctorblack.png'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppointmentPage()));
                      // Navigate to the respective page for this row
                    },
                    child: buildClickableRow(
                        'Appointments', 'lib/assets/img/calendarblack.png'),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigate to the respective page for this row
                    },
                    child: buildClickableRow(
                        'Activity Log', 'lib/assets/img/history.png'),
                  ),
                  InkWell(
                    onTap: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EbookPage()));
                      // Navigate to the respective page for this row
                    },
                    child: buildClickableRow(
                        'My Ebook', 'lib/assets/img/bookblack.png'),
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
}

class EBookPage {
}
