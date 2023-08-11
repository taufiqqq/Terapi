import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terapi/pages/user/gpt_screen.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int? sliding = 0;
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
                  0: Text('Header 1'),
                  1: Text('Header 2'),
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

            GestureDetector(
              onTap: () {
                // Add the action you want to perform when the ListTile is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const GPTScreen();
                    }, // Replace with your destination screen
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
            )
            // Other widgets you want to include in the ListView
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
