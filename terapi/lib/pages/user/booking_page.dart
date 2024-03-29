import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terapi/pages/user/therapist_page.dart';

import '../../models/therapist.dart';
import '../../providers/therapist_providers.dart';

enum SortOption {
  Name,
  Review,
}

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<Therapist> therapists = TherapistProvider.therapists;
  
  int selectedGenderSegment = 0; // Initialize the selected gender segment

  void updateSelectedGenders(int segmentValue) {
    if (segmentValue == 0) {
      selectedGenders = []; // All genders selected
    } else if (segmentValue == 1) {
      selectedGenders = ['Male']; // Only Male selected
    } else if (segmentValue == 2) {
      selectedGenders = ['Female']; // Only Female selected
    }
  }

  bool toggleGender = false;
  bool toggleSpecialization = false;
  List<Therapist> filteredTherapists = [];
  SortOption sortOption = SortOption.Name;
  List<String> selectedGenders = [];
  List<String> selectedSpecializations = [];

  @override
  void initState() {
    super.initState();
    filteredTherapists = List.from(therapists);
  }

  void filterTherapists(String query) {
    setState(() {
      filteredTherapists = therapists.where((therapist) {
        return therapist.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void sortTherapists() {
    setState(() {
      if (sortOption == SortOption.Name) {
        filteredTherapists.sort((a, b) => a.name.compareTo(b.name));
      } else if (sortOption == SortOption.Review) {
        filteredTherapists.sort((a, b) => b.review.compareTo(a.review));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SafeArea(
          child: Image.asset(
            'lib/assets/img/TERAPI.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: filterTherapists,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text("Sort by Name"),
                                  onTap: () {
                                    setState(() {
                                      sortOption = SortOption.Name;
                                      sortTherapists();
                                    });
                                    Navigator.pop(context);
                                  },
                                ),ListTile(
                                  title: Text("Sort by Nearest Location"),
                                  onTap: () {
                                    setState(() {
                                      sortOption = SortOption.Review;
                                      sortTherapists();
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text("Sort by Review"),
                                  onTap: () {
                                    setState(() {
                                      sortOption = SortOption.Review;
                                      sortTherapists();
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                Divider(),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text("Toggle Gender"),
                                      Spacer(),
                                      CupertinoSlidingSegmentedControl<int>(
                                        groupValue: selectedGenderSegment,
                                        children: {
                                          0: Text("All"),
                                          1: Text("Male"),
                                          2: Text("Female"),
                                        },
                                        onValueChanged: (value) {
                                          setState(() {
                                            selectedGenderSegment = value!;
                                            updateSelectedGenders(value);
                                            print('dapat');
                                          });
                                          filterTherapists("");
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.filter_list),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTherapists.length,
              itemBuilder: (context, index) {
                final therapist = filteredTherapists[index];
                if ((selectedGenders.isNotEmpty &&
                        !selectedGenders.contains(therapist.gender)) ||
                    (selectedSpecializations.isNotEmpty &&
                        !selectedSpecializations
                            .contains(therapist.specialization))) {
                  return SizedBox
                      .shrink(); // Hide the therapist entry if not matching filters
                }
                return GestureDetector(
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage(therapist.gender == 'Male'
                            ? 'lib/assets/img/therapist-2.jpg'
                            : 'lib/assets/img/therapist-1.png'),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(therapist.name),
                        Text(therapist.specialization),
                        Text(therapist.location),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            Text("${therapist.review.toStringAsFixed(1)}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            (TherapistPage(therapist: therapist)),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BookingPage(),
  ));
}



                            /* ListTile(
                              title: Row(
                                children: [
                                  Text("Toggle Specialization"),
                                  Spacer(),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        for (String specialization in [
                                          'Psychologist',
                                          'Counselor',
                                          'Therapist',
                                          'Psychiatrist',
                                          'Life Coach'
                                        ])
                                          Row(
                                            children: [
                                              Checkbox(
                                                value: selectedSpecializations
                                                    .contains(specialization),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if (selectedSpecializations
                                                        .contains(
                                                            specialization)) {
                                                      selectedSpecializations
                                                          .remove(
                                                              specialization);
                                                    } else {
                                                      selectedSpecializations
                                                          .add(specialization);
                                                    }
                                                  });
                                                },
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (selectedSpecializations
                                                        .contains(
                                                            specialization)) {
                                                      selectedSpecializations
                                                          .remove(
                                                              specialization);
                                                    } else {
                                                      selectedSpecializations
                                                          .add(specialization);
                                                    }
                                                  });
                                                },
                                                child: Text(specialization),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ), */