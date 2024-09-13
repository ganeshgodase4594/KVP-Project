// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:kvp/provider/girlidprovider.dart';
// import 'package:provider/provider.dart';

// class AttendenceProvider extends ChangeNotifier {
//   final Map<String, Map<DateTime, String>> _getAttendence = {};
//   final Map<DateTime, String> _attendence = {};

//   Map<DateTime, String> get updatedAttendence => _attendence;

//   void updateAttendence(DateTime date, String status, BuildContext context) {
//     String girlid =
//         Provider.of<GirlIdProvider>(context, listen: false).selectedgirlid!;

//     print("girl id is : $girlid");

//     String formattedDate = DateFormat("yyyy-MM-dd").format(date);
//     _attendence.clear();

//     try {
//       FirebaseFirestore.instance
//           .collection("girldetails")
//           .doc(girlid)
//           .collection("attendance")
//           .doc(formattedDate)
//           .set({"date": date, "status": status});
//     } catch (e) {
//       print("data is not added");
//     }

//     _attendence[date] = status;
//     //notifyListeners();
//   }

//   Future fetchAttendenceData(String girlid, DateTime time) async {
//     final attendenceCollection = await FirebaseFirestore.instance
//         .collection("girldetails")
//         .doc(girlid)
//         .collection("attendance")
//         .get();

//     for (var doc in attendenceCollection.docs) {
//       final status = doc['status'];

//       // here we perform timestamp to datetime conversion

//       DateTime date = doc['date'].toDate();

//       if (date == time) {
//         _attendence[date] = status;
//       }
//     }
//     notifyListeners();
//   }

//   String getStatus(DateTime date, BuildContext context, String girlId) {
//     final girlid =
//         Provider.of<GirlIdProvider>(context, listen: false).selectedgirlid!;
//     fetchAttendenceData(girlid, date);

//     return _attendence[date] ?? 'A';
//   }
// }

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
      print("data is not added");
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
      DateTime date = doc['date'].toDate();
      tempAttendence[date] = status;
    }

    _getAttendence[girlid] = tempAttendence;

    notifyListeners();
  }

  String getStatus(DateTime date, BuildContext context, String girlid) {
    fetchAttendenceData(girlid);
    return _getAttendence[girlid]?[date] ?? 'A';
  }
}
