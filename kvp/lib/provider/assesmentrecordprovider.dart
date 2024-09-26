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
  final Map<String, bool> _isAssessmentAdded = {};

/*
  Created The List of year....
*/
  final List<String> years = List.generate(301, (index) {
    int currentYear = DateTime.now().year;
    return (currentYear - 100 + index).toString();
  });

/*
 List Of Menu item in reults 
 */
  final List<String> result = ["satisfactory", "good", "needs improvements"];
  final List<String> finalresult = ["progress", "regress", "stable"];
  final List<String> quarter = ["Q1", "Q2", "Q3"];

  String? get selectedYear => _selectedYear;
  String? get selectedPreResult => _selectedpreresult;
  String? get selectedPostResult => _selectedpostresult;
  String? get selectedFinalResult => _selectedfinalresult;
  String? get selectedQuarter => _selectquarter;
  Map<String, bool> get isAssessmentAdded => _isAssessmentAdded;

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

  /*
  Function To Store Assessment Record....
  */

  Future<void> storeAssessmentRecord(BuildContext context) async {
    String girlId =
        Provider.of<GirlIdProvider>(listen: false, context).selectedgirlid!;
    if (_selectquarter == null ||
        _selectedpreresult == null ||
        _selectedpostresult == null ||
        _selectedfinalresult == null) {
      log("all fields must be selected");

      /*
  Used GetX controller snackbar....
  */
      SnacKBar.error(
          title: "Fields are Empty",
          message: "Please complete all the text fields");
      return;
    }

    try {
      // Reference to the year document under assessmentrecord
      DocumentReference yearDocRef = FirebaseFirestore.instance
          .collection("girldetails")
          .doc(girlId)
          .collection("assessmentrecord")
          .doc(_selectedYear);

      // Initialize the year document with dummy data if it doesn't exist
      await yearDocRef.set(
        {
          "initialized": true, // Dummy field to ensure the document exists
        },
      );

      // Reference to the quarter document under the specified year
      DocumentReference quarterDocRef =
          yearDocRef.collection('quarter').doc(_selectquarter);

      // Set the assessment data with dummy initialization
      await quarterDocRef.set(
        {
          "preassessment": _selectedpreresult,
          "postassessment": _selectedpostresult,
          "result": _selectedfinalresult,
        },
      );

      notifyListeners();
      SnacKBar.success(
        message:
            " ${Provider.of<AssesmentRecordProvider>(context, listen: false).selectedQuarter} Assessment Record Saved successfully.",
        title: "Success",
      );
      Provider.of<AssesmentRecordProvider>(context, listen: false)
          .clearDropdown();

      log("asssessment record saved successfully");
    } catch (e) {
      log("Error saving assessment data: $e");

      notifyListeners();
    }
  }

  Future<void> checkAssessmentRecord(String girlIds) async {
    bool exists = false;
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection("girldetails")
          .doc(girlIds)
          .collection("assessmentrecord")
          .get();

      log("Number of documents found for girlId $girlIds: ${snapshot.size}");

      exists = snapshot.docs.isNotEmpty;
      log("Assessment record exists for girlId $girlIds: $exists");

      _isAssessmentAdded[girlIds] = exists;

      notifyListeners();
    } catch (e) {
      log("Error checking assessment record for girlId $girlIds: $e");
      _isAssessmentAdded[girlIds] = exists;
      notifyListeners();
    }
  }

  /*
  When We click on submit then its clear the dropdownfield....
  */

  void clearDropdown() {
    _selectedYear = DateTime.now().year.toString();
    _selectquarter = null;
    _selectedpreresult = null;
    _selectedpostresult = null;
    _selectedfinalresult = null;
    notifyListeners();
  }
}
