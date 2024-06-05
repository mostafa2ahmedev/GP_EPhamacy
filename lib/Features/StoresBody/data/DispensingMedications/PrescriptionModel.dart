import 'package:gppharmacy/Features/Patients/data/Patient_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/UsagesModal.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/prsPrescriptionCategory.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';

class PrescriptionModel {
  final int id;
  final String? diagnosis;
  final PrsPrescriptionCategory prescriptionCategory;
  final PatientModel patientModel;
  final List<MedicineModel> medicineModel;
  // final List<Usages>? usageMedicine;

  PrescriptionModel(
      {required this.id,
      required this.diagnosis,
      required this.patientModel,
      required this.medicineModel,
      // required this.usageMedicine,
      required this.prescriptionCategory});

  factory PrescriptionModel.fromJson({required Map<String, dynamic> json}) {
    List<MedicineModel> listOfMedicines = [];
    for (var element in json['medicines']) {
      listOfMedicines.add(MedicineModel.fromjson(json: element));
    }
    List<UsagesPrescription>? usages = [];
    if (json['useageMedicines'] != null) {
      for (var element in json['useageMedicines']) {
        usages.add(UsagesPrescription.fromJson(json: element));
      }
    }

    return PrescriptionModel(
      id: json['id'],
      diagnosis: json['diagnosis'] ?? '',
      patientModel: PatientModel.fromJson(json['patient']),
      medicineModel: listOfMedicines,
      // usageMedicine: usages,
      prescriptionCategory: PrsPrescriptionCategory.fromJson(
          json: json['prsPrescriptionCategory']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'diagnosis': diagnosis,
      'prsPrescriptionCategory': prescriptionCategory.toJson(),
      'patient': patientModel.toJson(),
      'medicines': medicineModel.map((medicine) => medicine.toJson()).toList(),
      // 'useageMedicines': usageMedicine?.map((usage) => usage.toJson()).toList(),
    };
  }
}
