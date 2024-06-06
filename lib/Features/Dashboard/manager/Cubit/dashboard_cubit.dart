import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Dashboard/data/statistics_model/statistics_model.dart';
import 'package:gppharmacy/Features/Dashboard/manager/Cubit/dashboard_state.dart';
import 'package:gppharmacy/Utils/DioService.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitialState());

  StatisticsModel? statisticsModel;

  fetchStatisticsData(int year) async {
    try {
      emit(DashboardLoadingState());
      Response response = await DioService.getDate(
          url: "/pharmacy/dashboard/statistics?year=$year");

      statisticsModel = StatisticsModel.fromJson(response.data);

      emit(DashboardSuccessState());
    } on Exception catch (e) {
      emit(DashboardFailedState());
    }
  }
}
