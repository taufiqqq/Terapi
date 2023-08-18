import 'package:flutter/material.dart';
import 'package:terapi/pages/user/appointment_page.dart';
import 'package:terapi/pages/user/test_page.dart';
import 'package:terapi/widgets/upcoming_box.dart';

import '../../models/home_class.dart';
import '../../widgets/circle_icon.dart';
import '../../widgets/suggested_article.dart';
import '../../widgets/therapist_box.dart';

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
        appBar: AppBar(
          title: Row(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    FractionalTranslation(
                      translation: Offset(0.33,
                          0.0), // Adjust these values for custom positioning
                      child: Image.asset(
                        'lib/assets/img/TERAPI.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Text(
                    'Logo',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Logo',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  MaterialPageRoute(builder: (context) => HomePage());
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Logo',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              )
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestPage()),
                      );
                    },
                    child: CircleIcon(
                      box: ItemClass(
                          title: "Test", imagePath: "lib/assets/img/exam.png"),
                    ),
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
                  SuggestArticle(
                      box: ItemClass(
                          title: "Best Breathing Exercise",
                          imagePath: "lib/assets/img/background-1.png")),
                  SuggestArticle(
                      box: ItemClass(
                          title: "Practicing Mindfulness",
                          imagePath: "lib/assets/img/background-2.png")),
                  SuggestArticle(
                      box: ItemClass(
                          title: "Positive Psychology",
                          imagePath: "lib/assets/img/background-3.png")),
                  const SizedBox(
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
                  UpcomingBox(
                      box: UpcomingClass(
                          doctor: "Dr Azhar",
                          session: "Therapy Session",
                          date: "28 May,2023",
                          imagePath: "lib/assets/img/background-6.png")),
                  UpcomingBox(
                      box: UpcomingClass(
                          doctor: "Webinar",
                          session: "LUMS:Health",
                          date: "28 June,2023",
                          imagePath: "lib/assets/img/background-5.png")),
                  UpcomingBox(
                      box: UpcomingClass(
                          doctor: "Dr Azhar",
                          session: "Therapy Session",
                          date: "28 July,2023",
                          imagePath: "lib/assets/img/background-4.png")),
                  const SizedBox(
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
