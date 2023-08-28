import 'package:flutter/material.dart';

class AppointmentComment extends StatelessWidget {
  AppointmentComment({super.key, required this.name, required this.date});
  String name;
  String date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Give Comment'),
        ),
        body: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('lib/assets/img/user_picture.jpg'),
            ),
            Text(name),
            Text('Date : $date'),
            SizedBox(height: 30),
            Text(
              'Comment :',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Comment'),
            )
          ],
        ));
  }
}
