import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/PrescriptionModel.dart';

class ListTileForDispensingMedications extends StatelessWidget {
  const ListTileForDispensingMedications({
    super.key,
    required this.prescriptionModel,
  });
  final PrescriptionModel prescriptionModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        title: Text(prescriptionModel.id.toString()),
        subtitle: Text(prescriptionModel.patientModel.name),
        trailing: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).drawerTheme.backgroundColor,
          ),
          child: Center(
            child: Text(
              prescriptionModel.diagnosis!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
