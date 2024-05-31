import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit_State.dart';
import 'package:gppharmacy/Features/Patients/data/Patient_Model.dart';
import 'package:gppharmacy/Utils/DioService.dart';

class PateintCubit extends Cubit<PateintCubitState> {
  PateintCubit() : super(PatientLoadingState());

  List<PatientModel> pateints = [];
  List<PatientModel> searched = [];

  fetchAllPateint() async {
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
}
