import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Patients/Presentation/widgets/ListTileForPatient.dart';
import 'package:gppharmacy/Features/Patients/data/Patient_Model.dart';

class ListViewOfPatient extends StatelessWidget {
  const ListViewOfPatient({super.key, required this.patients});
  final List<PatientModel> patients;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return ListTileForPatient(
            patientModel: patients[index],
          );
        },
      ),
    );
  }
}
