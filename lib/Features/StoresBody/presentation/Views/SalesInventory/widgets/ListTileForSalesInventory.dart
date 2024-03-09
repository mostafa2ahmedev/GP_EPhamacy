import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/Sales%20inventoryModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryCubit.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';

class ListTileForSalesInventory extends StatelessWidget {
  const ListTileForSalesInventory({
    super.key,
    required this.salesInventoryModel,
  });
  final SalesInventoryModel salesInventoryModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesInventoryCubit, SalesInventoryStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var storeCubit = BlocProvider.of<SalesInventoryCubit>(context);
        var authCubit = BlocProvider.of<AuthCubit>(context);

        if (state is getDetailsSalesInventoryLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return GestureDetector(
          onTap: () async {
            await storeCubit.getSalesInventoryItemDetails(
              barcode: salesInventoryModel.barcode.toString(),
              token: authCubit.user!.token,
            );
            MethodHelper.showDetailsItem(context,
                salesInventoryModelDetails:
                    storeCubit.salesInventoryModelDetails!);
          },
          child: ListTile(
            title: Text(salesInventoryModel.name),
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
        );
      },
    );
  }
}
