import 'package:flutter/material.dart';

import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/PrescriptionModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/UsagesModal.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/ListTileForDispensingMedications.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoMatchingData.dart';

class ListViewOfDispensingMedications extends StatelessWidget {
  const ListViewOfDispensingMedications(
      {super.key, required this.presriptionList});
  final List<PrescriptionModel> presriptionList;
  @override
  Widget build(BuildContext context) {
    return presriptionList.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemCount: presriptionList.length,
              itemBuilder: (context, index) {
                return ListTileForDispensingMedications(
                  prescriptionModel: presriptionList[index],
                );
              },
            ),
          )
        : const CustomNoMatchingData();
  }
}

class ListViewOfDispensingMedicationsSale extends StatelessWidget {
  const ListViewOfDispensingMedicationsSale(
      {super.key, required this.usagePrescription});
  final List<UsagesPrescription> usagePrescription;
  @override
  Widget build(BuildContext context) {
    return usagePrescription.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemCount: usagePrescription.length,
              itemBuilder: (context, index) {
                return ListTileForDispensingMedicationsSale(
                  usagesPrescription: usagePrescription[index],
                );
              },
            ),
          )
        : const CustomNoMatchingData();
  }
}
