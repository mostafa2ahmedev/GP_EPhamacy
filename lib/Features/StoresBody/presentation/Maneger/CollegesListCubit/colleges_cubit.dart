import 'package:bloc/bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/CollegesList/CollegesListModel.dart';
import 'package:gppharmacy/Utils/DioService.dart';
import 'package:meta/meta.dart';

part 'colleges_state.dart';

class CollegesCubit extends Cubit<CollegesState> {
  CollegesCubit() : super(CollegesInitial());
  List<CollegesListModel> collegesList = [];

  void getCollegesList({
    required String token,
    required Map<String, dynamic> query,
  }) async {
    //
    emit(getCollegesListLoadingState());

    try {
      collegesList = [];
      var response = await DioService.getDate(
        query: query,
        url: '/pharmacy/inventory/college',
        token: token,
      );
      for (Map<String, dynamic> element in response.data) {
        collegesList.add(CollegesListModel.fromJson(json: element));
      }
      emit(getCollegesListSuccessState());
    } catch (e) {
      emit(getCollegesListFailureState());
      print(e.toString());
    }
  }
}
