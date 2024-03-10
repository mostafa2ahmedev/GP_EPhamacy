import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/Warehouse/WareHouseDataModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/warehouse/widgets/ListTileForWarehouse.dart';

class ListViewOfWareHouse extends StatelessWidget {
  const ListViewOfWareHouse({super.key, required this.searchedList});
  final List<WarehouseDataModel> searchedList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchedList.length,
        itemBuilder: (context, index) {
          return ListTileForWarehouse(warehouseDataModel: searchedList[index]);
        },
      ),
    );
  }
}
