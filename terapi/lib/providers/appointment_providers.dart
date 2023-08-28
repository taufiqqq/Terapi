import '../models/appointment.dart';

class AppointmentProvider{
  List<Appointment> _appointments = [];

  AppointmentProvider() {
    _initializeAppointments();
  }

  void _initializeAppointments() {
    List<Map<String, dynamic>> schedules = [
      {
        "date": "2023-08-23",
        "status": "cancelled",
        "therapistId": "5",
        "time": "18:00",
        "uid": "BN3lVxppOshEEYqJ6VE4ZyXbKUV2",
      },
      {
        "date": "2023-11-20",
        "status": "future",
        "therapistId": "1",
        "time": "10:00",
        "uid": "BN3lVxppOshEEYqJ6VE4ZyXbKUV2",
      },
      {
        "date": "2023-08-20",
        "status": "past",
        "therapistId": "2",
        "time": "14:00",
        "uid": "BN3lVxppOshEEYqJ6VE4ZyXbKUV2",
      },
    ];

    _appointments = schedules
        .map((schedule) => Appointment(
              date: schedule['date'],
              status: schedule['status'],
              therapistId: schedule['therapistId'],
              time: schedule['time'],
              uid: schedule['uid'],
            ))
        .toList();
  }

  List<Appointment> get appointments => _appointments;

  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
  }
}
