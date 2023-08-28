import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terapi/pages/user/gpt_screen.dart';
import 'package:terapi/pages/user/manual_chat_screen.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
                    return const GPTScreen();
                  },
                ),
              );
            },
            child: const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("lib/assets/img/TERAPI.png"),
                radius: 30,
              ),
              title: Text(
                "Tiana (AI therapy help)",
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
              trailing: Icon(Icons.push_pin),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ManualScreen(imagepath: "lib/assets/img/therapist-2.jpg",);
                  },
                ),
              );
            },
            child: const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("lib/assets/img/therapist-2.jpg"),
                radius: 30,
              ),
              title: Text(
                "En Karim Anwar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.done_all,
                  ),
                  Text(
                    "I hope you can be better",
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
                    return ManualScreen(imagepath: "lib/assets/img/therapist-1.png",);
                  },
                ),
              );
            },
            child: const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("lib/assets/img/therapist-1.png"),
                radius: 30,
              ),
              title: Text(
                "Syafiqah Ilaya",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.done_all,
                  ),
                  Text(
                    "Thank you",
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
                    return ManualScreen(imagepath: "lib/assets/img/therapist-2.jpg",);
                  },
                ),
              );
            },
            child: const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("lib/assets/img/therapist-2.jpg"),
                radius: 30,
              ),
              title: Text(
                "Brown Michael",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.done_all,
                  ),
                  Text(
                    "Huge thanks for the help",
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
                "Rate your experience with therapist",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Text(
                    "How many stars would you ..",
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
