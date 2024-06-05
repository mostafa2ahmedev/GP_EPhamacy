import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit_State.dart';
import 'package:gppharmacy/Features/Patients/data/Disease_Model.dart';
import 'package:gppharmacy/Features/Patients/data/Patient_Model.dart';

import 'package:gppharmacy/Utils/DioService.dart';

import '../../StoresBody/data/SalesInventory/MedicineModel.dart';

class PateintCubit extends Cubit<PateintCubitState> {
  PateintCubit() : super(PatientLoadingState());

  List<PatientModel> pateints = [];

  List<PatientModel> searched = [];
  List<DiseaseModel> diseases = [];

  List<MedicineModel> medicinesPrescription = [];
  bool isChornic = false;

  fetchAllPateint() async {
    emit(PatientLoadingState());
    pateints = [];
    try {
      var response = await DioService.getDate(
        url: '/pharmacy/patients',
      );

      for (var element in response.data) {
        pateints.add(PatientModel.fromJson(element));
      }
      searched = pateints;
      emit(PatientSuccessState());
    } on DioException catch (e) {
      emit(PatientFaliureState(errMsq: e.message ?? 'Error'));
    }
  }

  searchByName(String value, String searchtype, String isChronic) {
    searched = [];
    if (isChronic == 'الكل') {
      if (searchtype == 'الرقم القومي للطالب') {
        for (var element in pateints) {
          if ('${element.nationalId}'.contains(value)) {
            searched.add(element);
          }
        }
      } else {
        for (var element in pateints) {
          if (element.name.toLowerCase().contains(value.toLowerCase())) {
            searched.add(element);
          }
        }
      }
    } else if (isChronic == 'مريض مزمن') {
      if (searchtype == 'الرقم القومي للطالب') {
        for (var element in pateints) {
          if ('${element.nationalId}'.contains(value) && element.chronic) {
            searched.add(element);
          }
        }
      } else {
        for (var element in pateints) {
          if (element.name.toLowerCase().contains(value.toLowerCase()) &&
              element.chronic) {
            searched.add(element);
          }
        }
      }
    } else {
      if (searchtype == 'الرقم القومي للطالب') {
        for (var element in pateints) {
          if ('${element.nationalId}'.contains(value) && !element.chronic) {
            searched.add(element);
          }
        }
      } else {
        for (var element in pateints) {
          if (element.name.toLowerCase().contains(value.toLowerCase()) &&
              !element.chronic) {
            searched.add(element);
          }
        }
      }
    }

    emit(PatientSuccessState());
  }

  void getAllChronicDieases() async {
    emit(GetDiseasesLoadingState());
    diseases = [];
    try {
      Response response = await DioService.getDate(
        url: '/pharmacy/diseases',
      );
      for (var element in response.data) {
        diseases.add(DiseaseModel.fromJson(element));
      }
      emit(GetDiseasesSuccessState());
    } catch (e) {
      emit(GetDiseasesFailureState());
    }
  }

  void postNewChronicDiesease({required String name}) async {
    emit(GetDiseasesLoadingState());
    try {
      await DioService.postData(
          url: "/pharmacy/diseases", data: {"name": name});

      getAllChronicDieases();
    } catch (e) {}
  }

  void postPatientData({required PatientModel patientModel}) async {
    emit(PostPatientDataLoadingState());
    Response? response;
    try {
      print(patientModel.toJson());
      response = await DioService.postData(
          url: '/pharmacy/patients', data: patientModel.toJson());

      emit(PostPatientDataSuccessState());
    } catch (e) {
      print(response!.data);

      emit(PostPatientDataFailureState());
    }
  }

  PatientModel? searchName({required String name}) {
    PatientModel? patientModel;
    for (var element in pateints) {
      if (element.name == name) {
        patientModel = element;
      }
    }
    return patientModel;
  }

  List<PatientModel> findPatients(String query) {
    return pateints.where((patient) {
      final patientLower = patient.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return patientLower.contains(queryLower);
    }).toList();
  }

  void assignMedicineToPrescriptionList(
      {required MedicineModel medicineModel}) async {
    medicinesPrescription.add(medicineModel);
    print("emited");
    emit(AssignMedicineToPrescriptionListt());
  }
}
