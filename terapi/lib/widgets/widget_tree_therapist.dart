import 'package:flutter/material.dart';

import '../pages/therapist/appointment_page.dart';
import '../pages/therapist/chat_page.dart';
import '../pages/therapist/home_page.dart';
import '../pages/therapist/profile_page.dart';

class TherapistWidgetTree extends StatefulWidget {
  const TherapistWidgetTree({super.key});

  @override
  State<TherapistWidgetTree> createState() => _TherapistWidgetTreeState();
}

class _TherapistWidgetTreeState extends State<TherapistWidgetTree> {
  int index = 0;

  List<Widget> pages =  [
    TherapistHomePage(),
    TherapistChatPage(),
    TherapistAppointmentPage(), 
    TherapistProfilePage(),
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
            backgroundColor: Color.fromARGB(0, 116, 138, 156), // Set the background color to transparent
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.chat_outlined),
                label: 'Chat',
              ),
              NavigationDestination(
                icon: Icon(Icons.video_call_outlined),
                label: 'Sessions',
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
