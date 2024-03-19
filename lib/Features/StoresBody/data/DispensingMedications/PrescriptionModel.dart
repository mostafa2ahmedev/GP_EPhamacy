import 'package:gppharmacy/Features/Patients/data/Patient_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/UsagesModal.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/DetailsForSalesInventoryModel.dart';

class PrescriptionModel {
  final int id;
  final String? diagnosis;
  final PatientModel patientModel;
  final List<MedicineModel> medicineModel;
  final List<Usages>? usageMedicine;

  PrescriptionModel({
    required this.id,
    required this.diagnosis,
    required this.patientModel,
    required this.medicineModel,
    required this.usageMedicine,
  });

  factory PrescriptionModel.fromJson({required Map<String, dynamic> json}) {
    List<MedicineModel> listOfMedicines = [];
    for (var element in json['medicines']) {
      listOfMedicines.add(MedicineModel.fromjson(json: element));
    }
    List<Usages>? usages = [];
    if (json['useageMedicines'] != null) {
      for (var element in json['useageMedicines']) {
        usages.add(Usages.fromJson(json: element));
      }
    }

    return PrescriptionModel(
        id: json['id'],
        diagnosis: json['diagnosis'] ?? '',
        patientModel: PatientModel.fromJson(json['patient']),
        medicineModel: listOfMedicines,
        usageMedicine: usages);
  }
}
