import 'package:flutter/foundation.dart';

/*
  Provider for selectedDate....
  */
class DateProvider with ChangeNotifier {
  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;

    notifyListeners();
  }
}
