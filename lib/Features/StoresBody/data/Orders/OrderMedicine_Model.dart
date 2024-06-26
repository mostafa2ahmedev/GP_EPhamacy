import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';

class OrderMedicinesModel {
  final int? id;
  final int amount;
  final int price;
  final String expirydate;
  final MedicineModel medicine;

  OrderMedicinesModel(
      {required this.expirydate,
      this.id,
      required this.amount,
      required this.price,
      required this.medicine});

  factory OrderMedicinesModel.fromjson(json) {
    return OrderMedicinesModel(
      id: json['id'],
      amount: json['amount'],
      price: json['price'],
      medicine: MedicineModel.fromjson(json: json['medicine']),
      expirydate: json['expirydate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'price': price,
      'medicine': medicine.toJson(),
      'expirydate': expirydate,
    };
  }
}
