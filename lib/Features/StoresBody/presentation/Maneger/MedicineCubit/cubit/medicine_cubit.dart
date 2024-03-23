import 'package:bloc/bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/medicineCategoryModel.dart';
import 'package:gppharmacy/Utils/DioService.dart';

part 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit() : super(MedicineInitial());

  List<MedicineModel> medicinesList = [];
  List<MedicineModel> searchedList = [];
  List<MediniceCategory> categories = [];
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
  void addNewMedicine({required MedicineModel medicineModel}) async {
    try {
      emit(AddNewMedicineLoadingState());
      Map<String, dynamic> medicine = {
        'name': medicineModel.englishname,
        'arabicname': medicineModel.arabicname,
        'activeingredient': medicineModel.activeingredient,
        'alertamount': medicineModel.alertamount,
        'alertexpired': medicineModel.alertexpired,
        'barcode': medicineModel.barcode,
        'manufacturer': medicineModel.manufacturer,
        'strength': medicineModel.strength,
        'medicineCategory': medicineModel.mediniceCategory
      };
      await DioService.postData(url: '/pharmacy/medicines', query: medicine);
      emit(AddNewMedicineSuccessState());
    } catch (e) {
      print(e.toString());
      emit(AddNewMedicineFailureState());
    }
  }

  void addNewCategory({required String category}) async {
    try {
      await DioService.postData(url: '/pharmacy/medicinecategories', query: {
        'name': category,
      });
      print('CategoryAddedSuccessfuly');
    } catch (e) {
      print(e.toString());
    }
  }

  void getCatagoryData() async {
    try {
      emit(GetCategoriesLoadingState());
      var catList = await DioService.getDate(
        url: '/pharmacy/medicinecategories',
      );
      for (var element in catList.data) {
        categories.add(element);
      }
      print(categories[0]);
      emit(GetCategoriesSuccessState());
      print('CategoryArrivedSuccessfuly');
    } catch (e) {
      print('CategoryNotAdded');
    }
  }

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