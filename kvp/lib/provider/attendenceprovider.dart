import 'package:flutter/material.dart';

class AttendenceProvider extends ChangeNotifier {
  final Map<DateTime, String> _attendence = {};

  Map<DateTime, String> get attendence {
    return _attendence;
  }

  void updateAttendence(DateTime date, String status) {
    _attendence[date] = status;
    notifyListeners();
  }

  String getStatus(DateTime date) {
    return _attendence[date] ?? "None";
  }
}
