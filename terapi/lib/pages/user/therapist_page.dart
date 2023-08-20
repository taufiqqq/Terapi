import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terapi/models/therapist.dart';

class TherapistPage extends StatefulWidget {
  final Therapist therapist;

  const TherapistPage({super.key, required this.therapist});

  @override
  State<TherapistPage> createState() => _TherapistPageState();
}

class _TherapistPageState extends State<TherapistPage> {
  int? sliding = 0;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Therapist Details'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AboutTherapist(
              therapist: widget.therapist,
            ),
            DetailBody(
              therapist: widget.therapist,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(
                    child: Text('Chat'),
                    onPressed: () {},
                  ),
                FilledButton(
                    child: Text('Book Appointment'),
                    onPressed: () {},
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AboutTherapist extends StatelessWidget {
  const AboutTherapist({Key? key, required this.therapist}) : super(key: key);

  final Therapist therapist;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage(therapist.gender == 'Male'
                ? 'lib/assets/img/therapist-2.jpg'
                : 'lib/assets/img/therapist-1.png'),
            backgroundColor: Colors.white,
          ),
          Text(
            therapist.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            child: const Text(
              'MBBS (International Medical University, Malaysia), MRCP (Royal College of Physicians, United Kingdom)',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            child: const Text(
              'Sarawak General Hospital',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  DetailBody({Key? key, required this.therapist}) : super(key: key);
  Therapist therapist;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TherapistInfo(
            patients: therapist.totalreview,
          ),
          const Text(
            'About Therapist',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Text(
            'Dr. ${therapist.name} is an experience ${therapist.specialization} at Sarawak, graduated since 2008, and completed his/her training at Sungai Buloh General Hospital.',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class TherapistInfo extends StatelessWidget {
  const TherapistInfo({Key? key, required this.patients}) : super(key: key);

  final int patients;
  final int exp = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InfoCard(
          label: 'Patients',
          value: '$patients',
        ),
        const SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Experiences',
          value: '$exp years',
        ),
        const SizedBox(
          width: 15,
        ),
        const InfoCard(
          label: 'Rating',
          value: '4.6',
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
