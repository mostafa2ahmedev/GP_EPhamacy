import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/PrescriptionModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/UsagesModal.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_cubit.dart';
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
        BlocProvider.of<DispensingMedicationsCubit>(context).inventorys = [];
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

class ListTileForDispensingMedicationsSale extends StatelessWidget {
  const ListTileForDispensingMedicationsSale({
    super.key,
    required this.usagesPrescription,
  });
  final UsagesPrescription usagesPrescription;
  @override
  Widget build(BuildContext context) {
    return CustomBorderForItems(
      child: GestureDetector(
        onTap: () {
          MethodHelper.showDetailsPrescription(context,
              usagePrescription: usagesPrescription);
        },
        child: ListTile(
          title: Text(usagesPrescription.prescriptionModel.patientModel.name),
          subtitle: Text(usagesPrescription.date),
          trailing: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).drawerTheme.backgroundColor,
            ),
            child: Center(
              child: Text(
                '${usagesPrescription.id.toString()}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
