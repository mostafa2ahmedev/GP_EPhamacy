import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Medicine/Widgets/ListTileForMedicineList.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoMatchingData.dart';

class ListViewOfMedicineList extends StatelessWidget {
  const ListViewOfMedicineList({
    super.key,
    required this.searchedList,
  });
  final List<MedicineModel> searchedList;

  @override
  Widget build(BuildContext context) {
    return searchedList.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemCount: searchedList.length,
              itemBuilder: (context, index) {
                return ListTileForMedicineList(
                  medicineModel: searchedList[index],
                );
              },
            ),
          )
        : const CustomNoMatchingData();
  }
}
