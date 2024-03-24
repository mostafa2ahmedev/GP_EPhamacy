import '../../StoresBody/data/SalesInventory/MedicineModel.dart';

class NotificationModel {
  final int id;
  final String message;
  final MedicineModel medicine;

  NotificationModel({
    required this.id,
    required this.message,
    required this.medicine,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      message: json['message'],
      medicine: MedicineModel.fromjson(json: json['medicine']),
    );
  }
}
