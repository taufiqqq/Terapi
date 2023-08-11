import 'package:flutter/material.dart';
import 'package:terapi/pages/user/logout_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 100),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogoutPage()),
            );
          },
          child: Text('Log Out'),
        )
      ],
    ));
  }
}
