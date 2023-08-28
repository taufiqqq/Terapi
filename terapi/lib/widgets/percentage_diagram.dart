import 'package:flutter/material.dart';

class PercentageDiagram extends StatelessWidget {
  const PercentageDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth, // Set the width of the container to the screen width
      child: Image.asset(
        'lib/assets/img/progress.jpg',
        fit: BoxFit.fitWidth, // Maintain aspect ratio and fit to width
      ),
    );
  }
}
