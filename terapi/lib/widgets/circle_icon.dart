import 'package:flutter/material.dart';

import '../models/home_class.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key, required this.box});

  final ItemClass box;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                // Wrap the contents in a Column
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset(box.imagePath),
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(
                      height: 5), // Add some spacing between the image and text
                  Text(
                    box.title, // Replace with your actual text
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
