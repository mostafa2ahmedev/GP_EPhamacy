import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryCubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryStates.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/ListTileForSalesInventory.dart';

class ListViewOfSalesInventory extends StatelessWidget {
  const ListViewOfSalesInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesInventoryCubit, SalesInventoryStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var storeCubit = BlocProvider.of<SalesInventoryCubit>(context);

        return Expanded(
          child: ListView.builder(
            itemCount: storeCubit.salesInventoryList.length,
            itemBuilder: (context, index) {
              return ListTileForSalesInventory(
                salesInventoryModel: storeCubit.salesInventoryList[index],
              );
            },
          ),
        );
      },
    );
  }
}
