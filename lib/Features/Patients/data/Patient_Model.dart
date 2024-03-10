import 'package:gppharmacy/Features/Patients/data/Disease_Model.dart';

class PatientModel {
  final String name;
  final int national_id;
  final String gender;
  final bool chronic;
  final String level;
  final String collegeName;
  final int age;
  final String phone_number;
  final List<DiseaseModel> diseases;

  PatientModel(
      {required this.diseases,
      required this.name,
      required this.national_id,
      required this.gender,
      required this.chronic,
      required this.level,
      required this.collegeName,
      required this.age,
      required this.phone_number});

  factory PatientModel.fromJson(json) {
    List<DiseaseModel> x = [];
    for (var element in json['disease']) {
      x.add(DiseaseModel.fromJson(element));
    }

    return PatientModel(
      name: json['name'],
      national_id: json['national_id'],
      gender: json['gender'],
      chronic: json['chronic'],
      level: json['level'],
      collegeName: json['collegeName'],
      age: json['age'],
      phone_number: json['phone_number'],
      diseases: x,
    );
  }
}
