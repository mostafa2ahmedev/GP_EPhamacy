import 'package:bloc/bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/Warehouse/WareHouseDataModel.dart';
import 'package:gppharmacy/Utils/DioService.dart';
import 'package:meta/meta.dart';

part 'warehouse_state.dart';

class WarehouseCubit extends Cubit<WarehouseState> {
  WarehouseCubit() : super(WarehouseInitial());

  List<WarehouseDataModel> warehouseList = [];
  List<WarehouseDataModel> searchedList = [];

  void getWarehouseData({
    required String token,
    Map<String, dynamic>? query,
  }) async {
    //
    emit(GetWarehouseDataLoadingState());

    try {
      warehouseList = [];
      var response = await DioService.getDate(
        query: query,
        url: '/pharmacy/inventory/all',
      );
      for (Map<String, dynamic> element in response.data) {
        warehouseList.add(WarehouseDataModel.fromJson(json: element));
      }
      searchedList = warehouseList;
      emit(GetWarehouseDataSuccessState());
    } catch (e) {
      emit(GetWarehouseDataFailureState());
      print(e.toString());
    }
  }

  void searchingOnWarehouseList({required String text, required bool toggler}) {
    searchedList = [];
    if (toggler) {
      //اسم الدواء
      for (var element in warehouseList) {
        if (element.salesInventoryModelDetails.englishname
            .toLowerCase()
            .contains(text.toLowerCase())) {
          searchedList.add(element);
        }
      }
    } else {
      for (var element in warehouseList) {
        if (element.salesInventoryModelDetails.barcode
            .toString()
            .contains(text)) {
          searchedList.add(element);
        }
      }
    }
    emit(GetWarehouseDataSuccessState());
  }
}
