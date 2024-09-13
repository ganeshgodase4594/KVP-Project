import 'package:flutter/material.dart';

class GirlIdProvider extends ChangeNotifier {
  String? _girlid;

  String? get selectedgirlid => _girlid;

  void storegirlid(String id) {
    _girlid = id;
    //notifyListeners();
  }
}
