import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { past, future, cancelled }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.future;

  List<dynamic> schedules = [
    {
      "name": "Dr Hazimah",
      "doctor_profile": "lib/assets/img/therapist-1.png",
      "specialization": "Psychiatrist",
      "status": "future",
      "date": "111",
      "day": "111",
      "time": "111",
    },
    {
      "name": "Dr Hazimah 2",
      "doctor_profile": "lib/assets/img/therapist-1.png",
      "specialization": "Islamic Consultant",
      "status": "past",
      "date": "111",
      "day": "111",
      "time": "111",
    },
    {
      "name": "Dr Hazimah s",
      "doctor_profile": "lib/assets/img/therapist-1.png",
      "specialization": "Family Doctor",
      "status": "cancelled",
      "date": "111",
      "day": "111",
      "time": "111",
    }
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
        title: Text('Appointment'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    schedule['doctor_profile'],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      schedule['name'],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      schedule['specialization'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ScheduleCard(
                              date: schedule['date'],
                              day: schedule['day'],
                              time: schedule['time'],
                            ),
                            const SizedBox(height: 15),

                            //condition please
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (status == FilterStatus.future) ...[
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Cancel',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Reschedule',
                                      ), //TODO if time is near, then it will says JOIN
                                    ),
                                  ),
                                ] else if (status == FilterStatus.past) ...[
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Completed',
                                      ),
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
  const ScheduleCard(
      {Key? key, required this.date, required this.day, required this.time})
      : super(key: key);
  final String date;
  final String day;
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
            /*  color: Config.primaryColor, */
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '$day, $date',
            /* style: const TextStyle(
              color: Config.primaryColor,
            ), */
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.access_alarm,
            /* 
            color: Config.primaryColor, */
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
