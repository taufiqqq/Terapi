import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:terapi/pages/user/online_meeting.dart';

import '../../models/user.dart';
import '../../models/user.dart';

class TherapistAppointmentPage extends StatefulWidget {
  const TherapistAppointmentPage({Key? key}) : super(key: key);

  @override
  State<TherapistAppointmentPage> createState() =>
      _TherapistAppointmentPageState();
}

enum FilterStatus { past, future, cancelled }

class _TherapistAppointmentPageState extends State<TherapistAppointmentPage> {
  FilterStatus status = FilterStatus.future;

  List<UserClient> users = [
    UserClient(uid: '1', email: 'azhan@gmail.com', name: 'Azhan Haniff'),
    UserClient(uid: '2', email: 'azrul@gmail.com', name: 'Azrul Aiman'),
    UserClient(uid: '3', email: 'ambost@gmail.com', name: 'Am Arul'),
    UserClient(uid: '4', email: 'muhamad@gmail.com', name: 'Muhamad Solih'),
    UserClient(uid: '5', email: 'lai@gmail.com', name: 'Lai Xi Yi'),
    UserClient(
        uid: '6', email: 'thana@gmail.com', name: 'Thanabalan A/L Muthu'),
  ];

  List<Map<String, dynamic>> schedules = [
    {
      "appointmentId": "cancelled",
      "date": "2023-08-23",
      "status": "cancelled",
      "uid": "5",
      "time": "18:00",
    },
    {
      "appointmentId": "future",
      "date": "2023-11-20",
      "status": "future",
      "uid": "1",
      "time": "10:00",
    },
    {
      "appointmentId": "past",
      "date": "2023-08-20",
      "status": "past",
      "uid": "2",
      "time": "14:00",
    },
    {
      "appointmentId": "past",
      "date": "2022-04-11",
      "status": "past",
      "uid": "3",
      "time": "18:00",
    },
    {
      "appointmentId": "future",
      "date": "2023-12-30",
      "status": "future",
      "uid": "4",
      "time": "16:30",
    },
    {
      "appointmentId": "past",
      "date": "2022-01-02",
      "status": "past",
      "uid": "6",
      "time": "09:00",
    },
  ];

  late List<dynamic> filteredSchedules;

  @override
  void initState() {
    super.initState();
    updateFilteredSchedules();
  }

  void updateFilteredSchedules() {
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
                child: ListView.builder(
                  itemCount: filteredSchedules.length,
                  itemBuilder: ((context, index) {
                    var schedule = filteredSchedules[index];
                    bool isLastElement = filteredSchedules.length - 1 == index;

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
                            FutureBuilder<UserClient>(
                              future: Future.microtask(
                                  () => getUserClientById(schedule['uid'])),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }

                                UserClient user = snapshot.data!;

                                return Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'lib/assets/img/user_picture.jpg'),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user.name,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
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
                                children: []),
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

  UserClient getUserClientById(String id) {
    for (UserClient user in users) {
      if (user.uid == id) {
        return user;
      }
    }
    // Throw an exception if no therapist is found with the given ID
    throw Exception('User not found with ID: $id');
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
