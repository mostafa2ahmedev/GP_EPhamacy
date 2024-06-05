import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Patients/Presentation/widgets/ListTileForPatient.dart';
import 'package:gppharmacy/Features/Patients/data/Patient_Model.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoMatchingData.dart';

class ListViewOfPatient extends StatelessWidget {
  const ListViewOfPatient({super.key, required this.patients});
  final List<PatientModel> patients;

  @override
  Widget build(BuildContext context) {
    return patients.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemCount: patients.length,
              itemBuilder: (context, index) {
                return ListTileForPatient(
                  patientModel: patients[index],
                );
              },
            ),
          )
        : const CustomNoMatchingData();
  }
}
