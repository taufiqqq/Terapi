import 'package:flutter/material.dart';
import 'package:terapi/pages/user/hospital_page.dart';

import '../../models/hospital_dataset.dart';

class HospitalListScreen extends StatefulWidget {
  @override
  _HospitalListScreenState createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  final List<Hospital> hospitals = [
    Hospital(
      state: 'Perlis',
      hospital: 'Hospital Tuanku Fauziah',
      phone: '04-9738000',
    ),
    Hospital(
      state: 'Perak',
      hospital: 'Hosp. Raja Permaisuri Bainun',
      phone: '05-2085000',
    ),
    Hospital(
      state: 'Perak',
      hospital: 'Hospital Taiping',
      phone: '05-820 4000',
    ),
    Hospital(
      state: 'Perak',
      hospital: 'Hospital Teluk Intan',
      phone: '05-6218400',
    ),
    Hospital(
      state: 'Pulau Pinang',
      hospital: 'Hospital Pulau Pinang',
      phone: '04-2225333',
    ),
    Hospital(
      state: 'Pulau Pinang',
      hospital: 'Hospital Seberang Jaya',
      phone: '04-3827333',
    ),
    Hospital(
      state: 'Pulau Pinang',
      hospital: 'Hospital Bukit Mertajam',
      phone: '04-5497333',
    ),
    Hospital(
      state: 'Kedah',
      hospital: 'Hosp. Sultanah Bahiyah',
      phone: '04-7406233',
    ),
    Hospital(
      state: 'Kedah',
      hospital: 'Hospital Sultan Abdul Halim',
      phone: '04-4457333',
    ),
    Hospital(
      state: 'Selangor',
      hospital: 'Hospital Sungai Buloh',
      phone: '03-61454333',
    ),
    Hospital(
      state: 'Selangor',
      hospital: 'Hospital Selayang',
      phone: '03-61367788',
    ),
    Hospital(
      state: 'Selangor',
      hospital: 'Hospital Kajang',
      phone: '03-89133333',
    ),
    Hospital(
      state: 'Selangor',
      hospital: 'Hospital Banting',
      phone: '03-31871333',
    ),
    Hospital(
      state: 'Selangor',
      hospital: 'Hospital Ampang',
      phone: '03-42896000',
    ),
    Hospital(
      state: 'Selangor',
      hospital: 'Hospital Shah Alam',
      phone: '03-55263000',
    ),
    Hospital(
      state: 'Kuala Lumpur',
      hospital: 'Hospital Kuala Lumpur',
      phone: '03-26155555',
    ),
    Hospital(
      state: 'Kuala Lumpur',
      hospital: 'Hospital Kuala Lumpur',
      phone: '03-26155555',
    ),
    Hospital(
      state: 'Putrajaya',
      hospital: 'Hospital Putrajaya',
      phone: '03-83124200',
    ),
    Hospital(
      state: 'Negeri Sembilan',
      hospital: 'Hospital Kuala Lumpur',
      phone: '03-26155555',
    ),
    Hospital(
      state: 'Melaka',
      hospital: 'Hospital Melaka',
      phone: '06-2892344',
    ),
    Hospital(
      state: 'Johor',
      hospital: 'Hospital Sultanah Aminah',
      phone: '07-2257000',
    ),
    Hospital(
      state: 'Johor',
      hospital: 'Hospital Sultan Ismail',
      phone: '07-3565000',
    ),
    Hospital(
      state: 'Johor',
      hospital: 'Hospital Kota Tinggi',
      phone: '07-8831131',
    ),
    Hospital(
      state: 'Pahang',
      hospital: 'Hospital Tengku Ampuan Afzan',
      phone: '09-5133333',
    ),
    Hospital(
      state: 'Terengganu',
      hospital: 'Hospital Kemaman',
      phone: '09-8513333',
    ),
    Hospital(
      state: 'Kelantan',
      hospital: 'Hospital Raja Perempuan Zainab II',
      phone: '09-7452000',
    ),
    Hospital(
      state: 'Kelantan',
      hospital: 'Hospital Pasir Mas',
      phone: '07-8831131',
    ),
    Hospital(
      state: 'Sarawak',
      hospital: 'Hospital Umum Kuching',
      phone: '082-276666',
    ),
    Hospital(
      state: 'Sarawak',
      hospital: 'Hospital Sentosa',
      phone: '082-612321',
    ),
    Hospital(
      state: 'Sabah',
      hospital: 'Hospital Queen Elizabeth II',
      phone: '088-324600',
    ),
    Hospital(
      state: 'Sabah',
      hospital: 'Hospital Duchess Of Kent',
      phone: '089-248600',
    ),
  ];

  List<Hospital> filteredHospitals = [];

  @override
  void initState() {
    super.initState();
    filteredHospitals = hospitals;
  }

  void filterHospitals(String query) {
    setState(() {
      filteredHospitals = hospitals.where((hospital) {
        final name = hospital.hospital.toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              onChanged: filterHospitals,
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.shade100),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredHospitals.length,
              itemBuilder: (context, index) {
                final hospital = filteredHospitals[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HospitalPage(hospital: hospital),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            hospital.hospital.substring(0, 1),
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        title: Text(hospital.hospital),
                        subtitle:
                            Text('${hospital.state}, Phone: ${hospital.phone}'),
                      ),
                    ),
                    Divider(
                      color: Colors.grey, // Customize the color as needed
                      thickness: 1.0, // Customize the thickness as needed
                      indent: 16.0, // Customize the left indent as needed
                      endIndent: 16.0, // Customize the right indent as needed
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
