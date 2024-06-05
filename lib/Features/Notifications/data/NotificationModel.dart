import '../../StoresBody/data/SalesInventory/MedicineModel.dart';

class NotificationModel {
  final int id;
  final String message;
  final MedicineModel medicine;
  final int orderid;

  NotificationModel({
    required this.id,
    required this.message,
    required this.medicine,
    required this.orderid,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      message: json['message'],
      orderid: json['orderid'],
      medicine: MedicineModel.fromjson(json: json['medicine']),
    );
  }
}
