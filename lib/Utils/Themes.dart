import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';

abstract class Themes {
  static final ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    appBarTheme:
        const AppBarTheme(backgroundColor: ColorManeger.darkSecondryColor),
    primaryColor: ColorManeger.lightSecondryColor,
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorManeger.lightSecondryColor,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 244, 244, 244),
    cardColor: const Color(0xff1D3242),
    iconTheme: const IconThemeData(color: Colors.white),
    hintColor: Colors.black,
  );

  static final ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorManeger.PrimaryColor,
    appBarTheme:
        const AppBarTheme(backgroundColor: ColorManeger.darkSecondryColor),
    primaryColor: ColorManeger.darkSecondryColor,
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorManeger.darkSecondryColor,
    ),
    cardColor: ColorManeger.PrimaryColor,
    iconTheme: const IconThemeData(color: Colors.white),
    hintColor: Colors.white,
  );
}
