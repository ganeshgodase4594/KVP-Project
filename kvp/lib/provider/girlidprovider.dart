import 'package:flutter/material.dart';

class GirlIdProvider extends ChangeNotifier {
  String? _girlid;
  String? _girlName;

  String? get selectedgirlid => _girlid;
  String? get selectgirlname => _girlName;

  void storegirlid(String id) {
    _girlid = id;
    print("storegirlid is : $id");
    //notifyListeners();
  }

  void storeGirlName(String girlname) {
    _girlName = girlname;
  }
}
