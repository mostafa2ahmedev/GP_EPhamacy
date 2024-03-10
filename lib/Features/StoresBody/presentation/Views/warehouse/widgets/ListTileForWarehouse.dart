import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/Warehouse/WareHouseDataModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/WareHouse/cubit/warehouse_cubit.dart';

import 'package:gppharmacy/Utils/Methods_Helper.dart';

class ListTileForWarehouse extends StatelessWidget {
  const ListTileForWarehouse({
    super.key,
    required this.warehouseDataModel,
  });
  final WarehouseDataModel warehouseDataModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WarehouseCubit, WarehouseState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            MethodHelper.showDetailsItem(context,
                salesInventoryModelDetails:
                    warehouseDataModel.salesInventoryModelDetails);
          },
          child: ListTile(
            title:
                Text(warehouseDataModel.salesInventoryModelDetails.englishname),
            subtitle: Text(warehouseDataModel.salesInventoryModelDetails.barcode
                .toString()),
            trailing: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).drawerTheme.backgroundColor,
              ),
              child: Center(
                child: Text(
                  warehouseDataModel.amount.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
