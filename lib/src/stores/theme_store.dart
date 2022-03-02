import 'package:flutter/material.dart';

enum TypeTheme {
  light,
  dark,
}

class ThemeStore extends ChangeNotifier {
  TypeTheme typeTheme = TypeTheme.dark;

  void toogleTheme() {
    typeTheme = typeTheme == TypeTheme.dark ? TypeTheme.light : TypeTheme.dark;
    notifyListeners();
  }
}
