import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/Sales%20inventoryModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryCubit.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/Utils/Widgets/CustomBorderForItems.dart';

class ListTileForSalesInventory extends StatelessWidget {
  const ListTileForSalesInventory({
    super.key,
    required this.salesInventoryModel,
  });
  final SalesInventoryModel salesInventoryModel;

  @override
  Widget build(BuildContext context) {
    var salesCubit = BlocProvider.of<SalesInventoryCubit>(context);
    return GestureDetector(
      onTap: () async {
        await salesCubit.getSalesInventoryItemDetails(
          barcode: salesInventoryModel.barcode.toString(),
        );
        MethodHelper.showDetailsItem(
          context,
          medicineModel: salesCubit.salesInventoryModelDetails!,
        );
      },
      child: CustomBorderForItems(
        child: ListTile(
          title: Text(
            salesInventoryModel.name,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleSemiBold20(context).copyWith(
              color: Theme.of(context).drawerTheme.backgroundColor!,
            ),
          ),
          subtitle: Text(
            salesInventoryModel.barcode.toString(),
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
                salesInventoryModel.amount.toString(),
                style: AppStyles.styleMeduim16(context),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
