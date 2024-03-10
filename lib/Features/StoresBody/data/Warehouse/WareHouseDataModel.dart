import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/DetailsForSalesInventoryModel.dart';

class WarehouseDataModel {
  final int amount;
  final SalesInventoryModelDetails salesInventoryModelDetails;

  WarehouseDataModel(
      {required this.amount, required this.salesInventoryModelDetails});

  factory WarehouseDataModel.fromJson({required Map<String, dynamic> json}) {
    return WarehouseDataModel(
      amount: json['amount'],
      salesInventoryModelDetails: SalesInventoryModelDetails.fromjson(
        json: json['medicine'],
      ),
    );
  }
}
