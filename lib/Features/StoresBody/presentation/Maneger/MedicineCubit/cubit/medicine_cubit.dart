import 'package:bloc/bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/DetailsForSalesInventoryModel.dart';
import 'package:gppharmacy/Utils/DioService.dart';

part 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit() : super(MedicineInitial());

  List<MedicineModel> medicinesList = [];
  List<MedicineModel> searchedList = [];
  void getMedicineData({required int typeOfSearch}) async {
    medicinesList = [];
    emit(GetMedicineDataLoadingState());
    String url = '';
    if (typeOfSearch == 1 || typeOfSearch == 2) {
      url = '/pharmacy/medicines/category/$typeOfSearch';
    } else if (typeOfSearch == 3) {
      url = '/pharmacy/medicines/mix';
    } else {
      url = '/pharmacy/medicines';
    }
    try {
      var response = await DioService.getDate(url: url);

      for (var element in response.data) {
        medicinesList.add(MedicineModel.fromjson(json: element));
      }

      searchedList = medicinesList;
      emit(GetMedicineDataSuccessState());
    } catch (e) {}
  }

  void searchingInMedicineDataList(
      {required String typeOfSearch, required String searchedText}) {
    searchedList = [];
    if (typeOfSearch == 'اسم الدواء') {
      for (var element in medicinesList) {
        if (element.englishname
            .toLowerCase()
            .contains(searchedText.toLowerCase())) {
          searchedList.add(element);
        }
      }
    } else {
      for (var element in medicinesList) {
        if (element.barcode.toString().contains(searchedText)) {
          searchedList.add(element);
        }
      }
    }
    emit(GetMedicineDataSuccessState());
  }

//
//
//
  void updateMedicineData({required MedicineModel medicineModel}) {
    emit(UpdateMedicineDataLoadingState());
    try {
      DioService.updateData(
        url: '/pharmacy/medicines',
        query: {
          "arabicname": medicineModel.arabicname,
          "name": medicineModel.englishname,
          "activeingredient": medicineModel.activeingredient,
          "alertamount": medicineModel.alertamount,
          "alertexpired": medicineModel.alertexpired,
          "barcode": medicineModel.barcode,
          "manufacturer": medicineModel.manufacturer,
          "medicineCategory": {
            "id": 1,
            "name": medicineModel.mediniceCategory.name
          },
        },
      );
      emit(UpdateMedicineDataSuccessState());
    } catch (e) {}
  }
}
///pharmacy/medicines/mix
///pharmacy/medicines