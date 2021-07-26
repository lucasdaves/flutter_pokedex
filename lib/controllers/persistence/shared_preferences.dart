import 'package:shared_preferences/shared_preferences.dart';

class InternalMemory {
  static save(String option, SharedPreferences prefs, List<String> data) {
    if (option == 'favorite') prefs.setStringList('favorite', data);
    if (option == 'history') prefs.setStringList('history', data);
  }

  static List<String> read(String option, SharedPreferences prefs) {
    if (option == 'favorite')
      return prefs.getStringList('favorite') ?? [];
    else if (option == 'history')
      return prefs.getStringList('history') ?? [];
    else
      return [];
  }

  static remove(String option, SharedPreferences prefs) {
    if (option == 'favorite') prefs.remove('favorite');
    if (option == 'history') prefs.remove('history');
  }
}
