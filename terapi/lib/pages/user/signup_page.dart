import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static const String id = 'signup'; // Unique route name for SignUp page

  @override
  Widget build(BuildContext context) {
    // Your SignUp page UI code here
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Text('Sign Up Page'),
      ),
    );
  }
}