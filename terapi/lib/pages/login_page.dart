// ignore_for_file: avoid_print, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'user/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      // Navigate to the next screen or perform any action after successful login
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found");
      } else {
        print("Login failed: ${e.message}");
      }
    }
    return user;
  }

  void _handleLogin() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (EmailValidator.validate(email)) {
      User? user = await loginUsingEmailPassword(
          email: email, password: password, context: context);

      if (user != null) {
        // Successful login, you can navigate to the next screen or perform any action
        // ignore: avoid_print
        print("Login successful!");
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        // Failed login, show an error message or handle it accordingly
        print("Login failed");
      }
    } else {
      // Invalid email, show an error message or handle it accordingly
      print("Invalid email");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LOGIN',
              style: TextStyle(fontSize: 50),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "User Email",
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "User Password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _handleLogin,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
