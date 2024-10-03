import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  List<Map<String, dynamic>> collectiondata = [];
  List<Map<String, dynamic>> filteredData = [];

  void setCollectionData(List<Map<String, dynamic>> data) {
    collectiondata = data;
    filteredData = data; // Initially, filtered data will be the whole list
    notifyListeners();
  }

  void filterData(String query) {
    if (query.isEmpty) {
      filteredData = collectiondata; // Show all data if search is empty
    } else {
      filteredData = collectiondata
          .where((girl) => girl['name of girl']
              .toLowerCase()
              .startsWith(query.toLowerCase())) // Only start with search
          .toList();
    }
    notifyListeners();
  }
}
