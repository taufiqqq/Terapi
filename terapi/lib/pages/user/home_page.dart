import 'package:flutter/material.dart';
import 'package:terapi/pages/user/chat_page.dart';

import 'logout_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Prevent going back to the HomePage after logging out
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            const Text("successful\ndapat\nsuccessful\ndapat\n"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LogoutPage()), // Navigate to LogoutPage
                );
              },
              child: const Text('Logout'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ChatPage()), // Navigate to Chat
                );
              },
              child: const Text('Chat'),
            ),
          ],
        ),
      ),
    );
  }
}
