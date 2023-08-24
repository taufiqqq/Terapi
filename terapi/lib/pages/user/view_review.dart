import 'package:flutter/material.dart';

import '../../models/therapist.dart';

class ViewResult extends StatefulWidget {
  const ViewResult({super.key, required this.therapist, required this.date});
  final Therapist therapist;
  final String date;
  @override
  State<ViewResult> createState() => _ViewResultState();
}

class _ViewResultState extends State<ViewResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Appointment Result')),
        body: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(widget.therapist.gender == 'Male'
                  ? 'lib/assets/img/therapist-2.jpg'
                  : 'lib/assets/img/therapist-1.png'),
            ),
            Text(widget.therapist.name),
            Text('Date : ${widget.date}'),
            SizedBox(height: 30),
            Text(
              'Comment :',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  'Reflecting on our conversation, its evident that youre grappling with challenges related to software development and communication. Remember that growth is a gradual process, and every obstacle you face contributes to your learning journey. Dont be disheartened by setbacks; instead, view them as opportunities to refine your skills. Just as code iterates, so does personal development. Stay patient with yourself and maintain a balance between persistence and self-care. Taking breaks, seeking guidance, and embracing a positive mindset will all contribute to your progress. Trust that with dedication and continuous learning, youll navigate through these challenges and reach your desired outcomes.'),
            )
          ],
        ));
  }
}
