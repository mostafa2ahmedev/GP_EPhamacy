import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/medicineCategoryModel.dart';

class MedicineModel {
  final int? id;
  final int barcode;
  final String englishname;
  final String arabicname;
  final String? dosageform;
  final String? strength;
  final String? activeingredient;
  final String? manufacturer;
  final int alertamount;
  final int alertexpired;
  final MediniceCategory mediniceCategory;
  final String unit;

  MedicineModel(
      {this.id,
      required this.barcode,
      required this.englishname,
      required this.arabicname,
      this.dosageform,
      this.strength,
      required this.activeingredient,
      required this.manufacturer,
      required this.alertamount,
      required this.alertexpired,
      required this.mediniceCategory,
      required this.unit});

  factory MedicineModel.fromjson({required Map<String, dynamic> json}) {
    return MedicineModel(
      unit: json['unit'],
      id: json['id'],
      barcode: json['barcode'],
      englishname: json['name'],
      arabicname: json['arabicname'],
      dosageform: json['dosageform'] ?? '',
      strength: json['strength'] ?? '',
      activeingredient: json['activeingredient'] ?? "",
      manufacturer: json['manufacturer'] ?? "",
      alertamount: json['alertamount'],
      alertexpired: json['alertexpired'],
      mediniceCategory: MediniceCategory.fromjson(
        json: json['medicineCategory'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unit': unit,
      'id': id,
      'barcode': barcode,
      'name': englishname,
      'arabicname': arabicname,
      'dosageform': dosageform,
      'strength': strength,
      'activeingredient': activeingredient,
      'manufacturer': manufacturer,
      'alertamount': alertamount,
      'alertexpired': alertexpired,
      'medicineCategory': mediniceCategory.toJson(),
    };
  }
}
