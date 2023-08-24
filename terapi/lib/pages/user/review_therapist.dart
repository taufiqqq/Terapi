import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../../models/therapist.dart';

class ReviewTherapist extends StatefulWidget {
  const ReviewTherapist({Key? key, required this.therapist, required this.date})
      : super(key: key);
  final Therapist therapist;
  final String date;

  @override
  State<ReviewTherapist> createState() => _ReviewTherapistState();
}

class _ReviewTherapistState extends State<ReviewTherapist> {
  double starRating = 0.0;
  String comment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Review Therapist')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(
                  widget.therapist.gender == 'Male'
                      ? 'lib/assets/img/therapist-2.jpg'
                      : 'lib/assets/img/therapist-1.png',
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.therapist.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Appointment Date: ${widget.date}'),
              SizedBox(height: 20),
              Text('Rate this therapist:'),
              SizedBox(height: 10),
              RatingStars(
                value: starRating,
                onValueChanged: (newValue) {
                  setState(() {
                    starRating = newValue;
                  });
                },
                starBuilder: (index, color) => Icon(
                  Icons.star,
                  color: color,
                ),
                starCount: 5,
                starSize: 30,
                valueLabelColor: const Color(0xff9b9b9b),
                valueLabelTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0,
                ),
                valueLabelRadius: 10,
                maxValue: 5,
                starSpacing: 2,
                maxValueVisibility: true,
                valueLabelVisibility: true,
                animationDuration: Duration(milliseconds: 1000),
                valueLabelPadding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                valueLabelMargin: const EdgeInsets.only(right: 8),
                starOffColor: const Color(0xffe7e8ea),
                starColor: Colors.yellow,
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    comment = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Add your comment',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Perform any action you want with starRating and comment
                  // For now, we'll just print them
                  print('Star Rating: $starRating');
                  print('Comment: $comment');
                  // Navigate back to the previous screen
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
