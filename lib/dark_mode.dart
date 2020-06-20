import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkMode extends ValueNotifier<bool> {
  factory DarkMode() {
    return _darkMode;
  }

  DarkMode._internal() : super(false) {
    _getValue();
  }

  static final _darkMode = DarkMode._internal();
  static const _key = 'DarkMode';

  final _pref = SharedPreferences.getInstance();

  void reverse() {
    value = !value;
    notifyListeners();
    _save();
  }

  Future<void> _save() async {
    final pref = await _pref;
    pref.setBool(_key, value);
  }

  Future<void> _getValue() async {
    final pref = await _pref;
    final dark = pref.getBool(_key);
    if (dark == null) return;

    value = dark;
    notifyListeners();
  }
}
