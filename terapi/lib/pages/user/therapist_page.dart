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
      appBar: AppBar(title: Center(child: Text('Appointment'))),
      body: Column(
        children: [
          Center(
            child: CupertinoSlidingSegmentedControl(
              children: const {
                0: Text('Past'),
                1: Text('Future'),
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
        ],
      ),
    );
  }
}
