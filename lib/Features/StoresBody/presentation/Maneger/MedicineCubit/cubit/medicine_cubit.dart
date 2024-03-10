import 'package:bloc/bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/DetailsForSalesInventoryModel.dart';
import 'package:gppharmacy/Utils/DioService.dart';

part 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit() : super(MedicineInitial());

  List<MedicineModel> medicinesList = [];
  List<MedicineModel> searchedList = [];
  void getMedicineData(
      {required int typeOfSearch, required String token}) async {
    emit(GetMedicineDataLoadingState());

    try {
      var response = await DioService.getDate(
          url: '/pharmacy/medicines/category/$typeOfSearch');

      medicinesList.add(MedicineModel.fromjson(json: response.data));
      searchedList = medicinesList;
      emit(GetMedicineDataSuccessState());
    } catch (e) {
      emit(GetMedicineDataFailureState());
    }
  }

  void searchingInMedicineDataList({required String typeOfSearch}) {}
}
