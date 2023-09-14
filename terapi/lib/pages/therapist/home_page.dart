import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:terapi/pages/therapist/appointment_page.dart';
import 'package:terapi/pages/therapist/my_review.dart';
import 'package:terapi/pages/therapist/pie_chart.dart';
import 'package:terapi/pages/therapist/therapist_money.dart';
import 'package:terapi/pages/therapist/therapist_post.dart';
import 'package:terapi/widgets/upcoming_box.dart';

import '../../models/home_class.dart';
import '../../models/therapist.dart';
import '../../providers/therapist_providers.dart';
import '../../widgets/circle_icon.dart';
import '../../widgets/suggested_article.dart';
import '../../widgets/therapist_box.dart';

class TherapistHomePage extends StatelessWidget {
  TherapistHomePage({super.key});

  final List<Therapist> therapists = TherapistProvider.therapists;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Prevent going back to the TherapistHomePage after logging out
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SafeArea(
            child: Image.asset(
              'lib/assets/img/TERAPI.png',
              height: 150,
              width: 150,
            ),
          ),
        ),
        /* drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Image(image: AssetImage("lib/assets/img/logo.png"),)
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  MaterialPageRoute(builder: (context) => TherapistHomePage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.data_usage),
                title: const Text(
                  'Data Set',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SetDataPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.dataset_sharp),
                title: const Text(
                  'Services',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HospitalListScreen()),
                  );
                },
              ),
            ],
          ),
        ), */
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
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
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
                          builder: (context) => TherapistAppointmentPage(),
                        ),
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
                        MaterialPageRoute(builder: (context) => PieChartPage()),
                      );
                    },
                    child: CircleIcon(
                      box: ItemClass(
                          title: "Statistics",
                          imagePath: "lib/assets/img/progress.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TherapistPost()),
                      );
                    },
                    child: CircleIcon(
                      box: ItemClass(
                          title: "Posts",
                          imagePath: "lib/assets/img/post.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewAllReviewsPage()),
                      );
                    },
                    child: CircleIcon(
                      box: ItemClass(
                          title: "Reviews",
                          imagePath: "lib/assets/img/exam.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TherapistAppointmentPage(
                              initialStatus: FilterStatus.past),
                        ),
                      );
                    },
                    child: CircleIcon(
                      box: ItemClass(
                          title: "Customers",
                          imagePath: "lib/assets/img/doctor.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TherapistMoney(),
                        ),
                      );
                    },
                    child: CircleIcon(
                      box: ItemClass(
                          title: "Earnings",
                          imagePath: "lib/assets/img/money.png"),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Upcoming Session",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 0, 255, 255), // Cyan
                        Color.fromARGB(255, 60, 185, 227), // Light Blue
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("lib/assets/img/user_picture.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Text(
                                    "Azhan Haniff",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black, // Outline color
                                    ),
                                  ),
                                  Text(
                                    "Azhan Haniff",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth =
                                            2 // Adjust the stroke width as needed
                                        ..color = Colors.black, // Outline color
                                    ),
                                  ),
                                  Text(
                                    "Azhan Haniff",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white, // Text color
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '20 Nov 2023, 10:00',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TherapistAppointmentPage()));
              },
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
