import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terapi/pages/user/gpt_screen.dart';

import 'manual_chat_screen.dart';

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
          // Content for Chat
          // Replace with the widgets you want to show for Header 1
          Text("Content for Header 1"),
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
                "Therapist ChatBot",
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
                    return const ManualScreen();
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
                "Dr Dom",
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
          )
        ],
      );
    } else if (sliding == 1) {
      return Column(
        children: [
          // Content for Notify
          // Show a text widget for Header 2
          Text("Content for Header 2"),
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
