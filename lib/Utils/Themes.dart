import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';

abstract class Themes {
  static final ThemeData lightThemeData = ThemeData(
    primaryColor: ColorManeger.lightSecondryColor,
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorManeger.lightSecondryColor,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 244, 244, 244),
    cardColor: const Color(0xff1D3242),
    iconTheme: const IconThemeData(color: Colors.white),
  );
  static final ThemeData darkThemeData = ThemeData(
    primaryColor: ColorManeger.darkSeconrdyColor,
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorManeger.darkSeconrdyColor,
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(),
    scaffoldBackgroundColor: ColorManeger.darkPrimaryColor,
    canvasColor: ColorManeger.darkItemsColor,
  );
}
