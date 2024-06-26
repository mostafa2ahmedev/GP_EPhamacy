import 'package:gppharmacy/Features/Patients/data/Disease_Model.dart';

class PatientModel {
  final String name;
  final int nationalId;
  final int? studentId;
  final String gender;
  final bool chronic;
  final String level;
  final String collegeName;
  final int? age;
  final String? phoneNumber;
  final List<DiseaseModel> diseases;

  PatientModel(
      {required this.diseases,
      required this.name,
      required this.nationalId,
      required this.gender,
      required this.chronic,
      required this.level,
      required this.collegeName,
      this.age,
      this.phoneNumber,
      this.studentId});

  factory PatientModel.fromJson(json) {
    List<DiseaseModel> x = [];
    for (var element in json['disease']) {
      x.add(DiseaseModel.fromJson(element));
    }

    return PatientModel(
      name: json['name'],
      nationalId: json['nationalid'],
      gender: json['gender'],
      chronic: json['chronic'],
      level: json['level'],
      collegeName: json['collegeName'],
      age: json['age'],
      phoneNumber: json['phone_number'],
      diseases: x,
      studentId: json['student_id'],
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> diseasesJson =
        diseases.map((disease) => disease.toJson()).toList();

    return {
      'name': name,
      'nationalid': nationalId,
      'gender': gender,
      'chronic': chronic,
      'level': level,
      'collegeName': collegeName,
      'age': age,
      'phone_number': phoneNumber,
      'disease': diseasesJson,
      'student_id': studentId,
    };
  }
}
