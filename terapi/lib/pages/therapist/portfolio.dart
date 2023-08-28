import 'package:flutter/material.dart';

import '../../models/therapist.dart';
import '../../providers/therapist_providers.dart';

class TherapistPortfolio extends StatefulWidget {
  @override
  _TherapistPortfolioState createState() => _TherapistPortfolioState();
}

class _TherapistPortfolioState extends State<TherapistPortfolio> {
  Therapist therapist = TherapistProvider.therapists[1];

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: therapist.name);
    TextEditingController specializationController =
        TextEditingController(text: therapist.specialization);
    TextEditingController agencyController =
        TextEditingController(text: "En Karim Therapy Agency");

    return Scaffold(
      appBar: AppBar(title: Text('My Portfolio')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: specializationController,
                decoration: InputDecoration(
                  labelText: 'Specialization',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: agencyController,
                decoration: InputDecoration(
                  labelText: 'Specialization',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              const Text(
                'About Therapist',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              TextField(
                controller: TextEditingController(
                  text:
                      '${therapist.name} is an experienced ${therapist.specialization} based in ${therapist.location}. With a passion for helping others, ${therapist.name} embarked on a journey in the field of psychology. Graduating with a Bachelors Degree in Psychology in 2005, they have accumulated more than 10 years of valuable experience in their practice. Throughout their career, ${therapist.name} has been dedicated to making a positive impact on individuals mental well-being. Their commitment to improving lives led them to undergo rigorous training at Hospital Sultanah Aminah, where they honed their skills as a psychology professional.',
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
              ),
              Center(
                child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Update')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
