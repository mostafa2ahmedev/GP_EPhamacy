import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/PrescriptionModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/CustomDetailsItem.dart';
import 'package:gppharmacy/generated/l10n.dart';

import '../../../../../Utils/AppStyles.dart';

class InnerDispense extends StatelessWidget {
  const InnerDispense({super.key, required this.prescriptionModel});
  final PrescriptionModel prescriptionModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  S.of(context).SrfEladwya,
                  style: AppStyles.styleBold28(context),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "صرف",
                      style: TextStyle(fontSize: 25),
                    ))
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CustomDetailsItem(
              note: "رقم الروشته",
              data: prescriptionModel.id.toString(),
              icon: Icons.abc,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomDetailsItem(
              note: "التشخيص",
              data: prescriptionModel.diagnosis ?? "",
              icon: Icons.abc,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomDetailsItem(
              note: "اسم المريض",
              data: prescriptionModel.patientModel.name,
              icon: Icons.abc,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomDetailsItem(
              note: "نوع الروشته",
              data: prescriptionModel.prescriptionCategory.name,
              icon: Icons.abc,
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${index + 1}",
                              style: const TextStyle(fontSize: 20),
                            ),
                            CustomDetailsItem(
                              note: 'الدواء',
                              data: prescriptionModel
                                  .medicineModel[index].englishname,
                              icon: Icons.type_specimen,
                            ),
                            CustomDetailsItem(
                              note: 'الباركود',
                              data: prescriptionModel
                                  .medicineModel[index].barcode
                                  .toString(),
                              icon: Icons.type_specimen,
                            ),
                            const CustomDetailsItem(
                              note: 'الصلاحيه',
                              data: "",
                              icon: Icons.type_specimen,
                            ),
                            CustomDetailsItem(
                              note: 'الشركه المصنعه',
                              data: prescriptionModel
                                      .medicineModel[index].manufacturer ??
                                  "",
                              icon: Icons.type_specimen,
                            ),
                            const CustomDetailsItem(
                              note: 'السعر',
                              data: "",
                              icon: Icons.type_specimen,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemCount: prescriptionModel.medicineModel.length))
          ],
        ),
      ),
    );
  }
}
