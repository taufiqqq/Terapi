import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TherapistPage extends StatefulWidget {
  const TherapistPage({super.key});

  @override
  State<TherapistPage> createState() => _TherapistPageState();
}

class _TherapistPageState extends State<TherapistPage> {
  
  int? sliding = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Therapist'))),
      body: Column(
      
      ),
    );
  }
}
