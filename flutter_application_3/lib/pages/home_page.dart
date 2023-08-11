import 'package:flutter/material.dart';
import 'package:flutter_application_3/class/home_class.dart';
import 'package:flutter_application_3/widget/circle_icon.dart';
import 'package:flutter_application_3/widget/suggested_article.dart';
import 'package:flutter_application_3/widget/therapist_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Image.asset(
                'images/TERAPI.png',
                height: 150,
                width: 150,
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
                CircleIcon(
                  box: ItemClass(title: "E-Book", imagePath: "images/book.png"),
                ),
                CircleIcon(
                  box: ItemClass(
                      title: "Appointment", imagePath: "images/calendar.png"),
                ),
                CircleIcon(
                  box: ItemClass(title: "Test", imagePath: "images/exam.png"),
                ),
                CircleIcon(
                  box: ItemClass(
                      title: "Therapist", imagePath: "images/doctor.png"),
                ),
                CircleIcon(
                  box: ItemClass(
                      title: "Progress", imagePath: "images/progress.png"),
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
                      title: 'Dr Testing', imagePath: "images/therapist-1.png"),
                ),
                TherapistList(
                  box: ItemClass(
                      title: 'Testing', imagePath: "images/TERAPI.png"),
                ),
                TherapistList(
                  box: ItemClass(
                      title: 'Testing', imagePath: "images/TERAPI.png"),
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
          const Expanded(
            child: SingleChildScrollView(
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
          const Expanded(
            child: SingleChildScrollView(
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
          ),
        ],
      ),
    );
  }
}
