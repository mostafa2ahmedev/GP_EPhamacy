import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/InventoryModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';

class UsageMedicine {
  final int id;
  final int amount;
  final int price;
  final MedicineModel medicineModel;
  final InventoryModel inventoryModel;

  UsageMedicine({
    required this.id,
    required this.amount,
    required this.price,
    required this.medicineModel,
    required this.inventoryModel,
  });

  factory UsageMedicine.fromJson({required Map<String, dynamic> json}) {
    return UsageMedicine(
      id: json['id'],
      amount: json['amount'],
      price: json['price'],
      medicineModel: MedicineModel.fromjson(json: json['medicine']),
      inventoryModel: InventoryModel.fromJson(json: json['inventory']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'price': price,
      'medicine': medicineModel.toJson(),
      'inventory': inventoryModel.toJson(),
    };
  }
}
