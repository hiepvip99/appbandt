import 'package:flutter/cupertino.dart';

class Setting extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void change(bool value) {
    _isDark = value;

    notifyListeners();
  }
}
