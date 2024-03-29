import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:terapi/pages/user/online_meeting.dart';
import 'package:terapi/pages/user/review_therapist.dart';
import 'package:terapi/pages/user/view_review.dart';

import '../../models/therapist.dart';
import '../../providers/appointment_providers.dart';
import '../../providers/therapist_providers.dart';
import 'appointment_reschedule.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { past, future, cancelled }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.future;
  late List<dynamic> filteredSchedules;
  late AppointmentProvider appointmentProvider;
  @override
  void initState() {
    super.initState();
    appointmentProvider = AppointmentProvider();
    updateFilteredSchedules();
  }

  void updateFilteredSchedules() {
    final schedules = appointmentProvider.allSchedules;

    filteredSchedules = schedules.where((schedule) {
      switch (schedule['status']) {
        case 'future':
          schedule['status'] = FilterStatus.future.toString();
          break;
        case 'past':
          schedule['status'] = FilterStatus.past.toString();
          break;
        case 'cancelled':
          schedule['status'] = FilterStatus.cancelled.toString();
          break;
      }
      return schedule['status'] == status.toString();
    }).toList();

    if (status == FilterStatus.future) {
      filteredSchedules.sort((a, b) {
        final DateTime dateTimeA = DateTime.parse('${a['date']} ${a['time']}');
        final DateTime dateTimeB = DateTime.parse('${b['date']} ${b['time']}');
        return dateTimeA.compareTo(dateTimeB);
      });
    }
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'My Appointment',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(10),
              CupertinoSlidingSegmentedControl(
                children: const {
                  FilterStatus.cancelled: Text('Cancelled'),
                  FilterStatus.past: Text('Past'),
                  FilterStatus.future: Text('Future'),
                },
                onValueChanged: (newStatus) {
                  setState(() {
                    status = newStatus!;
                    updateFilteredSchedules();
                  });
                },
                groupValue: status,
              ),
              Gap(10),
              Expanded(
                child: filteredSchedules.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sentiment_satisfied,
                            size: 48,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No appointment yet',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        itemCount: filteredSchedules.length,
                        itemBuilder: ((context, index) {
                          var schedule = filteredSchedules[index];
                          bool isLastElement =
                              filteredSchedules.length - 1 == index;

                          return Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: !isLastElement
                                ? const EdgeInsets.only(bottom: 20)
                                : EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  FutureBuilder<Therapist>(
                                    future: Future.microtask(() =>
                                        TherapistProvider.getTherapistById(
                                            schedule['therapistId'])),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircularProgressIndicator();
                                      }
                                      if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      }

                                      Therapist therapist = snapshot.data!;

                                      return Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                              therapist.gender == 'Male'
                                                  ? 'lib/assets/img/therapist-2.jpg'
                                                  : 'lib/assets/img/therapist-1.png',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                therapist.name,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                therapist.specialization,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ScheduleCard(
                                    date: schedule['date'],
                                    time: schedule['time'],
                                  ),
                                  const SizedBox(height: 15),

                                  //condition please
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (status == FilterStatus.future) ...[
                                        OutlinedButton(
                                          onPressed: () {
                                            // Show the confirmation dialog
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Confirm Cancellation'),
                                                  content: Text(
                                                      'Are you sure you want to cancel this appointment?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(); // Close the dialog
                                                      },
                                                      child: Text('No'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        // User confirmed, cancel the appointment
                                                        appointmentProvider
                                                            .cancelAppointment(
                                                          schedule['date'],
                                                          schedule[
                                                              'therapistId'],
                                                          schedule['time'],
                                                          schedule['uid'],
                                                        );

                                                        // Update the filtered schedules
                                                        updateFilteredSchedules();

                                                        // Close the dialog
                                                        Navigator.of(context)
                                                            .pop();

                                                        // Refresh the UI by calling setState
                                                        setState(() {});
                                                      },
                                                      child: Text('Yes'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: const Text('Cancel',
                                              style:
                                                  TextStyle(color: Colors.red)),
                                        ),
                                        OutlinedButton(
                                          onPressed: () async {
                                            Therapist therapist =
                                                TherapistProvider
                                                    .getTherapistById(schedule[
                                                        'therapistId']);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RescheduleAppointment(
                                                  therapist: therapist,
                                                  date: schedule['date'],
                                                  time: schedule['time'],
                                                ),
                                              ),
                                            ).then((_) {
                                              updateFilteredSchedules();
                                              setState(() {});
                                            });
                                          },
                                          child: const Text('Reschedule'),
                                        ),
                                        FilledButton(
                                          onPressed: () async {
                                            Therapist therapist =
                                                TherapistProvider
                                                    .getTherapistById(schedule[
                                                        'therapistId']);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    OnlineMeeting(
                                                        therapist: therapist),
                                              ),
                                            );
                                          },
                                          child: const Text('Join'),
                                        ),
                                      ] else if (status ==
                                          FilterStatus.past) ...[
                                        OutlinedButton(
                                          onPressed: () {
                                            Therapist therapist =
                                                TherapistProvider
                                                    .getTherapistById(schedule[
                                                        'therapistId']);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewResult(
                                                        therapist: therapist,
                                                        date: schedule['date']),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Appointment Result',
                                          ),
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            Therapist therapist =
                                                TherapistProvider
                                                    .getTherapistById(schedule[
                                                        'therapistId']);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ReviewTherapist(
                                                        therapist: therapist,
                                                        date: schedule['date']),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Review Therapist',
                                          ),
                                        ),
                                      ] else if (status ==
                                          FilterStatus.cancelled) ...[
                                        Expanded(
                                          child: Text(
                                            'Cancelled',
                                            style: TextStyle(color: Colors.red),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ]
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key, required this.date, required this.time})
      : super(key: key);
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Icon(
            Icons.calendar_today,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            date,
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.access_alarm,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            time,
            /* style: const TextStyle(
              color: Config.primaryColor,
            ), */
          ))
        ],
      ),
    );
  }
}
