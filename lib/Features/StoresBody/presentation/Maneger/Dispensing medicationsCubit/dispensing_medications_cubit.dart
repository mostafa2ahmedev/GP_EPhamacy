import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/PrescriptionModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_state.dart';
import 'package:gppharmacy/Utils/DioService.dart';

class DispensingMedicationsCubit extends Cubit<DispensingMedicationsState> {
  DispensingMedicationsCubit() : super(DispensingMedicationsInitial());

  List<PrescriptionModel> prescriptionList = [];
  List<PrescriptionModel> searchedPrescriptionList = [];
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

  void getPrescriptionDataForSrf() async {
    url = '/pharmacy/useages';
    try {
      emit(GetPrescriptionDataForSaleLoadingState());
      var response = await DioService.getDate(url: url!);

      for (var element in response.data) {
        prescriptionList.add(PrescriptionModel.fromJson(json: element));
      }

      searchedPrescriptionList = prescriptionList;
      emit(GetPrescriptionDataForSaleSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetPrescriptionDataForSaleFailureState());
    }
  }
}
