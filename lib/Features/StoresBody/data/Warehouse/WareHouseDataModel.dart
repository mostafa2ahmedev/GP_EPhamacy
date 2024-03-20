import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';

class WarehouseDataModel {
  final int amount;
  final MedicineModel salesInventoryModelDetails;

  WarehouseDataModel(
      {required this.amount, required this.salesInventoryModelDetails});

  factory WarehouseDataModel.fromJson({required Map<String, dynamic> json}) {
    return WarehouseDataModel(
      amount: json['amount'],
      salesInventoryModelDetails: MedicineModel.fromjson(
        json: json['medicine'],
      ),
    );
  }
}
