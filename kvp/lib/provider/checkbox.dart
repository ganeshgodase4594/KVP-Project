import 'package:flutter/material.dart';

class CheckboxProvider with ChangeNotifier {
  // Map to manage checkbox states
  Map<String, bool> _checkboxState = {
    'Bhonda': false,
    'Summer Camp': false,
    'Mangalagaur': false,
    'Winter Camp': false,
    'Haladikunku': false,
    'Exposure Visit': false,
    'Company Visit': false,
    'Kishori Care Kit': false,
  };

  // TextEditingControllers for each checkbox
  final TextEditingController bhonda = TextEditingController();
  final TextEditingController summercamp = TextEditingController();
  final TextEditingController mangalagaur = TextEditingController();
  final TextEditingController wintercamp = TextEditingController();
  final TextEditingController haladikunku = TextEditingController();
  final TextEditingController exposurevisit = TextEditingController();
  final TextEditingController companyvisit = TextEditingController();
  final TextEditingController kishoricarekit = TextEditingController();

  Map<String, bool> get checkboxState => _checkboxState;

  void updateCheckbox(String key, bool value) {
    _checkboxState[key] = value;
    notifyListeners();

    switch (key) {
      case 'Bhonda':
        bhonda.text = value ? 'true' : 'false';
        print("bhonda controller : $value");
        notifyListeners();
        break;
      case 'Summer Camp':
        summercamp.text = value ? 'true' : 'false';
        print("Summer Camp : $value");
        notifyListeners();
        break;
      case 'Mangalagaur':
        mangalagaur.text = value ? 'true' : 'false';
        print("Mangalgaur : $value");
        notifyListeners();
        break;
      case 'Winter Camp':
        wintercamp.text = value ? 'true' : 'false';
        print("Winter Camp : $value");
        notifyListeners();
        break;
      case 'Haladikunku':
        haladikunku.text = value ? 'true' : 'false';
        print("Haladikunku : $value");
        notifyListeners();
        break;
      case 'Exposure Visit':
        exposurevisit.text = value ? 'true' : 'false';
        print("Exposure Visit : $value");
        notifyListeners();
        break;
      case 'Company Visit':
        companyvisit.text = value ? 'true' : 'false';
        print("Company Visit : $value");
        notifyListeners();
        break;
      case 'Kishori Care Kit':
        kishoricarekit.text = value ? 'true' : 'false';
        print("Kishori Care Kit : $value");
        notifyListeners();
        break;
    }
    notifyListeners();
  }
}
