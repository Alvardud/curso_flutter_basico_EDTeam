import 'package:flutter/cupertino.dart';

class ThemeController {

  static final ThemeController instancia = ThemeController._();
  ThemeController._();

  ValueNotifier<bool> isDark = ValueNotifier<bool>(false);

  void changeTheme(bool value) {
    isDark.value = value;
  }
}
