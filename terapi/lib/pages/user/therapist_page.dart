import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terapi/models/therapist.dart';
import 'package:terapi/pages/user/appointment_detail_page.dart';

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
            FilledButton(
              child: Text('Book Appointment', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            (AppointmentDetail(therapist: widget.therapist))));
              },
            ),
            SizedBox(
              height: 10,
            )
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align children to the top
              children: [
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage(therapist.gender == 'Male'
                      ? 'lib/assets/img/therapist-2.jpg'
                      : 'lib/assets/img/therapist-1.png'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                    width:
                        16.0), // Add some space between the CircleAvatar and Column
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Text(
                        therapist.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                      ),
                      Text(
                        therapist.specialization,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        softWrap: true,
                      ),
                      Text(
                        '${therapist.name} Therapy Agency',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.chat,
                            color: Color.fromARGB(255, 33, 150, 243),
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Chat Now',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 33, 150, 243))),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 33, 150, 243),
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Call Now',
                              style: TextStyle(color: Colors.blue)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
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
            totalReviews: therapist.totalreview,
            rating: therapist.review,
          ),
          SizedBox(height: 20),
          const Text(
            'About Therapist',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            '${therapist.name} is an experienced ${therapist.specialization} based in ${therapist.location}. With a passion for helping others, ${therapist.name} embarked on a journey in the field of psychology. Graduating with a Bachelors Degree in Psychology in 2005, they have accumulated more than 10 years of valuable experience in their practice. Throughout their career, ${therapist.name} has been dedicated to making a positive impact on individuals mental well-being. Their commitment to improving lives led them to undergo rigorous training at Hospital Sultanah Aminah, where they honed their skills as a psychology professional.',
            style: const TextStyle(
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class TherapistInfo extends StatelessWidget {
  const TherapistInfo(
      {Key? key, required this.rating, required this.totalReviews})
      : super(key: key);

  final double rating;
  final int totalReviews;
  final int exp = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: [Colors.yellow, Colors.yellow.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rating',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  rating.toStringAsFixed(
                      1), // Display rating with one decimal place
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade900,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Patients',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  totalReviews.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: [Colors.red.shade300, Colors.red.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Experience',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$exp years',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
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
