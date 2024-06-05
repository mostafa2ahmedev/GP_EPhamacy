import 'package:gppharmacy/Features/StoresBody/data/Orders/OrderMedicine_Model.dart';

class InventoryModel {
  final int? id;
  final int? amount;

  final OrderMedicinesModel orderMedicinesModel;

  InventoryModel(
      {required this.id,
      required this.amount,
      required this.orderMedicinesModel});

  factory InventoryModel.fromJson({required Map<String, dynamic> json}) {
    return InventoryModel(
      id: json['id'],
      amount: json['amount'],
      orderMedicinesModel: OrderMedicinesModel.fromjson(
        json['orderMedicine'],
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'orderMedicine': orderMedicinesModel.toJson(),
    };
  }
}
