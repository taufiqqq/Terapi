import 'package:flutter/material.dart';

class ActivityLogPage extends StatefulWidget {
  @override
  State<ActivityLogPage> createState() => _ActivityLogPageState();
}

class _ActivityLogPageState extends State<ActivityLogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Activity Log',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.0),
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Date',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(width: 70),
                Text(
                  'Activity',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 10),
            AppointmentItem(
              date: '10 Aug',
              time: '10.00 a.m',
              activityType: 'Appointment',
              therapistName: 'Dr. Karim Anwar',
              specialty: 'Counselor',
              imagePath: 'lib/assets/img/therapist-2.jpg',
            ),
            SizedBox(height: 10),
            AppointmentItem(
              date: '20 Jul',
              time: '11.00 a.m',
              activityType: 'Appointment',
              therapistName: 'Dr. Karim Anwar',
              specialty: 'Counselor',
              imagePath: 'lib/assets/img/therapist-2.jpg',
            ),
            SizedBox(height: 10),
            EbookItem(
              title: 'Daring Greatly',
              author: 'Brene Brown',
              description: 'Read me',
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentItem extends StatelessWidget {
  final String date;
  final String time;
  final String activityType;
  final String therapistName;
  final String specialty;
  final String imagePath;

  const AppointmentItem({
    required this.date,
    required this.time,
    required this.activityType,
    required this.therapistName,
    required this.specialty,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                date,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                time,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      activityType,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            therapistName,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          Text(
                            specialty,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              // Implement view analysis functionality
                            },
                            child: Row(
                              children: [
                                Icon(Icons.assessment, color: Colors.blue, size: 16),
                                SizedBox(width: 5),
                                Text(
                                  'View Analysis',
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Implement message functionality
                            },
                            child: Row(
                              children: [
                                Icon(Icons.message, color: Colors.blue, size: 16),
                                SizedBox(width: 2),
                                Text(
                                  'Message Now',
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Implement call functionality
                            },
                            child: Row(
                              children: [
                                Icon(Icons.call, color: Colors.blue, size: 16),
                                SizedBox(width: 2),
                                Text(
                                  'Call Now',
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class EbookItem extends StatelessWidget {
  final String title;
  final String author;
  final String description;

  const EbookItem({
    required this.title,
    required this.author,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '10 Jul',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '8.23 a.m',
                style: TextStyle(fontSize: 12), // Empty time for e-book
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Ebook',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 120, // Adjust the height for the rectangular image
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/assets/img/daring_greatly.jpg'), // Use the appropriate image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          Text(
                            author,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              // Implement Read Me functionality for e-book
                            },
                            child: Row(
                              children: [
                                Icon(Icons.read_more, color: Colors.blue, size: 16), // Use appropriate icon
                                SizedBox(width: 5),
                                Text(
                                  description,
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

