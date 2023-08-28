import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terapi/pages/therapist/manual_chat_screen.dart';

class TherapistChatPage extends StatefulWidget {
  const TherapistChatPage({super.key});

  @override
  State<TherapistChatPage> createState() => _TherapistChatPageState();
}

class _TherapistChatPageState extends State<TherapistChatPage> {
  int? sliding = 0;

  Widget buildSegmentedControlContent() {
    if (sliding == 0) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TherapistManualScreen(  name : "Azrai Azih");
                  },
                ),
              );
            },
            child: const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("lib/assets/img/user_picture.jpg"),
                radius: 30,
              ),
              title: Text(
                "Azrai Azih",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.done_all,
                  ),
                  Text(
                    "Chat With Me",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TherapistManualScreen(name : "Syanita Imran");
                  },
                ),
              );
            },
            child: const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("lib/assets/img/user_picture.jpg"),
                radius: 30,
              ),
              title: Text(
                "Syanita Imran",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.done_all,
                  ),
                  Text(
                    "Hello how are you dear",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TherapistManualScreen(name : "Amirul Izhan");
                  },
                ),
              );
            },
            child: const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("lib/assets/img/user_picture.jpg"),
                radius: 30,
              ),
              title: Text(
                "Amirul Izhan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.done_all,
                  ),
                  Text(
                    "Terima kasih atas bantuan",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return  TherapistManualScreen(name :  "Anita binti Ahmadi");
                  },
                ),
              );
            },
            child: const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("lib/assets/img/user_picture.jpg"),
                radius: 30,
              ),
              title: Text(
                "Anita binti Ahmadi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.done_all,
                  ),
                  Text(
                    "Saya penat lah dr selalu begini",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ),
          )
        ],
      );
    } else if (sliding == 1) {
      return Column(
        children: [
          GestureDetector(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue
                    .shade200, // Set the background color of the CircleAvatar
                child: Icon(
                  Icons.star, // Replace with the desired icon
                  color: Colors.white, // Set the color of the icon
                  size: 30, // Set the size of the icon
                ),
                radius: 30,
              ),
              title: Text(
                "Rate your experience with user",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Text(
                    "Update App 1.0.1 - Improve UI",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
              trailing: Text(
                "10 min ago",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          GestureDetector(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.brown
                    .shade200, // Set the background color of the CircleAvatar
                child: Icon(
                  Icons.book, // Replace with the desired icon
                  color: Colors.white, // Set the color of the icon
                  size: 30, // Set the size of the icon
                ),
                radius: 30,
              ),
              title: const Text(
                "New articles is out now !",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: const Row(
                children: [
                  Text(
                    "Go find out our new released ...",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
              trailing: Text(
                "25 min ago",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          GestureDetector(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green
                    .shade100, // Set the background color of the CircleAvatar
                child: Icon(
                  Icons.access_time_outlined, // Replace with the desired icon
                  color: Colors.white, // Set the color of the icon
                  size: 30, // Set the size of the icon
                ),
                radius: 30,
              ),
              title: Text(
                "Don’t forget your appointment tomorrow !",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Text(
                    "8 am - 10 am",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
              trailing: Text(
                "40 min ago",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(); // Return an empty container by default or handle other cases
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                child: Image.asset(
                  'lib/assets/img/TERAPI.png',
                  height: 150,
                  width: 150,
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: CupertinoSlidingSegmentedControl(
                children: const {
                  0: Text('Chat'),
                  1: Text('Notify'),
                },
                groupValue: sliding,
                onValueChanged: (int? newValue) {
                  setState(
                    () {
                      sliding = newValue;
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Display content based on the selected value of the segmented control
            buildSegmentedControlContent(),
          ],
        ),
      );

  Widget buildSegment(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 17, color: Colors.black),
    );
  }
}
