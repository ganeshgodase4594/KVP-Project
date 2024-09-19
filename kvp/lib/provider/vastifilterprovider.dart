import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VastiProvider with ChangeNotifier {
  List<Map<String, dynamic>> collectiondata = [];
  List<Map<String, dynamic>> _filteredData = [];
  String _selectedVasti = "";
  String _selectedVibhag = "";

  List<Map<String, dynamic>> get filteredData => _filteredData;
  String get selectedVasti => _selectedVasti;
  String get selectedVibhag => _selectedVibhag;

  void setSelectedVasti(String vasti) {
    _selectedVasti = vasti;
    _filterData();
    notifyListeners();
  }

  void setSelectedVibhag(String vibhag) {
    _selectedVibhag = vibhag;
    _filterData();
    notifyListeners();
  }

  void clearSelectedVibhag() {
    _selectedVibhag = '';
    _filterData();
    notifyListeners();
  }

  void clearSelectedVasti() {
    _selectedVasti = '';
    _filterData();
    notifyListeners();
  }

  Future<void> fetchAllData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("girldetails").get();

    for (QueryDocumentSnapshot document in snapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      data['id'] = document.id;
      collectiondata.add(data);
    }

    _filteredData = List.from(collectiondata);
    notifyListeners();
  }

  void _filterData() {
    _filteredData.clear();

    if (_selectedVasti.isEmpty && _selectedVibhag.isEmpty) {
      _filteredData = List.from(collectiondata);
    } else {
      for (var data in collectiondata) {
        if (_selectedVasti.isNotEmpty && _selectedVibhag.isNotEmpty) {
          if (data['vasti name'] == _selectedVasti &&
              data['vibhag name'] == _selectedVibhag) {
            _filteredData.add(data);
          }
        } else if (_selectedVasti.isNotEmpty) {
          if (data['vasti name'] == _selectedVasti) {
            _filteredData.add(data);
          }
        } else if (_selectedVibhag.isNotEmpty) {
          if (data['vibhag name'] == _selectedVibhag) {
            _filteredData.add(data);
          }
        }
      }
    }
    notifyListeners();
  }
}
