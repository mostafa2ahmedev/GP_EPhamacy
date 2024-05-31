import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:gppharmacy/Features/Notifications/data/NotificationModel.dart';
import 'package:gppharmacy/Features/Notifications/presentation/Maneger/cubit/notificaiton_state.dart';
import 'package:gppharmacy/Utils/DioService.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificaitonInitial());
  List<NotificationModel> notifications = [];
  void getNotificationData() async {
    notifications = [];
    try {
      emit(GetNotificaitonLoadingState());
      var response = await DioService.getDate(url: '/pharmacy/notifications');

      for (var element in response.data) {
        notifications.add(NotificationModel.fromJson(element));
      }
      emit(GetNotificaitonSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetNotificaitonFailureState());
    }
  }
}
