import 'package:flutter/material.dart';

import '../../models/therapist.dart';

class RescheduleAppointment extends StatefulWidget {
  RescheduleAppointment(
      {super.key,
      required this.therapist,
      required this.date,
      required this.time});

  final String date;
  final String time;
  final Therapist therapist;

  @override
  State<RescheduleAppointment> createState() => _RescheduleAppointmentState();
}

class _RescheduleAppointmentState extends State<RescheduleAppointment> {
  late DateTime _date;
  late TimeOfDay _time;
  String _method = 'Online';
  String _reasons = '';

  @override
  void initState() {
    super.initState();
    // Initialize _date and _time using widget properties
    _date = DateTime.parse(widget.date);
    String timeString = widget.time;
    List<String> parts = timeString.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    _time = TimeOfDay(hour: hour, minute: minute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage(widget.therapist.gender == 'Male'
                  ? 'lib/assets/img/therapist-2.jpg'
                  : 'lib/assets/img/therapist-1.png'),
              backgroundColor: Colors.white,
            ),
            Text(widget.therapist.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildContainer(
              child: _buildDateTimePicker(
                labelText: 'Date',
                value: _date,
                selectDate: _selectDate,
              ),
            ),
            SizedBox(height: 16.0),
            _buildContainer(
              child: _buildDateTimePicker(
                labelText: 'Time',
                value: _time,
                selectDate: _selectTime,
              ),
            ),
            SizedBox(height: 16.0),
            _buildContainer(
              child: DropdownButtonFormField(
                value: _method,
                items: [
                  DropdownMenuItem(child: Text('Online'), value: 'Online'),
                  DropdownMenuItem(child: Text('Physical'), value: 'Physical'),
                ],
                onChanged: (value) {
                  setState(() {
                    _method = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 16.0),
            _buildContainer(
              child: TextField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
            ),
            SizedBox(height: 10),
            FilledButton(
                onPressed: () {
                  _saveAppointment();
                },
                child: Text('Update'))
          ],
        ),
      ),
    );
  }

  Widget _buildContainer({required Widget child}) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
      child: child,
    );
  }

  Widget _buildDateTimePicker({
    required String labelText,
    required dynamic value,
    required Function(BuildContext) selectDate,
  }) {
    return InkWell(
      onTap: () => selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.zero,
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today),
            SizedBox(width: 8.0),
            Text(value is DateTime
                ? _formattedDate(value)
                : _formattedTime(value)),
          ],
        ),
      ),
    );
  }

  String _formattedDate(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }

  String _formattedTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  void _selectDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then((date) {
      if (date != null) {
        setState(() {
          _date =
              DateTime(date.year, date.month, date.day); // Store formatted date
        });
      }
    });
  }

  void _selectTime(BuildContext context) {
    final now = TimeOfDay.now();
    final earliestTime = TimeOfDay(hour: 9, minute: 0);
    final latestTime = TimeOfDay(hour: 21, minute: 0); // 9 PM

    showTimePicker(
      context: context,
      initialTime: _time,
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    ).then((time) {
      if (time != null) {
        final selectedTimeInMinutes = time.hour * 60 + time.minute;
        final earliestTimeInMinutes =
            earliestTime.hour * 60 + earliestTime.minute;
        final latestTimeInMinutes = latestTime.hour * 60 + latestTime.minute;

        if (selectedTimeInMinutes >= earliestTimeInMinutes &&
            selectedTimeInMinutes <= latestTimeInMinutes) {
          setState(() {
            _time = time;
          });
        } else {
          // Display an error message using a Snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please select a time between 9 AM and 9 PM.'),
            ),
          );
        }
      }
    });
  }

  void _saveAppointment() {
    final earliestTime = TimeOfDay(hour: 9, minute: 0);
    final latestTime = TimeOfDay(hour: 21, minute: 0); // 9 PM

    final selectedTimeInMinutes = _time.hour * 60 + _time.minute;
    final earliestTimeInMinutes = earliestTime.hour * 60 + earliestTime.minute;
    final latestTimeInMinutes = latestTime.hour * 60 + latestTime.minute;

    if (selectedTimeInMinutes >= earliestTimeInMinutes &&
        selectedTimeInMinutes <= latestTimeInMinutes) {
      print(_formattedDate(_date));
      print(_formattedTime(_time));
      print(widget.therapist.therapistId);

      Navigator.pop(context);
    } else {
      // Display an error message using a Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a time between 9 AM and 9 PM.'),
        ),
      );
    }
  }
}
