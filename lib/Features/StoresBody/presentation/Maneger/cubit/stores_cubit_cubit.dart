import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/DioService.dart';
import 'package:gppharmacy/Features/StoresBody/data/Sales%20inventory.dart';
import 'package:meta/meta.dart';

part 'stores_cubit_state.dart';

class StoresCubit extends Cubit<StoresCubitState> {
  StoresCubit() : super(StoresCubitInitial());
  late List<SalesInventoryModel> salesInventoryList;
  late SalesInventoryModel salesInventoryModel;

  void getSalesInventory(
      {required Map<String, dynamic> query,
      required String token,
      required String month,
      required String year}) async {
    var response = await DioService.getDate(
        url: '/pharmacy/inventory/sales?month=3&year=2024',
        query: query,
        token: token);

    print(response.data);

    // salesInventoryModel = SalesInventoryModel.fromJson(json: response.data[0]);
  }
}
