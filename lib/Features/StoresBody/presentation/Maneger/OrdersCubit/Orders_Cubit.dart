import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/OrderMedicine_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/Order_Model.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/OrdersCubitStates.dart';
import 'package:gppharmacy/Utils/DioService.dart';

import '../../../data/Orders/Supplier_Model.dart';

class OrdersCubit extends Cubit<OrdersCubitStates> {
  OrdersCubit() : super(OrdersCubitLoadingStates());

  List<OrderModel> orders = [];
  List<OrderModel> searchedOrder = [];
  List<SupplierModel> suppliers = [];
  List<OrderMedicinesModel> orderMedicines = [];

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

  void addNewSupplier({required String name}) async {
    try {
      emit(GetSupplierDataLoading());
      await DioService.postData(url: '/pharmacy/suppliers', data: {
        'name': name,
      });

      getSupplierData();
    } catch (e) {
      print(e.toString());
    }
  }

  void getSupplierData() async {
    emit(GetSupplierDataLoading());
    try {
      suppliers = [];

      var supData = await DioService.getDate(
        url: '/pharmacy/suppliers',
      );
      for (var element in supData.data) {
        suppliers.add(SupplierModel.fromjson(json: element));
      }
      emit(GetSupplierDataSuccess());
    } catch (e) {
      emit(GetSupplierDataFailure());
    }
  }

  void assignMedicineToImportList(
      {required OrderMedicinesModel orderModel}) async {
    orderMedicines.add(orderModel);
    emit(AssignOrderModelToImportListSuccessState());
  }

  void postMedicineImportData({required OrderModel orderModel}) async {
    emit(PostMedicineDataLoadingState());
    try {
      await DioService.postData(
          url: '/pharmacy/orders', data: orderModel.toJson());
      emit(PostMedicineDataSuccessState());
    } catch (e) {
      emit(PostMedicineDataFailureState());
    }
  }

  SupplierModel? getSupplierDataByName({required String name}) {
    SupplierModel? supplierModel;
    for (var element in suppliers) {
      if (element.name == name) {
        supplierModel = element;
        break;
      }
    }
    return supplierModel;
  }
}
