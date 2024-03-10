import 'package:bloc/bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/DetailsForSalesInventoryModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryStates.dart';
import 'package:gppharmacy/Utils/DioService.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/Sales%20inventoryModel.dart';

class SalesInventoryCubit extends Cubit<SalesInventoryStates> {
  SalesInventoryCubit() : super(StoresCubitInitial());
  List<SalesInventoryModel> salesInventoryList = [];
  SalesInventoryModelDetails? salesInventoryModelDetails;

// get salesInventoryList
  void getSalesInventory({
    required Map<String, dynamic> query,
  }) async {
    //
    emit(GetSalesInventoryLoadingState());

    try {
      salesInventoryList = [];
      var response = await DioService.getDate(
        query: query,
        url: '/pharmacy/inventory/sales',
      );
      for (Map<String, dynamic> element in response.data) {
        salesInventoryList.add(SalesInventoryModel.fromJson(json: element));
      }
      emit(GetSalesInventorySuccessState());
    } catch (e) {
      emit(GetSalesInventoryFailureState());
      print(e.toString());
    }
  }

  Future getSalesInventoryItemDetails({
    required String barcode,
    required String token,
  }) async {
    try {
      emit(GetSalesInventoryLoadingState());
      var response =
          await DioService.getDate(url: '/pharmacy/medicines/$barcode');

      salesInventoryModelDetails =
          SalesInventoryModelDetails.fromjson(json: response.data);

      emit(GetSalesInventorySuccessState());
    } catch (e) {
      emit(GetSalesInventoryFailureState());
    }
  }
}
