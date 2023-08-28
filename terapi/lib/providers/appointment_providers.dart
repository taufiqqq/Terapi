class AppointmentProvider {
  List<Map<String, dynamic>> schedules = [];
  static final AppointmentProvider _instance = AppointmentProvider._internal();

  factory AppointmentProvider() {
    return _instance;
  }

  AppointmentProvider._internal();
  
  void addAppointment(
      String date, String status, String therapistId, String time, String uid) {
    // Create a new map for the appointment
    Map<String, dynamic> newAppointment = {
      "date": date,
      "status": status,
      "therapistId": therapistId,
      "time": time,
      "uid": uid,
    };

    // Add the new appointment to the schedules list
    schedules.add(newAppointment);
  }

  void initialize() {
    schedules = [
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
  }

  void cancelAppointment(
      String date, String therapistId, String time, String uid) {
    final appointmentIndex = schedules.indexWhere((appointment) =>
        appointment['date'] == date &&
        appointment['therapistId'] == therapistId &&
        appointment['time'] == time &&
        appointment['uid'] == uid);

    if (appointmentIndex != -1) {
      schedules[appointmentIndex]['status'] = 'cancelled';
    }
  }

  void rescheduleAppointment(String date, String time, String therapistId, String uid, String newDate, String newTime) {
  final appointmentIndex = schedules.indexWhere((appointment) =>
      appointment['date'] == date &&
      appointment['time'] == time &&
      appointment['therapistId'] == therapistId &&
      appointment['uid'] == uid);

  if (appointmentIndex != -1) {
    schedules[appointmentIndex]['date'] = newDate;
    schedules[appointmentIndex]['time'] = newTime;
  }
}

  List<Map<String, dynamic>> get allSchedules => schedules;
}
