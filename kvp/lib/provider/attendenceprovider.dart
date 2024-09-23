import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendenceProvider extends ChangeNotifier {
  final Map<String, Map<DateTime, String>> _getAttendence = {};
  final Map<DateTime, String> _attendence = {};

  Map<DateTime, String> get updatedAttendence => _attendence;

  void updateAttendence(
      DateTime date, String status, BuildContext context, String girlId) {
    String formattedDate = DateFormat("yyyy-MM-dd").format(date);

    try {
      FirebaseFirestore.instance
          .collection("girldetails")
          .doc(girlId)
          .collection("attendance")
          .doc(formattedDate)
          .set({"date": date, "status": status});

      _attendence[date] = status;

      if (_getAttendence[girlId] != null) {
        _getAttendence[girlId]![date] = status;
      } else {
        _getAttendence[girlId] = {date: status};
      }

      notifyListeners();
    } catch (e) {
      log("data is not added");
    }
  }

  Future fetchAttendenceData(String girlid) async {
    final attendenceCollection = await FirebaseFirestore.instance
        .collection("girldetails")
        .doc(girlid)
        .collection("attendance")
        .get();

    Map<DateTime, String> tempAttendence = {};

    for (var doc in attendenceCollection.docs) {
      final status = doc['status'];
      DateTime date = doc['date']
          .toDate(); // used for convert the timestamp (Firebase) to DateTime....
      tempAttendence[date] = status;
    }

    _getAttendence[girlid] = tempAttendence;

    notifyListeners();
  }

  // Written the current attendence status....

  String getStatus(DateTime date, BuildContext context, String girlid) {
    fetchAttendenceData(girlid);
    return _getAttendence[girlid]?[date] ?? 'A';
  }
}
