import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kvp/provider/girlidprovider.dart';
import 'package:provider/provider.dart';
import '../components/snackbar.dart';

class AssesmentRecordProvider extends ChangeNotifier {
  String _selectedYear = DateTime.now().year.toString();
  String? _selectedpreresult;
  String? _selectedpostresult;
  String? _selectedfinalresult;
  String? _selectquarter;
  bool _isAssessmentAdded = false;

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
  bool get isAssessmentAdded => _isAssessmentAdded;

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
      log("all fields must be selected");

      SnacKBar.error(
          title: "Fields are Empty",
          message: "Please complete all the text fields");
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
      _isAssessmentAdded = true;
      notifyListeners();
      SnacKBar.success(
          message:
              " ${Provider.of<AssesmentRecordProvider>(context, listen: false).selectedQuarter} Assessment Record Saved successfully.",
          title: "Success",
          context: context);
      Provider.of<AssesmentRecordProvider>(context, listen: false)
          .clearDropdown();

      log("asssessment record saved successfully");
    } catch (e) {
      log("Error saving assessment data: $e");
      _isAssessmentAdded = false;
      notifyListeners();
    }
  }

  Future<void> checkAssessmentRecord() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("girldetails")
        .doc()
        .collection('assessmentrecord')
        .doc(_selectedYear)
        .collection('quarter')
        .doc(_selectquarter)
        .get();

    _isAssessmentAdded = snapshot.exists;
    notifyListeners();
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
