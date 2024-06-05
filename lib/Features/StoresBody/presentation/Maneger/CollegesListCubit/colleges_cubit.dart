import 'package:bloc/bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/CollegesList/CollegesListModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/CollegesListCubit/colleges_state.dart';
import 'package:gppharmacy/Utils/DioService.dart';

class CollegesCubit extends Cubit<CollegesState> {
  CollegesCubit() : super(CollegesInitial());
  List<CollegesListModel> collegesList = [];

  void getCollegesList({
    required Map<String, dynamic> query,
  }) async {
    //
    emit(GetCollegesListLoadingState());

    try {
      collegesList = [];
      var response = await DioService.getDate(
        query: query,
        url: '/pharmacy/inventory/college',
      );
      for (Map<String, dynamic> element in response.data) {
        collegesList.add(CollegesListModel.fromJson(json: element));
      }
      emit(GetCollegesListSuccessState());
    } catch (e) {
      emit(GetCollegesListFailureState());
      print(e.toString());
    }
  }
}
