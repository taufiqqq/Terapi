import 'package:flutter/material.dart';
import 'package:terapi/pages/user/appointment_page.dart';
import 'package:terapi/pages/user/chat_page.dart';

import '../../models/home_class.dart';
import '../../widgets/circle_icon.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/suggested_article.dart';
import '../../widgets/therapist_box.dart';
import '../user/logout_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Prevent going back to the HomePage after logging out
        return false;
      },
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/img/TERAPI.png',
                      height: 150,
                      width: 150,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppointmentPage()),
                      );
                    },
                    child: CircleIcon(
                      box: ItemClass(
                          title: "Appointment",
                          imagePath: "lib/assets/img/calendar.png"),
                    ),
                  ),
                  CircleIcon(
                    box: ItemClass(
                        title: "Test", imagePath: "lib/assets/img/exam.png"),
                  ),
                  CircleIcon(
                    box: ItemClass(
                        title: "Therapist",
                        imagePath: "lib/assets/img/doctor.png"),
                  ),
                  CircleIcon(
                    box: ItemClass(
                        title: "Progress",
                        imagePath: "lib/assets/img/progress.png"),
                  ),
                  CircleIcon(
                    box: ItemClass(
                        title: "E-Book", imagePath: "lib/assets/img/book.png"),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Text(
                "Suggested Therapist",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TherapistList(
                    box: ItemClass(
                        title: 'Dr Testing',
                        imagePath: "lib/assets/img/therapist-1.png"),
                  ),
                  TherapistList(
                    box: ItemClass(
                        title: 'Testing',
                        imagePath: "lib/assets/img/TERAPI.png"),
                  ),
                  TherapistList(
                    box: ItemClass(
                        title: 'Testing',
                        imagePath: "lib/assets/img/TERAPI.png"),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Text(
                "Suggested Articles",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SuggestArticle(),
                  SuggestArticle(),
                  SuggestArticle(),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Text(
                "Upcoming",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SuggestArticle(),
                  SuggestArticle(),
                  SuggestArticle(),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
