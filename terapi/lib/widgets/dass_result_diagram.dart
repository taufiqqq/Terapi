import 'package:flutter/material.dart';

class DassResultDiagram extends StatelessWidget {
  const DassResultDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement your DASS result diagram here
    // Get the screen width
    double screenWidth = 350.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 25),
        const Text(
          'DASS Result',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width:
              screenWidth, // Set the width of the container to the screen width
          child: Image.asset(
            'lib/assets/img/dass_result.jpg',
            fit: BoxFit.fitWidth, // Maintain aspect ratio and fit to width
          ),
        ),
      ],
    );
  }
}
