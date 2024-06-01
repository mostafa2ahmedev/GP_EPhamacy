import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/UnitModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/medicineCategoryModel.dart';
import 'package:gppharmacy/Utils/DioService.dart';

part 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit() : super(MedicineInitial());

  List<MedicineModel> medicinesList = [];
  List<MedicineModel> searchedList = [];
  List<MediniceCategory> categories = [];
  List<UnitModel> LargeUnits = [];
  List<UnitModel> smallUnits = [];

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
    } catch (e) {
      emit(GetMedicineDataFailureState());
    }
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
    Response? response;
    try {
      emit(AddNewMedicineLoadingState());

      response = await DioService.postData(
          url: '/pharmacy/medicines', data: medicineModel.toJson());
      emit(AddNewMedicineSuccessState());
    } catch (e) {
      print(e.toString());
      print(response!.data);
      emit(AddNewMedicineFailureState());
    }
  }

//
//
//
//

  void addUnit({required bool isLarge, required String unitValue}) async {
    try {
      emit(GetCategoriesLoadingState());
      await DioService.postData(
        url: '/pharmacy/unit/${isLarge ? "max" : "min"}',
        query: {"name": unitValue},
      );
      print('CategoryAddedSuccessfuly');
      getUnitData();
    } catch (e) {
      print(e.toString());
    }
  }

  void getUnitData() async {
    emit(GetCategoriesLoadingState());
    try {
      smallUnits = [];
      LargeUnits = [];

      var unitList = await DioService.getDate(
        url: '/pharmacy/unit/min',
      );
      var unitList2 = await DioService.getDate(
        url: '/pharmacy/unit/max',
      );
      for (var element in unitList.data) {
        smallUnits.add(UnitModel.fromjson(json: element));
      }
      for (var element in unitList2.data) {
        LargeUnits.add(UnitModel.fromjson(json: element));
      }

      emit(GetCategoriesSuccessState());
      print('UnitsArrived');
    } catch (e) {
      print(e.toString());
      print('UnitNotArrived');
    }
  }

//
//
//
//
  void addNewCategory({required String category}) async {
    try {
      emit(GetCategoriesLoadingState());
      await DioService.postData(url: '/pharmacy/medicinecategories', data: {
        'name': category,
      });
      print('CategoryAddedSuccessfuly');
      getCatagoryData();
    } catch (e) {
      print(e.toString());
    }
  }

  void getCatagoryData() async {
    emit(GetCategoriesLoadingState());
    try {
      categories = [];

      var catList = await DioService.getDate(
        url: '/pharmacy/medicinecategories',
      );
      for (var element in catList.data) {
        categories.add(MediniceCategory.fromjson(json: element));
      }

      emit(GetCategoriesSuccessState());
      print('CategoryArrivedSuccessfuly');
    } catch (e) {
      print(e.toString());
      print('CategoryNotArrived');
    }
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

  int getCategoryId({required String catName}) {
    int catId = 0;
    for (var element in categories) {
      if (element.name == catName) {
        catId = element.id;
        break;
      }
    }
    return catId;
  }
}
///pharmacy/medicines/mix
///pharmacy/medicines