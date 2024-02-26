import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';

abstract class Themes {
  static final ThemeData lightThemeData = ThemeData(
    primaryColor: const Color.fromARGB(255, 88, 138, 173),
  );
  static final ThemeData darkThemeData = ThemeData(
    primaryColor: ColorManeger.primaryColor,
  );
}
