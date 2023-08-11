import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/gpt_screen.dart';

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

            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.5))
                ]),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GPTScreen(),
                            ));
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Image.asset(
                                "images/TERAPI.png",
                                height: 100,
                                width: 100,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "AI",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
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
