import 'package:gppharmacy/Features/StoresBody/data/Orders/OrderMedicine_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/Supplier_Model.dart';

class OrderModel {
  final int? id;
  final int supplyrequest;
  final int deliveryrequest;
  final String dateofsupply;
  final SupplierModel supplier;
  final List<OrderMedicinesModel> orderMedicines;

  OrderModel(
      {this.id,
      required this.supplyrequest,
      required this.deliveryrequest,
      required this.dateofsupply,
      required this.supplier,
      required this.orderMedicines});

  factory OrderModel.fromjson(json) {
    List<OrderMedicinesModel> x = [];
    for (var element in json['orderMedicines']) {
      x.add(OrderMedicinesModel.fromjson(element));
    }
    return OrderModel(
        id: json['id'],
        supplyrequest: json['supplyrequest'],
        deliveryrequest: json['deliveryrequest'],
        dateofsupply: json['dateofsupply'],
        supplier: SupplierModel.fromjson(json: json['supplier']),
        orderMedicines: x);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'supplyrequest': supplyrequest,
      'deliveryrequest': deliveryrequest,
      'dateofsupply': dateofsupply,
      'supplier': supplier.toJson(),
      'orderMedicines':
          orderMedicines.map((medicine) => medicine.toJson()).toList(),
    };
  }
}
