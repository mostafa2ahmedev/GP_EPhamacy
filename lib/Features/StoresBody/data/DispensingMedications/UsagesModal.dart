import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/PrescriptionModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/UsageMedicine.dart';

class UsagesPrescription {
  final int id;
  final String date;
  final PrescriptionModel prescriptionModel;
  final List<UsageMedicine> usageMedicines;
  final int totalPrice;

  UsagesPrescription({
    required this.id,
    required this.date,
    required this.prescriptionModel,
    required this.usageMedicines,
    required this.totalPrice,
  });

  factory UsagesPrescription.fromJson({required Map<String, dynamic> json}) {
    List<UsageMedicine>? usages = [];
    if (json['useageMedicines'] != null) {
      for (var element in json['useageMedicines']) {
        usages.add(UsageMedicine.fromJson(json: element));
      }
    }

    return UsagesPrescription(
      id: json['id'],
      date: json['date'],
      prescriptionModel: PrescriptionModel.fromJson(json: json['prescription']),
      usageMedicines: usages,
      totalPrice: json['totalPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'prescription': prescriptionModel.toJson(),
      'useageMedicines': [],
      'totalPrice': totalPrice,
    };
  }
}
