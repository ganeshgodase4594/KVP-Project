import 'package:flutter/material.dart';

class TimeProvider with ChangeNotifier {
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

  TimeOfDay get startTime => _startTime;
  TimeOfDay get endTime => _endTime;

  void setStartTime(TimeOfDay time) {
    _startTime = time;
    notifyListeners();
  }

  void setEndTime(TimeOfDay time) {
    _endTime = time;
    notifyListeners();
  }

  /*
  Written the start and end time....
  */

  TimeOfDay getStartTime() => _startTime;
  TimeOfDay getEndTime() => _endTime;
}
