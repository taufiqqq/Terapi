// ignore_for_file: avoid_print, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:terapi/pages/user/register_page.dart';
import '../widgets/widget_tree.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Check if the user is already logged in
  }

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      // Navigate to the next screen or perform any action after successful login
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('User Not Found')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
    return user;
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        print("Google Sign-In successful!");
        print("User email: ${user.email}");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WidgetTree(),
          ),
        );
      } else {
        print("Google Sign-In failed");
      }
    } catch (e) {
      print("Error occurred during Google Sign-In: $e");
    }
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
            builder: (context) => const WidgetTree(),
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

  void _handleForgotPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Forgot Password"),
          content: TextField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: "Enter your email"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final String email = _emailController.text.trim();
                if (EmailValidator.validate(email)) {
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email);
                    print("Password reset email sent successfully");
                  } catch (e) {
                    print("Error sending password reset email: $e");
                  }
                } else {
                  print("Invalid email format");
                }
                Navigator.pop(
                    context); // Close the dialog after handling the password reset
              },
              child: const Text("Send Email"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(1, 0),
            end: Alignment(1, 1),
            colors: [Color(0xFFF1F6FA), Color(0xF259ABF7), Color(0xFF0067C7)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Welcome to ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                width: 195,
                height: 122,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/img/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _handleForgotPassword,
                  child: const Text('Forgot Password?'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: _handleLogin,
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: _handleGoogleSignIn,
                child: Image.asset('lib/assets/img/google.png',
                    width: 24, height: 24),
                // Adjust the width and height to fit your image size
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      ' Sign Up',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 0, 62, 113)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
