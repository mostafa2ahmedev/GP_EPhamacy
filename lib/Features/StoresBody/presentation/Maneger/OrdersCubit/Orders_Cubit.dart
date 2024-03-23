import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/Order_Model.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/OrdersCubitStates.dart';
import 'package:gppharmacy/Utils/DioService.dart';

class OrdersCubit extends Cubit<OrdersCubitStates> {
  OrdersCubit() : super(OrdersCubitLoadingStates());

  List<OrderModel> orders = [];
  List<OrderModel> searchedOrder = [];

  fetchAllOrders() async {
    orders = [];
    emit(OrdersCubitLoadingStates());
    try {
      var response = await DioService.getDate(url: '/pharmacy/orders');

      for (var element in response.data) {
        orders.add(OrderModel.fromjson(element));
      }
      searchedOrder = orders;
      emit(OrdersCubitSuccessStates());
    } on DioException catch (e) {
      emit(OrdersCubitFaulierStates(errorMsg: e.message ?? 'Error'));
    }
  }

  searchOrders(String value, String searchtype) {
    searchedOrder = [];
    if (searchtype == 'طلب الامداد') {
      for (var element in orders) {
        if ('${element.supplyrequest}'.contains(value)) {
          searchedOrder.add(element);
        }
      }
    } else {
      for (var element in orders) {
        for (var medicine in element.orderMedicines) {
          if (medicine.medicine.englishname
              .toLowerCase()
              .contains(value.toLowerCase())) {
            searchedOrder.add(element);
            break;
          }
        }
      }
    }
    emit(OrdersCubitSuccessStates());
  }
}
