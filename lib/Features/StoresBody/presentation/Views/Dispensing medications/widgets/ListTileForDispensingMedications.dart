import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/PrescriptionModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/InnerDispense.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/Utils/Widgets/CustomBorderForItems.dart';

class ListTileForDispensingMedications extends StatelessWidget {
  const ListTileForDispensingMedications({
    super.key,
    required this.prescriptionModel,
  });
  final PrescriptionModel prescriptionModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MethodHelper.navigateTo(
            context,
            InnerDispense(
              prescriptionModel: prescriptionModel,
            ));
      },
      child: CustomBorderForItems(
        child: ListTile(
          title: Text(prescriptionModel.patientModel.name),
          subtitle: Text(prescriptionModel.patientModel.studentId.toString()),
        ),
      ),
    );
  }
}
