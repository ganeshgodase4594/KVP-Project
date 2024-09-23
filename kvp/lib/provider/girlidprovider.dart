import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GirlIdProvider extends ChangeNotifier {
  String? _girlid;
  String? _girlName;
  List<String> _girlIds = [];

  String? get selectedgirlid => _girlid;
  String? get selectgirlname => _girlName;
  List<String> get girlIds => _girlIds;

  /*
  Store girl id....
  */

  void storegirlid(String id) {
    _girlid = id;
    log("storegirlid is : $id");
  }

  Future<void> fetchGirlIds() async {
    final snapshot =
        await FirebaseFirestore.instance.collection("girldetails").get();
    _girlIds = snapshot.docs.map((doc) => doc.id).toList();
    notifyListeners();
  }

  void storeGirlName(String girlname) {
    _girlName = girlname;
  }
}
