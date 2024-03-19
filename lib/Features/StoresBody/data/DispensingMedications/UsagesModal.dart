import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/InventoryModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/DetailsForSalesInventoryModel.dart';

class Usages {
  final int id;
  final int amount;
  final int price;
  final MedicineModel medicine;
  final InventoryModel inventoryModel;

  Usages(
      {required this.id,
      required this.amount,
      required this.price,
      required this.medicine,
      required this.inventoryModel});
  factory Usages.fromJson({required Map<String, dynamic> json}) {
    return Usages(
        id: json['id'],
        amount: json['amount'],
        price: json['price'],
        medicine: MedicineModel.fromjson(json: json['medicine']),
        inventoryModel: InventoryModel.fromJson(
          json: json['inventory'],
        ));
  }
}
