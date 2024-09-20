import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kvp/provider/girlidprovider.dart';
import 'package:provider/provider.dart';

import '../screen/assesmendata.dart';

class AssesmentRecordProvider extends ChangeNotifier {
  String _selectedYear = DateTime.now().year.toString();
  String? _selectedpreresult;
  String? _selectedpostresult;
  String? _selectedfinalresult;
  String? _selectquarter;

  final List<String> years = List.generate(301, (index) {
    int currentYear = DateTime.now().year;
    return (currentYear - 100 + index).toString();
  });

  final List<String> result = ["satisfactory", "good", "needs improvements"];
  final List<String> finalresult = ["progress", "regress", "stable"];
  final List<String> quarter = ["Q1", "Q2", "Q3"];

  String? get selectedYear => _selectedYear;
  String? get selectedPreResult => _selectedpreresult;
  String? get selectedPostResult => _selectedpostresult;
  String? get selectedFinalResult => _selectedfinalresult;
  String? get selectedQuarter => _selectquarter;

  void storeSelectedYear(String year) {
    _selectedYear = year;
    notifyListeners();
  }

  void storeSelectedPreResult(String preresult) {
    _selectedpreresult = preresult;
    notifyListeners();
  }

  void storeSelectedPostResult(String postresult) {
    _selectedpostresult = postresult;
    notifyListeners();
  }

  void storeSelectedFinalResult(String finalresult) {
    _selectedfinalresult = finalresult;
    notifyListeners();
  }

  void storeSelectedQuarter(String quarter) {
    _selectquarter = quarter;
    notifyListeners();
  }

  Future<void> storeAssessmentRecord(BuildContext context) async {
    String girlId =
        Provider.of<GirlIdProvider>(listen: false, context).selectedgirlid!;
    if (_selectquarter == null ||
        _selectedpreresult == null ||
        _selectedpostresult == null ||
        _selectedfinalresult == null) {
      print("all fields must be selected");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Complete All Text Fields"),
        ),
      );
      return;
    }

    try {
      FirebaseFirestore.instance
          .collection("girldetails")
          .doc(girlId)
          .collection('assessmentrecord')
          .doc(_selectedYear)
          .collection('quarter')
          .doc(_selectquarter)
          .set({
        "preassessment": _selectedpreresult,
        "postassessment": _selectedpostresult,
        "result": _selectedfinalresult
      });
      submitMessage(context);
      print("asssessment record saved successfully");
    } catch (e) {
      print("Error saving assessment data: $e");
    }
  }

  void clearDropdown() {
    _selectedYear = DateTime.now().year.toString();
    _selectquarter = null;
    _selectedpreresult = null;
    _selectedpostresult = null;
    _selectedfinalresult = null;
    notifyListeners();
  }
}
