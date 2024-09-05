// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Suggestionprovider extends ChangeNotifier {
//   List<String> filteredList = [];
//   List<String> vastilist = [];
//   List<String> vibhaglist = [];
//   List<String> vmlist = [];
//   List<String> freelancerlist = [];
//   List<String> trainerlist = [];
//   List<String> coordinatorlist = [];
//   List<String> sponsorlist = [];
//   List<String> suggestedlist = [
//     "Ambika",
//     "Kondhava",
//     "Parvati",
//     "Katraj",
//   ];

//   void autoComplete(List<String> suggestion, String input, String choice) {
//     switch (choice) {
//       case "checkvasti":
//         vastilist.clear();
//         break;

//       case "checkvibhag":
//         vibhaglist.clear();
//         break;

//       case "checkvm":
//         vmlist.clear();
//         break;

//       case "checkfreelance":
//         freelancerlist.clear();
//         break;

//       case "checktrainer":
//         trainerlist.clear();
//         break;

//       case "checkcoo":
//         coordinatorlist.clear();
//         break;

//       case "sponsor":
//         sponsorlist.clear();
//         break;

//       default:
//         vastilist.clear();
//     }

//     for (String element in suggestion) {
//       if (element.toLowerCase().startsWith(input.toLowerCase())) {
//         print("Matched item: $element");
//         switch (choice) {
//           case "checkvasti":
//             vastilist.add(element);
//             break;

//           case "checkvibhag":
//             vibhaglist.add(element);
//             break;

//           case "checkvm":
//             vmlist.add(element);
//             break;

//           case "checkfreelance":
//             freelancerlist.add(element);
//             break;

//           case "checktrainer":
//             trainerlist.add(element);
//             break;

//           case "checkcoo":
//             coordinatorlist.add(element);
//             break;

//           case "sponsor":
//             sponsorlist.add(element);
//             break;

//           default:
//             break;
//         }
//       }
//     }

//     notifyListeners();
//   }

//   Future<void> saveSuggestion(String newSuggestion, String input) async {
//     if (newSuggestion.isNotEmpty && !suggestedlist.contains(newSuggestion)) {
//       SharedPreferences prefs = await SharedPreferences.getInstance();

//       if ("vasti" == input) {
//         vastilist.add(newSuggestion);
//         await prefs.setStringList('vastisuggestion', vastilist);
//       } else if ("vibhag" == input) {
//         vibhaglist.add(newSuggestion);
//         await prefs.setStringList('vibhagsuggestion', vibhaglist);
//       } else if ("vm" == input) {
//         vmlist.add(newSuggestion);
//         await prefs.setStringList('vmsuggestion', vmlist);
//       } else if ("trainer" == input) {
//         trainerlist.add(newSuggestion);
//         await prefs.setStringList("trainersuggestion", trainerlist);
//       } else if ("freelancer" == input) {
//         freelancerlist.add(newSuggestion);
//         await prefs.setStringList("freelancersuggestion", freelancerlist);
//       } else if ("coordinator" == input) {
//         coordinatorlist.add(newSuggestion);
//         await prefs.setStringList("coordinatorsuggestion", coordinatorlist);
//       } else if ("sponsor" == input) {
//         sponsorlist.add(newSuggestion);
//         await prefs.setStringList("sponsorsuggestion", sponsorlist);
//       }
//       suggestedlist.add(newSuggestion);

//       notifyListeners();
//     }
//   }

//   Future<void> loadSuggestion() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> savedVastiSuggestions =
//         prefs.getStringList('vastisuggestion') ?? [];

//     savedVastiSuggestions =
//         savedVastiSuggestions.where((s) => s.isNotEmpty).toList();
//     print("savedsuggestion vasti list in load suggestion : $savedVastiSuggestions");

//     vastilist = savedVastiSuggestions;
//     print("vasti list in load suggestion : $suggestedlist");

//     List<String> savedVibhagSuggestions =
//         prefs.getStringList("vibhagsuggestion") ?? [];

//      savedVibhagSuggestions =
//         savedVibhagSuggestions.where((s) => s.isNotEmpty).toList();
//     print("savedsuggestion vibhag list in load suggestion : $savedVibhagSuggestions");

//     vibhaglist = savedVibhagSuggestions;
//     print("vibhag list in load suggestion : $savedVibhagSuggestions");

//     List<String> savedVmSuggestions =
//         prefs.getStringList("vmsuggestion") ?? [];

//      savedVmSuggestions =
//         savedVmSuggestions.where((s) => s.isNotEmpty).toList();
//     print("savedsuggestion VM list in load suggestion : $savedVmSuggestions");

//     vmlist = savedVmSuggestions;
//     print("VM list in load suggestion : $savedVmSuggestions");

//     List<String> savedTrainerSuggestions =
//         prefs.getStringList("trainersuggestion") ?? [];

//      savedTrainerSuggestions =
//         savedTrainerSuggestions.where((s) => s.isNotEmpty).toList();
//     print("savedsuggestion Trainer list in load suggestion : $savedTrainerSuggestions");

//     trainerlist = savedTrainerSuggestions;
//     print("Trainer list in load suggestion : $savedTrainerSuggestions");

//     List<String> savedFreelancerSuggestions =
//         prefs.getStringList("freelancersuggestion") ?? [];

//      savedFreelancerSuggestions =
//         savedFreelancerSuggestions.where((s) => s.isNotEmpty).toList();
//     print("savedsuggestion freelancer list in load suggestion : $savedFreelancerSuggestions");

//     freelancerlist = savedFreelancerSuggestions;
//     print("freelancer list in load suggestion : $savedFreelancerSuggestions");

//     List<String> savedCoordinatorSuggestions =
//         prefs.getStringList("coordinatorsuggestion") ?? [];

//      savedCoordinatorSuggestions =
//         savedCoordinatorSuggestions.where((s) => s.isNotEmpty).toList();
//     print("savedsuggestion coordinator list in load suggestion : $savedCoordinatorSuggestions");

//     coordinatorlist = savedCoordinatorSuggestions;
//     print("coordinator list in load suggestion : $savedCoordinatorSuggestions");

//     List<String> savedSponsorSuggestions =
//         prefs.getStringList("sponsorsuggestion") ?? [];

//      savedSponsorSuggestions =
//         savedSponsorSuggestions.where((s) => s.isNotEmpty).toList();
//     print("savedsuggestion sponsor list in load suggestion : $savedSponsorSuggestions");

//     sponsorlist = savedSponsorSuggestions;
//     print("sponsor list in load suggestion : $savedSponsorSuggestions");

//     notifyListeners();

//   }
// }

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

  // switch (choice) {
  //   case "checkvasti":
  //     vastilist.clear();
  //     notifyListeners();
  //     break;
  //   case "checkvibhag":
  //     vibhaglist.clear();
  //     notifyListeners();
  //     break;
  //   case "checkvm":
  //     vmlist.clear();
  //     notifyListeners();
  //     break;
  //   case "checkfreelance":
  //     freelancerlist.clear();
  //     notifyListeners();
  //     break;
  //   case "checktrainer":
  //     trainerlist.clear();
  //     notifyListeners();
  //     break;
  //   case "checkcoo":
  //     coordinatorlist.clear();
  //     notifyListeners();
  //     break;
  //   case "sponsor":
  //     sponsorlist.clear();
  //     notifyListeners();
  //     break;
  // }

  //   for (String element in suggestion) {
  //     if (element.toLowerCase().startsWith(input.toLowerCase())) {
  //       print("Matched item: $element");
  //       switch (choice) {
  //         case "checkvasti":
  //           vastilist.add(element);
  //           notifyListeners();
  //           break;
  //         case "checkvibhag":
  //           vibhaglist.add(element);
  //           notifyListeners();
  //           break;
  //         case "checkvm":
  //           vmlist.add(element);
  //           vmbuild = true;
  //           notifyListeners();
  //           break;
  //         case "checkfreelance":
  //           freelancerlist.add(element);
  //           notifyListeners();
  //           break;
  //         case "checktrainer":
  //           trainerlist.add(element);
  //           notifyListeners();
  //           break;
  //         case "checkcoo":
  //           coordinatorlist.add(element);
  //           notifyListeners();
  //           break;
  //         case "sponsor":
  //           sponsorlist.add(element);
  //           notifyListeners();
  //           break;
  //         default:
  //           break;
  //       }
  //     }
  //   }
  // }
  List<String> matchedItems = [];

  void autoComplete(List<String> suggestion, String input, String choice) {
    // List<String> templist = [];
    matchedItems.clear();
    for (String element in suggestion) {
      if (element.toLowerCase().startsWith(input.toLowerCase())) {
        matchedItems.add(element);
      }
    }

    switch (choice) {
      case "checkvasti":
        //vastilist.addAll(matchedItems);
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
        // vibhaglist.addAll(matchedItems);
        notifyListeners();
        break;
      case "checkvm":

        // templist.addAll(vmlist);
        // vmlist.clear();
        // vmlist.addAll(matchedItems);

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
        //freelancerlist.addAll(matchedItems);
        notifyListeners();
        break;
      case "checktrainer":
        // trainerlist.addAll(matchedItems)
        // ;
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
        //sponsorlist.addAll(matchedItems);
        notifyListeners();
        break;
      default:
        break;
    }
  }

  // Future<void> saveSuggestion(String newSuggestion, String input) async {
  //   if (newSuggestion.isNotEmpty) {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();

  //     if ("vasti" == input) {
  //       List<String> data = prefs.getStringList("vastisuggestion") ?? [];
  //       data.add(newSuggestion);
  //       await prefs.setStringList('vastisuggestion', data);
  //     } else if ("vibhag" == input) {
  //       List<String> data1 = prefs.getStringList("vibhagsuggestion") ?? [];
  //       data1.add(newSuggestion);
  //       await prefs.setStringList('vibhagsuggestion', data1);
  //     } else if ("vm" == input) {
  //       List<String> data2 = prefs.getStringList("vmsuggestion") ?? [];
  //       data2.add(newSuggestion);
  //       await prefs.setStringList('vmsuggestion', data2);
  //     } else if ("trainer" == input) {
  //       List<String> data3 = prefs.getStringList("trainersuggestion") ?? [];
  //       data3.add(newSuggestion);
  //       await prefs.setStringList("trainersuggestion", data3);
  //     } else if ("freelancer" == input) {
  //       List<String> data4 = prefs.getStringList("freelancersuggestion") ?? [];
  //       data4.add(newSuggestion);
  //       await prefs.setStringList("freelancersuggestion", data4);
  //     } else if ("coordinator" == input) {
  //       List<String> data5 = prefs.getStringList("coordinatorsuggestion") ?? [];
  //       data5.add(newSuggestion);
  //       await prefs.setStringList("coordinatorsuggestion", data5);
  //     } else if ("sponsor" == input) {
  //       List<String> data6 = prefs.getStringList("sponsorsuggestion") ?? [];
  //       data6.add(newSuggestion);
  //       await prefs.setStringList("sponsorsuggestion", data6);
  //     }

  //     notifyListeners();
  //   }
  // }

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
    print("my name is ganesh");
    List<String> savedVastiSuggestions =
        prefs.getStringList('vastisuggestion') ?? [];
    savedVastiSuggestions =
        savedVastiSuggestions.where((s) => s.isNotEmpty).toList();
    print(
        "Saved suggestion vasti list in load suggestion: $savedVastiSuggestions");
    vastilist = savedVastiSuggestions;

    List<String> savedVibhagSuggestions =
        prefs.getStringList("vibhagsuggestion") ?? [];
    savedVibhagSuggestions =
        savedVibhagSuggestions.where((s) => s.isNotEmpty).toList();
    print(
        "Saved suggestion vibhag list in load suggestion: $savedVibhagSuggestions");
    vibhaglist = savedVibhagSuggestions;

    List<String> savedVmSuggestions = prefs.getStringList("vmsuggestion") ?? [];
    savedVmSuggestions = savedVmSuggestions.where((s) => s.isNotEmpty).toList();
    print("Saved suggestion VM list in load suggestion: $savedVmSuggestions");
    vmlist = savedVmSuggestions;

    List<String> savedTrainerSuggestions =
        prefs.getStringList("trainersuggestion") ?? [];
    savedTrainerSuggestions =
        savedTrainerSuggestions.where((s) => s.isNotEmpty).toList();
    print(
        "Saved suggestion Trainer list in load suggestion: $savedTrainerSuggestions");
    trainerlist = savedTrainerSuggestions;

    List<String> savedFreelancerSuggestions =
        prefs.getStringList("freelancersuggestion") ?? [];
    savedFreelancerSuggestions =
        savedFreelancerSuggestions.where((s) => s.isNotEmpty).toList();
    print(
        "Saved suggestion freelancer list in load suggestion: $savedFreelancerSuggestions");
    freelancerlist = savedFreelancerSuggestions;

    List<String> savedCoordinatorSuggestions =
        prefs.getStringList("coordinatorsuggestion") ?? [];
    savedCoordinatorSuggestions =
        savedCoordinatorSuggestions.where((s) => s.isNotEmpty).toList();
    print(
        "Saved suggestion coordinator list in load suggestion: $savedCoordinatorSuggestions");
    coordinatorlist = savedCoordinatorSuggestions;

    List<String> savedSponsorSuggestions =
        prefs.getStringList("sponsorsuggestion") ?? [];
    savedSponsorSuggestions =
        savedSponsorSuggestions.where((s) => s.isNotEmpty).toList();
    print(
        "Saved suggestion sponsor list in load suggestion: $savedSponsorSuggestions");
    sponsorlist = savedSponsorSuggestions;

    notifyListeners();
  }

  // // void clearData(String val) {
  // //   if (val == 'vm') {
  // //     vmbuild = true;
  // //     vmlist.clear();
  // //     notifyListeners();
  // //   }
  // }
}
