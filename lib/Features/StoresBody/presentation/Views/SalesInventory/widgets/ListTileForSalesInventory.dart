import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/ExecuseView/data/ExecuseModel.dart';
import 'package:gppharmacy/Features/ExecuseView/data/cubit/execuse_colleges_cubit.dart';
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
        MethodHelper.showDetailsItem(context,
            medicineModel: salesCubit.salesInventoryModelDetails!);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).drawerTheme.backgroundColor!,
          ),
        ),
        child: ListTile(
          title: Text(salesInventoryModel.name),
          titleTextStyle: AppStyles.styleSemiBold20(context)
              .copyWith(color: Theme.of(context).drawerTheme.backgroundColor!),
          subtitle: Text(salesInventoryModel.barcode.toString()),
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
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListTileForExecuse extends StatelessWidget {
  const ListTileForExecuse({
    super.key,
    required this.usageColleges,
    required this.listUsage,
  });
  final UsageColleges usageColleges;
  final List<UsageColleges> listUsage;

  @override
  Widget build(BuildContext context) {
    var execuseCubit = BlocProvider.of<ExecuseCollegesCubit>(context);
    return GestureDetector(
      onTap: () async {
        MethodHelper.showDetailsPermession(context,
            usageCollege: usageColleges, usageList: listUsage);
      },
      child: CustomBorderForItems(
        child: ListTile(
          title: Text(
            usageColleges.collegeName ?? "",
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleSemiBold20(context).copyWith(
              color: Theme.of(context).drawerTheme.backgroundColor!,
            ),
          ),
          subtitle: Text(
            usageColleges.date.toString(),
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
                usageColleges.id.toString(),
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
