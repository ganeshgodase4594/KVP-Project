import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Suggestionprovider extends ChangeNotifier {
  List<String> filteredList = [];
  List<String> vastilist = [];
  List<String> vibhaglist = [];
  List<String> vmlist = [];
  List<String> freelancerlist = [];
  List<String> trainerlist = [];
  List<String> coordinatorlist = [];
  List<String> sponsorlist = [];
  List<String> suggestedlist = [
    "Ambika",
    "Kondhava",
    "Parvati",
    "Katraj",
  ];

  void autoComplete(List<String> suggestion, String input, String choice) {
    switch (choice) {
      case "checkvasti":
        vastilist.clear();
        break;

      case "checkvibhag":
        vibhaglist.clear();
        break;

      case "checkvm":
        vmlist.clear();
        break;

      case "checkfreelance":
        freelancerlist.clear();
        break;

      case "checktrainer":
        trainerlist.clear();
        break;

      case "checkcoo":
        coordinatorlist.clear();
        break;

      case "sponsor":
        sponsorlist.clear();
        break;

      default:
        vastilist.clear();
    }

    for (String element in suggestion) {
      if (element.toLowerCase().startsWith(input.toLowerCase())) {
        print("Matched item: $element");
        switch (choice) {
          case "checkvasti":
            vastilist.add(element);
            break;

          case "checkvibhag":
            vibhaglist.add(element);
            break;

          case "checkvm":
            vmlist.add(element);
            break;

          case "checkfreelance":
            freelancerlist.add(element);
            break;

          case "checktrainer":
            trainerlist.add(element);
            break;

          case "checkcoo":
            coordinatorlist.add(element);
            break;

          case "sponsor":
            sponsorlist.add(element);
            break;

          default:
            break;
        }
      }
    }

    notifyListeners();
  }

  Future<void> saveSuggestion(String newSuggestion) async {
    if (newSuggestion.isNotEmpty && !suggestedlist.contains(newSuggestion)) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      suggestedlist.add(newSuggestion);
      await prefs.setStringList('suggestions', suggestedlist);
      notifyListeners();
    }
  }

  Future<void> loadSuggestion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedSuggestions = prefs.getStringList('suggestions') ?? [];

    savedSuggestions = savedSuggestions.where((s) => s.isNotEmpty).toList();
    print("savedsuggestion list in load suggestion : $savedSuggestions");

    suggestedlist = savedSuggestions;
    print("suggested list in load suggestion : $suggestedlist");
    notifyListeners();
  }
}


// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Suggestionprovider extends ChangeNotifier {
//   Map<String, List<String>> suggestionLists = {
//     "vastiname": [],
//     "vibhagname": [],
//     "vmname": [],
//     "freelancername": [],
//     "trainername": [],
//     "coordinatorname": [],
//     "sponsorcompany": []
//   };

//   void autoComplete(String choice, String input) {
//     if (suggestionLists.containsKey(choice)) {
//       List<String> filteredList = suggestionLists[choice]!
//           .where((element) => element.toLowerCase().startsWith(input.toLowerCase()))
//           .toList();
//       suggestionLists[choice] = filteredList;
//     }
//     notifyListeners();
//   }

//   Future<void> saveSuggestion(String fieldKey, String newSuggestion) async {
//     if (newSuggestion.isNotEmpty && suggestionLists.containsKey(fieldKey)) {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       List<String> fieldSuggestions = prefs.getStringList(fieldKey) ?? [];

//       if (!fieldSuggestions.contains(newSuggestion)) {
//         fieldSuggestions.add(newSuggestion);
//         suggestionLists[fieldKey] = fieldSuggestions;
//         await prefs.setStringList(fieldKey, fieldSuggestions);
//         notifyListeners();
//       }
//     }
//   }

//   Future<void> loadSuggestions() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     for (String key in suggestionLists.keys) {
//       List<String> savedSuggestions = prefs.getStringList(key) ?? [];
//       suggestionLists[key] = savedSuggestions.where((s) => s.isNotEmpty).toList();
//     }
//     notifyListeners();
//   }
// }

