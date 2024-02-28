import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';
import 'package:gppharmacy/Utils/Shared_Prefrences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerCubit extends Cubit<DrawerStates> {
  DrawerCubit() : super(DrawerStatesInitial());
  int innerFirstSelectedIndex = 0;
  int outerSelectedIndex = 0;
  String? data1;
  String? data2;
  bool? selectedMode;
  bool? selectedLang;

  void changeIndexAndData(String? value, int outerIndex) {
    if (outerIndex == 0) {
      data1 = value;
    } else if (outerIndex == 1) {
      data2 = value;
    }

    emit(DrawerSelectedIndexChanged());
  }

  void changeMode() async {
    selectedMode != selectedMode;
    await SharedPref.saveData(key: 'Mode', value: selectedMode!);

    emit(DrawerSelectedModeChange());
  }

  Future<bool> getMode() async {
    return await SharedPref.getData(key: 'Mode');
  }

  void changeLang() async {
    selectedLang != selectedLang;
    await SharedPref.saveData(key: 'Lang', value: selectedLang!);
    emit(DrawerSelectedLangChange());
  }

  Future<bool> getLang() async {
    return await SharedPref.getData(key: 'Lang');
  }
}
