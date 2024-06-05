import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';

import '../../../../data/Orders/OrderMedicine_Model.dart';

class CustomMedicineView extends StatelessWidget {
  const CustomMedicineView({super.key, required this.orderMedicinesModel});
  final OrderMedicinesModel orderMedicinesModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('الدواء'),
            Text(orderMedicinesModel.medicine.englishname),
          ],
        ),
        Row(
          children: [
            const Text('الكميه'),
            Text(orderMedicinesModel.price.toString()),
          ],
        ),
        Row(
          children: [
            const Text('الصلاحيه'),
            Text(orderMedicinesModel.expirydate),
          ],
        ),
        Row(
          children: [
            const Text('المصنع'),
            Text(orderMedicinesModel.medicine.manufacturer ?? ""),
          ],
        ),
        Row(
          children: [
            const Text('السعر'),
            Text(orderMedicinesModel.price.toString()),
          ],
        ),
      ],
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
