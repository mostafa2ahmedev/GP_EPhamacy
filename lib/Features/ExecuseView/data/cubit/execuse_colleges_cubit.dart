import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gppharmacy/Features/ExecuseView/data/ExecuseModel.dart';
import 'package:gppharmacy/Features/ExecuseView/data/cubit/execuse_colleges_state.dart';

import '../../../../Utils/DioService.dart';

class ExecuseCollegesCubit extends Cubit<ExecuseCollegesState> {
  ExecuseCollegesCubit() : super(ExecuseCollegesInitial());

  List<UsageColleges> usagesColleges = [];
  List<UsageColleges> searchedColleges = [];
  void getCollegesExecuse() async {
    Response? response;
    usagesColleges = [];
    emit(ExecuseCollegesLoadingState());
    String url = '/pharmacy/collegeuseages';
    try {
      response = await DioService.getDate(url: url);

      for (var element in response.data) {
        usagesColleges.add(UsageColleges.fromJson(element));
      }

      searchedColleges = usagesColleges;
      emit(ExecuseCollegesSuccessState());
    } catch (e) {
      print(e.toString());
      print(response.toString());

      emit(ExecuseCollegesFailure());
    }
  }

  void searchingInCollegesDataList(
      {required String typeOfSearch, required String searchedText}) {
    searchedColleges = [];
    if (typeOfSearch == 'اسم الدواء') {
      for (var element in usagesColleges) {
        for (var element2 in element.collegeUseageMedicines!) {
          if (element2.inventory!.orderMedicinesModel.medicine.englishname
              .toLowerCase()
              .contains(searchedText.toLowerCase())) {
            searchedColleges.add(element);
          }
        }
      }
    } else if (typeOfSearch == 'اسم الكليه') {
      for (var element in usagesColleges) {
        if (element.collegeName!
            .toLowerCase()
            .contains(searchedText.toLowerCase())) {
          searchedColleges.add(element);
        }
      }
    } else if (typeOfSearch == 'رقم الاذن') {
      for (var element in usagesColleges) {
        if (element.id.toString().contains(searchedText.toLowerCase())) {
          searchedColleges.add(element);
        }
      }
    } else {
      for (var element in usagesColleges) {
        for (var element2 in element.collegeUseageMedicines!) {
          if (element2.inventory!.orderMedicinesModel.medicine.arabicname
              .toLowerCase()
              .contains(searchedText.toLowerCase())) {
            searchedColleges.add(element);
          }
        }
      }
    }
    emit(ExecuseCollegesSuccessState());
  }
}
