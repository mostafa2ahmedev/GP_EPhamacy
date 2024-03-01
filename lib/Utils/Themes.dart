import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Constant.dart';
import 'package:gppharmacy/Utils/Constants.dart';

abstract class Themes {
  static final ThemeData lightThemeData = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: IconBackGroundColor),
    primaryColor: ColorManeger.lightSecondryColor,
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorManeger.lightSecondryColor,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 244, 244, 244),
    cardColor: const Color(0xff1D3242),
    dropdownMenuTheme: DropdownMenuThemeData(textStyle: TextStyle(backgroundColor: Colors.yellow)),    
    iconTheme: const IconThemeData(color: Colors.white),
    hintColor: Colors.black

  );
//   static final ThemeData darkThemeData = ThemeData(
//     primaryColor: ColorManeger.darkSeconrdyColor,
//     drawerTheme: const DrawerThemeData(
//       backgroundColor: ColorManeger.darkSeconrdyColor,
//     ),
//     dropdownMenuTheme: const DropdownMenuThemeData(),
//     scaffoldBackgroundColor: ColorManeger.darkPrimaryColor,
//     canvasColor: ColorManeger.darkItemsColor,
//     iconTheme: IconThemeData(color: PrimaryColor),
    
//   );
// }

  static final ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: IconBackGroundColor,
    appBarTheme: AppBarTheme(backgroundColor: PrimaryColor),
    primaryColor: IconBackGroundColor,
    drawerTheme:  DrawerThemeData(
      backgroundColor: IconBackGroundColor,
    ),
    cardColor: PrimaryColor,
    dropdownMenuTheme: DropdownMenuThemeData(textStyle: TextStyle(backgroundColor: Colors.yellow)),
    canvasColor: ColorManeger.darkItemsColor,
    iconTheme: IconThemeData(color: PrimaryColor),
    hintColor: Colors.white,
    switchTheme: SwitchThemeData()
    );
}
