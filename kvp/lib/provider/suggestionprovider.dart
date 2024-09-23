import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Suggestionprovider extends ChangeNotifier {
  // Lists to store suggestions for various categories
  List<String> vastilist = [];
  List<String> vibhaglist = [];
  List<String> vmlist = [];
  List<String> freelancerlist = [];
  List<String> trainerlist = [];
  List<String> coordinatorlist = [];
  List<String> sponsorlist = [];

  // Flags to determine which suggestion box to display
  bool vmbuild = false;
  bool trainerbuyild = false;
  bool freelancerbuild = false;
  bool coobuild = false;
  bool vastibuild = false;
  bool vibhagbuild = false;
  bool sponsorbuild = false;

  // List to store filtered suggestions based on user input
  List<String> matchedItems = [];

  // Method to auto-complete suggestions based on user input
  void autoComplete(List<String> suggestion, String input, String choice) {
    matchedItems.clear();

    // Matching items based on input and adding them to the matchedItems list
    for (String element in suggestion) {
      if (element.toLowerCase().startsWith(input.toLowerCase())) {
        matchedItems.add(element);
      }
    }

    // Determine which category should be active for suggestion display
    switch (choice) {
      case "checkvasti":
        vastibuild = true;
        vibhagbuild = false;
        trainerbuyild = false;
        freelancerbuild = false;
        coobuild = false;
        vmbuild = false;
        sponsorbuild = false;
        notifyListeners(); // Notify listeners to update UI
        break;
      case "checkvibhag":
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

  // Save new suggestion to SharedPreferences
  Future<void> saveSuggestion(String newSuggestion, String input) async {
    if (newSuggestion.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> data;
      String key;

      // Assigns correct SharedPreferences key based on input type
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

      // Retrieves existing suggestions for the key or an empty list if none exist
      data = prefs.getStringList(key) ?? [];

      // Adds new suggestion if it doesn't already exist
      if (!data.contains(newSuggestion)) {
        data.add(newSuggestion);
        await prefs.setStringList(key, data); // Saves updated list
      }

      notifyListeners(); // Notify listeners to update the UI
    }
  }

  // Load all saved suggestions from SharedPreferences
  Future<void> loadSuggestion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Logs and loads Vasti suggestions
    List<String> savedVastiSuggestions =
        prefs.getStringList('vastisuggestion') ?? [];
    savedVastiSuggestions =
        savedVastiSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion vasti list in load suggestion: $savedVastiSuggestions");
    vastilist = savedVastiSuggestions;

    // Logs and loads Vibhag suggestions
    List<String> savedVibhagSuggestions =
        prefs.getStringList("vibhagsuggestion") ?? [];
    savedVibhagSuggestions =
        savedVibhagSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion vibhag list in load suggestion: $savedVibhagSuggestions");
    vibhaglist = savedVibhagSuggestions;

    // Logs and loads VM suggestions
    List<String> savedVmSuggestions = prefs.getStringList("vmsuggestion") ?? [];
    savedVmSuggestions = savedVmSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion VM list in load suggestion: $savedVmSuggestions");
    vmlist = savedVmSuggestions;

    // Logs and loads Trainer suggestions
    List<String> savedTrainerSuggestions =
        prefs.getStringList("trainersuggestion") ?? [];
    savedTrainerSuggestions =
        savedTrainerSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion Trainer list in load suggestion: $savedTrainerSuggestions");
    trainerlist = savedTrainerSuggestions;

    // Logs and loads Freelancer suggestions
    List<String> savedFreelancerSuggestions =
        prefs.getStringList("freelancersuggestion") ?? [];
    savedFreelancerSuggestions =
        savedFreelancerSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion freelancer list in load suggestion: $savedFreelancerSuggestions");
    freelancerlist = savedFreelancerSuggestions;

    // Logs and loads Coordinator suggestions
    List<String> savedCoordinatorSuggestions =
        prefs.getStringList("coordinatorsuggestion") ?? [];
    savedCoordinatorSuggestions =
        savedCoordinatorSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion coordinator list in load suggestion: $savedCoordinatorSuggestions");
    coordinatorlist = savedCoordinatorSuggestions;

    // Logs and loads Sponsor suggestions
    List<String> savedSponsorSuggestions =
        prefs.getStringList("sponsorsuggestion") ?? [];
    savedSponsorSuggestions =
        savedSponsorSuggestions.where((s) => s.isNotEmpty).toList();
    log("Saved suggestion sponsor list in load suggestion: $savedSponsorSuggestions");
    sponsorlist = savedSponsorSuggestions;

    notifyListeners(); // Notify listeners that data has been loaded
  }
}
