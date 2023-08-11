import 'package:flutter/material.dart';

import '../pages/chat_page.dart';
import '../pages/home_page.dart';
import '../pages/post_page.dart';
import '../pages/profile_page.dart';
import '../pages/therapist_page.dart';

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
          color: Colors.grey.shade300,
        ),
        child: NavigationBarTheme(
          data: const NavigationBarThemeData(indicatorColor: Colors.white),
          child: NavigationBar(
            backgroundColor:
                Colors.transparent, // Set the background color to transparent
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home),
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
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
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
