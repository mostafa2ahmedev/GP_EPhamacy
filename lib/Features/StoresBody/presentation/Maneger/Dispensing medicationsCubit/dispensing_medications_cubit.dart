import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/InventoryModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/PrescriptionModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/UsagesModal.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_state.dart';
import 'package:gppharmacy/Utils/DioService.dart';

class DispensingMedicationsCubit extends Cubit<DispensingMedicationsState> {
  DispensingMedicationsCubit() : super(DispensingMedicationsInitial());

  List<List<InventoryModel>> inventorys = [];
  List<PrescriptionModel> prescriptionList = [];
  List<PrescriptionModel> searchedPrescriptionList = [];
  List<UsagesPrescription> usagePrescription = [];

  int totalAmount = 0;

  void changeAmount() {
    emit(ChangeTotalAmount());
  }

  int counter = 1;
  String? url;
  void getPrescriptionData({@required int? indexToSearch}) async {
    prescriptionList = [];

    emit(GetPrescriptionDataLoadingState());
    if (indexToSearch == 1) {
      url = '/pharmacy/prescriptions/type?isChronic=true';
      print(indexToSearch);
    } else if (indexToSearch == 2) {
      url = '/pharmacy/prescriptions/type?isChronic=false';
      print(indexToSearch);
    } else if (indexToSearch == 3) {
      url = '/pharmacy/prescriptions';
      print(indexToSearch);
    } else {
      print(indexToSearch);
      getPrescriptionDataForSrf();
    }
    try {
      var response = await DioService.getDate(url: url!);

      for (var element in response.data) {
        prescriptionList.add(PrescriptionModel.fromJson(json: element));
      }

      searchedPrescriptionList = prescriptionList;

      emit(GetPrescriptionDataSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetPrescriptionDataFailureState());
    }
  }

  void searchingInPrescriptionList(
      {required String wayOfSearch, required String text}) {
    searchedPrescriptionList = [];

    if (wayOfSearch == 'اسم الطالب') {
      for (var element in prescriptionList) {
        if (element.patientModel.name.contains(text)) {
          searchedPrescriptionList.add(element);
        }
      }
    } else if (wayOfSearch == 'رقم الروشته') {
      for (var element in prescriptionList) {
        if (element.id.toString().contains(text)) {
          searchedPrescriptionList.add(element);
        }
      }
    } else if (wayOfSearch == 'اسم الدواء') {
      for (var element in prescriptionList) {
        for (var element2 in element.medicineModel) {
          if (element2.englishname.toLowerCase().contains(text.toLowerCase())) {
            searchedPrescriptionList.add(element);
          }
        }
      }
    }
    emit(GetPrescriptionDataSuccessState());
  }

  ///
  ///
  ///
  ///
  ///
  void getPrescriptionDataForSrf() async {
    try {
      emit(GetPrescriptionDataForSaleLoadingState());
      var response = await DioService.getDate(url: '/pharmacy/useages');

      for (var element in response.data) {
        usagePrescription.add(UsagesPrescription.fromJson(json: element));
      }
      print("hello");
      emit(GetPrescriptionDataForSaleSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetPrescriptionDataForSaleFailureState());
      print("not hello");
    }
  }

/////
  ///
  ///
  ///
  ///
  void postPrescriptionData(
      {required PrescriptionModel prescriptionModel}) async {
    emit(PostPatientDataLoadingState());
    Response? response;
    print(prescriptionModel.toJson());
    try {
      await DioService.postData(
          url: '/pharmacy/prescriptions', data: prescriptionModel.toJson());
      emit(PostPatientDataSuccessState());
    } catch (e) {
      print(response!.data);
      emit(PostPatientDataFailureState());
    }
  }

  void getALLMedicineForPrescrptionInInventory(
      {required PrescriptionModel prescriptionModel}) {
    inventorys = [];
    emit(GetInventorySalesPrescriptionLoadingState());
    for (var element in prescriptionModel.medicineModel) {
      print("hi");
      getALLMedicineInInventory(barcode: element.barcode);
    }
  }

  // void getALLMedicineInInventory({required int barcode}) async {
  //   Response? response;
  //   try {
  //     print("hello");
  //     response = await DioService.getDate(url: "/pharmacy/inventory/$barcode");
  //     inventorys.add(response.data);
  //     emit(GetInventorySalesPrescriptionSuccessState());
  //   } catch (e) {
  //     print(response!.data);
  //     print(e.toString());
  //     print("bad");
  //     emit(GetInventorySalesPrescriptionFailureState());
  //   }
  // }
  void getALLMedicineInInventory({required int barcode}) async {
    Response? response;
    try {
      print("hello");
      response = await DioService.getDate(url: "/pharmacy/inventory/$barcode");
      List<dynamic> responseData = response.data;
      List<InventoryModel> inventoryList = responseData
          .map((item) => InventoryModel.fromJson(json: item))
          .toList();
      inventorys.add(inventoryList);
      if (inventoryList.isEmpty) {
        emit(NoDataInList());
        return;
      }
      emit(GetInventorySalesPrescriptionSuccessState());
      print(response.data);
    } catch (e) {
      print(response!.data);
      print(e.toString());
      print("bad");
      emit(GetInventorySalesPrescriptionFailureState());
    }
  }
}
