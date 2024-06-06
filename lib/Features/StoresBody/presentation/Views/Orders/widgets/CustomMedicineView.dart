import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';

import '../../../../data/Orders/OrderMedicine_Model.dart';

// class CustomMedicineView extends StatelessWidget {
//   const CustomMedicineView({super.key, required this.orderMedicinesModel});
//   final OrderMedicinesModel orderMedicinesModel;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             const Text('الدواء'),
//             Text(orderMedicinesModel.medicine.englishname),
//           ],
//         ),
//         Row(
//           children: [
//             const Text('الكميه'),
//             Text(orderMedicinesModel.price.toString()),
//           ],
//         ),
//         Row(
//           children: [
//             const Text('الصلاحيه'),
//             Text(orderMedicinesModel.expirydate),
//           ],
//         ),
//         Row(
//           children: [
//             const Text('المصنع'),
//             Text(orderMedicinesModel.medicine.manufacturer ?? ""),
//           ],
//         ),
//         Row(
//           children: [
//             const Text('السعر'),
//             Text(orderMedicinesModel.price.toString()),
//           ],
//         ),
//       ],
//     );
//   }
// }

class CustomMedicineView2 extends StatefulWidget {
  const CustomMedicineView2({super.key, required this.orderMedicineList});
  final List<OrderMedicinesModel> orderMedicineList;

  @override
  State<CustomMedicineView2> createState() => _CustomMedicineView2State();
}

class _CustomMedicineView2State extends State<CustomMedicineView2> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> medicineNames =
        widget.orderMedicineList.map((e) => e.medicine.englishname).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Material(
                  child: Text(
                    "الادويه المضافه في الطلبيه",
                    style: AppStyles.styleBold20(context)
                        .copyWith(color: Colors.grey.shade900),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: CustomDropDownButton2(
                  items: medicineNames,
                  hint: "الادويه",
                  onChanged: (value) {
                    setState(() {
                      selectedIndex = medicineNames.indexOf(value!);
                    });
                  },
                  value: medicineNames.isNotEmpty
                      ? medicineNames[selectedIndex]
                      : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (widget.orderMedicineList.isNotEmpty)
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: CustomDetailsItemm(
                    note: 'الدواء',
                    data: widget
                        .orderMedicineList[selectedIndex].medicine.englishname,
                    icon: Icons.medication_outlined,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: CustomDetailsItemm(
                    note: 'الكميه',
                    data: widget.orderMedicineList[selectedIndex].amount
                        .toString(),
                    icon: Icons.medication_outlined,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: CustomDetailsItemm(
                    note: 'الشركه المصنعه',
                    data: widget.orderMedicineList[selectedIndex].expirydate,
                    icon: Icons.medication_outlined,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: CustomDetailsItemm(
                    note: 'السعر',
                    data: widget.orderMedicineList[selectedIndex].price
                        .toString(),
                    icon: Icons.medication_outlined,
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            )
        ],
      ),
    );
  }
}

class CustomDetailsItemm extends StatelessWidget {
  final String note;
  final String data;
  final IconData icon;

  const CustomDetailsItemm({
    required this.note,
    required this.data,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 24, color: Theme.of(context).iconTheme.color),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            '$note: $data',
            style: AppStyles.styleBold16(context),
          ),
        ),
      ],
    );
  }
}

class CustomDropDownButton2 extends StatelessWidget {
  const CustomDropDownButton2(
      {super.key,
      required this.items,
      this.onChanged,
      required this.hint,
      this.isExpanded = false,
      this.value,
      this.disabledHint});
  final List<String> items;
  final void Function(String?)? onChanged;
  final String hint;
  final bool isExpanded;
  final String? value;
  final Widget? disabledHint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: DropdownButton<String>(
        disabledHint: disabledHint,
        borderRadius: BorderRadius.circular(12),
        elevation: 1,
        menuMaxHeight: 400,
        value: value,
        underline: const SizedBox(),
        isExpanded: true, // Ensure the dropdown takes up available space
        hint: Text(
          hint,
          style: AppStyles.styleRegular14(context).copyWith(color: Colors.grey),
        ),
        items: MethodHelper.getDropDownItems(items),
        style: AppStyles.styleBold20(context).copyWith(color: Colors.blue),
        onChanged: onChanged,
      ),
    );
  }
}

class CustomMedicineViewForPres extends StatelessWidget {
  const CustomMedicineViewForPres(
      {super.key, required this.medicineModel, required this.amount});
  final MedicineModel medicineModel;
  final int amount;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('الدواء'),
            Text(medicineModel.englishname),
          ],
        ),
        Row(
          children: [
            const Text('الكميه'),
            Text(amount.toString()),
          ],
        ),
      ],
    );
  }
}
