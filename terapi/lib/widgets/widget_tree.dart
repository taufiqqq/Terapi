import 'package:flutter/material.dart';

import '../pages/user/chat_page.dart';
import '../pages/user/home_page.dart';
import '../pages/user/post_page.dart';
import '../pages/user/profile_page.dart';
import '../pages/therapist/therapist_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int index = 0;

  List<Widget> pages = const [
    HomePage(),
    PostPage(),
    ChatPage(),
    TherapistPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(index),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Color.fromARGB(141, 0, 183, 255),
        ),
        child: NavigationBarTheme(
          data: const NavigationBarThemeData(indicatorColor: Colors.white),
          child: NavigationBar(
            backgroundColor:
                Color.fromARGB(0, 27, 152, 255), // Set the background color to transparent
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.add_box_outlined),
                label: 'Post',
              ),
              NavigationDestination(
                icon: Icon(Icons.chat_outlined),
                label: 'Chat',
              ),
              NavigationDestination(
                icon: Icon(Icons.video_call_outlined),
                label: 'Appointment',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outlined),
                label: 'Profile',
              ),
            ],
            selectedIndex: index,
            onDestinationSelected: (int value) {
              setState(() {
                index = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
