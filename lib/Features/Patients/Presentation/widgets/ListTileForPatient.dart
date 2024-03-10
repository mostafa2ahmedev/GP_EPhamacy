import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Patients/data/Patient_Model.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';

class ListTileForPatient extends StatelessWidget {
  final PatientModel patientModel;
  const ListTileForPatient({super.key, required this.patientModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MethodHelper.ShowPatientDetails(context, patientModel: patientModel);
      },
      child: ListTile(
        title: Text(patientModel.name),
        subtitle: Text('${patientModel.national_id}'),
        trailing: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).drawerTheme.backgroundColor,
          ),
          child: Center(
            child: Text(
              '${patientModel.age}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
