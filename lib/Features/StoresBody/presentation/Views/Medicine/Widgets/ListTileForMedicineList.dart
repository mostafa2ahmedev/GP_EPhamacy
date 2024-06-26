import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/Utils/Widgets/CustomBorderForItems.dart';

class ListTileForMedicineList extends StatelessWidget {
  const ListTileForMedicineList({
    super.key,
    required this.medicineModel,
  });
  final MedicineModel medicineModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MethodHelper.showDetailsItem(context, medicineModel: medicineModel);
      },
      child: CustomBorderForItems(
        child: ListTile(
          title: Text(
            medicineModel.englishname,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            medicineModel.barcode.toString(),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: GestureDetector(
            onTap: () {
              // MethodHelper.EditDetialsItem(
              //   context,
              //   medicineModel: medicineModel,
              // );
            },
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
