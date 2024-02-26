import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';

class DrawerCubit extends Cubit<DrawerStates> {
  DrawerCubit() : super(DrawerStatesInitial());

  int selectedIndex = 0;
  bool selectedMode = false;
  void changeIndex() {
    emit(DrawerSelectedIndexChanged());
  }

  void changeMode() {
    selectedMode = !selectedMode;
    emit(DrawerSelectedModeChange());
  }
}
