import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/DetailsForSalesInventoryModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Medicine/Widgets/ListTileForMedicineList.dart';

class ListViewOfMedicineList extends StatelessWidget {
  const ListViewOfMedicineList({super.key, required this.medicineModel});
  final List<MedicineModel> medicineModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: medicineModel.length,
        itemBuilder: (context, index) {
          return ListTileForMedicineList(
            medicineModel: medicineModel[index],
          );
        },
      ),
    );
  }
}
