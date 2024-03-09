import 'package:bloc/bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/DetailsForSalesInventoryModel.dart';
import 'package:gppharmacy/Utils/DioService.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/Sales%20inventoryModel.dart';
import 'package:meta/meta.dart';

part 'SalesInventoryStates.dart';

class SalesInventoryCubit extends Cubit<SalesInventoryStates> {
  SalesInventoryCubit() : super(StoresCubitInitial());
  List<SalesInventoryModel> salesInventoryList = [];
  SalesInventoryModelDetails? salesInventoryModelDetails;

// get salesInventoryList
  void getSalesInventory({
    required Map<String, dynamic> query,
  }) async {
    //
    emit(getSalesInventoryLoadingState());

    try {
      salesInventoryList = [];
      var response = await DioService.getDate(
        query: query,
        url: '/pharmacy/inventory/sales',
      );
      for (Map<String, dynamic> element in response.data) {
        salesInventoryList.add(SalesInventoryModel.fromJson(json: element));
      }
      emit(getSalesInventorySuccessState());
    } catch (e) {
      emit(getSalesInventoryFailureState());
      print(e.toString());
    }
  }

  Future getSalesInventoryItemDetails({
    required String barcode,
    required String token,
  }) async {
    try {
      emit(getDetailsSalesInventoryLoadingState());
      var response =
          await DioService.getDate(url: '/pharmacy/medicines/$barcode');

      salesInventoryModelDetails =
          SalesInventoryModelDetails.fromjson(json: response.data);

      emit(getSalesInventorySuccessState());
    } catch (e) {
      emit(getSalesInventoryFailureState());
    }
  }
}
