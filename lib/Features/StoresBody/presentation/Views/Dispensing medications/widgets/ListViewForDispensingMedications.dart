import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_state.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/ListTileForDispensingMedications.dart';

class ListViewOfDispensingMedications extends StatelessWidget {
  const ListViewOfDispensingMedications({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DispensingMedicationsCubit, DispensingMedicationsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<DispensingMedicationsCubit>(context);

        return Expanded(
          child: ListView.builder(
            itemCount: cubit.searchedPrescriptionList.length,
            itemBuilder: (context, index) {
              return ListTileForDispensingMedications(
                prescriptionModel: cubit.searchedPrescriptionList[index],
              );
            },
          ),
        );
      },
    );
  }
}
