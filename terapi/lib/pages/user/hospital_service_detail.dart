import 'package:flutter/material.dart';

import '../../models/hospital_dataset.dart';

class HospitalServiceDetail extends StatelessWidget {
  final Hospital hospital;

  HospitalServiceDetail({required this.hospital});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hospital: ${hospital.hospital}'),
            Text('State: ${hospital.state}'),
            Text('Phone: ${hospital.phone}'),
          ],
        ),
      ),
    );
  }
}
