import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/Warehouse/WareHouseDataModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/WareHouse/cubit/warehouse_cubit.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/Utils/Widgets/CustomBorderForItems.dart';

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
            MethodHelper.showDetailsItem(
              context,
              medicineModel: warehouseDataModel.salesInventoryModelDetails,
            );
          },
          child: CustomBorderForItems(
            child: ListTile(
              title: Text(
                warehouseDataModel.salesInventoryModelDetails.englishname,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).drawerTheme.backgroundColor,
                ),
              ),
              subtitle: Text(
                warehouseDataModel.salesInventoryModelDetails.barcode
                    .toString(),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
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
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
