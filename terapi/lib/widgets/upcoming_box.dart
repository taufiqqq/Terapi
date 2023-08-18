import 'package:flutter/material.dart';
import 'package:terapi/models/home_class.dart';

class UpcomingBox extends StatelessWidget {
  const UpcomingBox({super.key, required this.box});

  final UpcomingClass box;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        box.imagePath,
                      ),
                      fit: BoxFit.cover),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          box.date,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Change to the desired color
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        box.session,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        box.doctor,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
