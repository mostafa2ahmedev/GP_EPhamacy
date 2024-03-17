import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/PrescriptionModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_state.dart';
import 'package:gppharmacy/Utils/DioService.dart';

class DispensingMedicationsCubit extends Cubit<DispensingMedicationsState> {
  DispensingMedicationsCubit() : super(DispensingMedicationsInitial());

  List<PrescriptionModel> prescriptionList = [];
  List<PrescriptionModel> searchedPrescriptionList = [];

  void getPrescriptionData({@required int? indexToSearch}) async {
    prescriptionList = [];
    print('getData');
    String url;
    emit(GetPrescriptionDataLoadingState());
    if (indexToSearch == 1) {
      url = '/pharmacy/prescriptions/type?isChronic=true';
    } else if (indexToSearch == 2) {
      url = '/pharmacy/prescriptions/type?isChronic=false';
    } else if (indexToSearch == 4) {
      url = '/pharmacy/useages';
    } else {
      url = '/pharmacy/prescriptions';
    }
    try {
      var response = await DioService.getDate(url: url);

      for (var element in response.data) {
        prescriptionList.add(PrescriptionModel.fromJson(json: element));
      }

      searchedPrescriptionList = prescriptionList;

      emit(GetPrescriptionDataSuccessState());
    } catch (e) {
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
}
