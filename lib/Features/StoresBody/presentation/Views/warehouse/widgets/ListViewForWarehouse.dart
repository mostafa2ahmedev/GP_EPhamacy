import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/Warehouse/WareHouseDataModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/warehouse/widgets/ListTileForWarehouse.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoMatchingData.dart';

class ListViewOfWareHouse extends StatelessWidget {
  const ListViewOfWareHouse({super.key, required this.searchedList});
  final List<WarehouseDataModel> searchedList;
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
                return ListTileForWarehouse(
                    warehouseDataModel: searchedList[index]);
              },
            ),
          )
        : const CustomNoMatchingData();
  }
}
