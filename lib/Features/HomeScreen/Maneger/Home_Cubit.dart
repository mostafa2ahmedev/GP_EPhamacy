import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';
import 'package:gppharmacy/Utils/Constant.dart';
import 'package:gppharmacy/Utils/Shared_Prefrences.dart';

class DrawerCubit extends Cubit<DrawerStates> {
  DrawerCubit() : super(DrawerStatesInitial());
  int innerFirstSelectedIndex = 0;
  int outerSelectedIndex = 0;
  int innerSecondSelectedIndex = 0;
  String? data1;
  String? data2;
  bool selectedMode = true;
  bool selectedLang = true;
  String? hint1 = "المخازن";
  String? hint2 = "المرضي";

  bool isClicked = false;

  void changeMode({bool? mode}) async {
    if (mode != null) {
      selectedMode = mode;
      log("cachemode $mode 'cacheselectedMode' $selectedMode");
    } else {
      selectedMode = !selectedMode;
      log("Togglemode $mode 'ToggleselectedMode' $selectedMode");
      await SharedPref.saveData(key: Constant.themeConst, value: selectedMode);
      emit(DrawerSelectedModeChange());
    }
  }

  void changeLang({bool? lang}) async {
    if (lang != null) {
      selectedLang = lang;
    } else {
      data1 = null;
      data2 = null;
      innerFirstSelectedIndex = 0;
      outerSelectedIndex = 0;
      selectedLang = !selectedLang;
      await SharedPref.saveData(key: Constant.langConst, value: selectedLang);
      emit(DrawerSelectedLangChange());
    }
  }

  void changeIndexAndData(String? value, int outerIndex) {
    if (outerIndex == 0) {
      data1 = value;
    } else if (outerIndex == 1) {
      data2 = value;
    }

    emit(DrawerSelectedIndexChanged());
  }
}
