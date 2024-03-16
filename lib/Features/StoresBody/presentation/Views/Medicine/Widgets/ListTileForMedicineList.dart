import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/DetailsForSalesInventoryModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';

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
      child: ListTile(
        title: Text(medicineModel.englishname),
        subtitle: Text(
          medicineModel.barcode.toString(),
        ),
        trailing: GestureDetector(
          onTap: () {
            // MethodHelper.EditDetialsItem(
            //   context,
            //   medicineModel: medicineModel,
            // );
          },
          child: const Icon(
            Icons.edit,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
