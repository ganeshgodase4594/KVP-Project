import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Suggestionprovider extends ChangeNotifier {
  List<String> vastilist = [];
  List<String> vibhaglist = [];
  List<String> vmlist = [];
  List<String> freelancerlist = [];
  List<String> trainerlist = [];
  List<String> coordinatorlist = [];
  List<String> sponsorlist = [];

  bool vmbuild = false;
  bool trainerbuyild = false;
  bool freelancerbuild = false;
  bool coobuild = false;
  bool vastibuild = false;
  bool vibhagbuild = false;
  bool sponsorbuild = false;

  List<String> matchedItems = [];

  void autoComplete(List<String> suggestion, String input, String choice) {
    matchedItems.clear();
    for (String element in suggestion) {
      if (element.toLowerCase().startsWith(input.toLowerCase())) {
        matchedItems.add(element);
      }
    }

    switch (choice) {
      case "checkvasti":
        matchedItems;
        vastibuild = true;
        vibhagbuild = false;
        trainerbuyild = false;
        freelancerbuild = false;
        coobuild = false;
        vmbuild = false;
        sponsorbuild = false;
        notifyListeners();
        break;
      case "checkvibhag":
        matchedItems;
        vastibuild = false;
        vibhagbuild = true;
        trainerbuyild = false;
        freelancerbuild = false;
        coobuild = false;
        vmbuild = false;
        sponsorbuild = false;

        notifyListeners();
        break;
      case "checkvm":
        matchedItems;

        vastibuild = false;
        vibhagbuild = false;
        trainerbuyild = false;
        freelancerbuild = false;
        coobuild = false;
        vmbuild = true;
        sponsorbuild = false;
        notifyListeners();
        break;
      case "checkfreelance":
        matchedItems;
        vastibuild = false;
        vibhagbuild = false;
        trainerbuyild = false;
        freelancerbuild = true;
        coobuild = false;
        vmbuild = false;
        sponsorbuild = false;

        notifyListeners();
        break;
      case "checktrainer":
        matchedItems;
        vastibuild = false;
        vibhagbuild = false;
        trainerbuyild = true;
        freelancerbuild = false;
        coobuild = false;
        vmbuild = false;
        sponsorbuild = false;
        notifyListeners();
        break;
      case "checkcoo":
        matchedItems;
        vastibuild = false;
        vibhagbuild = false;
        trainerbuyild = false;
        freelancerbuild = false;
        coobuild = true;
        vmbuild = false;
        sponsorbuild = false;

        notifyListeners();
        break;
      case "sponsor":
        matchedItems;
        vastibuild = false;
        vibhagbuild = false;
        trainerbuyild = false;
        freelancerbuild = false;
        coobuild = false;
        vmbuild = false;
        sponsorbuild = true;

        notifyListeners();
        break;
      default:
        break;
    }
  }

  Future<void> saveSuggestion(String newSuggestion, String input) async {
    if (newSuggestion.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String> data;
      String key;

      if ("vasti" == input) {
        key = "vastisuggestion";
      } else if ("vibhag" == input) {
        key = "vibhagsuggestion";
      } else if ("vm" == input) {
        key = "vmsuggestion";
      } else if ("trainer" == input) {
        key = "trainersuggestion";
      } else if ("freelancer" == input) {
        key = "freelancersuggestion";
      } else if ("coordinator" == input) {
        key = "coordinatorsuggestion";
      } else if ("sponsor" == input) {
        key = "sponsorsuggestion";
      } else {
        return;
      }

      data = prefs.getStringList(key) ?? [];

      if (!data.contains(newSuggestion)) {
        data.add(newSuggestion);
        await prefs.setStringList(key, data);
      }

      notifyListeners();
    }
  }

  Future<void> loadSuggestion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    log("my name is ganesh");
    List<String> savedVastiSuggestions =
        prefs.getStringList('vastisuggestion') ?? [];
    savedVastiSuggestions =
        savedVastiSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion vasti list in load suggestion: $savedVastiSuggestions");
    vastilist = savedVastiSuggestions;

    List<String> savedVibhagSuggestions =
        prefs.getStringList("vibhagsuggestion") ?? [];
    savedVibhagSuggestions =
        savedVibhagSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion vibhag list in load suggestion: $savedVibhagSuggestions");
    vibhaglist = savedVibhagSuggestions;

    List<String> savedVmSuggestions = prefs.getStringList("vmsuggestion") ?? [];
    savedVmSuggestions = savedVmSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion VM list in load suggestion: $savedVmSuggestions");
    vmlist = savedVmSuggestions;

    List<String> savedTrainerSuggestions =
        prefs.getStringList("trainersuggestion") ?? [];
    savedTrainerSuggestions =
        savedTrainerSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion Trainer list in load suggestion: $savedTrainerSuggestions");
    trainerlist = savedTrainerSuggestions;

    List<String> savedFreelancerSuggestions =
        prefs.getStringList("freelancersuggestion") ?? [];
    savedFreelancerSuggestions =
        savedFreelancerSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion freelancer list in load suggestion: $savedFreelancerSuggestions");
    freelancerlist = savedFreelancerSuggestions;

    List<String> savedCoordinatorSuggestions =
        prefs.getStringList("coordinatorsuggestion") ?? [];
    savedCoordinatorSuggestions =
        savedCoordinatorSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion coordinator list in load suggestion: $savedCoordinatorSuggestions");
    coordinatorlist = savedCoordinatorSuggestions;

    List<String> savedSponsorSuggestions =
        prefs.getStringList("sponsorsuggestion") ?? [];
    savedSponsorSuggestions =
        savedSponsorSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion sponsor list in load suggestion: $savedSponsorSuggestions");
    sponsorlist = savedSponsorSuggestions;

    notifyListeners();
  }
}
