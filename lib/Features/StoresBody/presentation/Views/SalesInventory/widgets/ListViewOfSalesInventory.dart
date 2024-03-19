import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryCubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/ListTileForSalesInventory.dart';

class ListViewOfSalesInventory extends StatelessWidget {
  const ListViewOfSalesInventory({super.key});

  @override
  Widget build(BuildContext context) {
    var salesCubit = BlocProvider.of<SalesInventoryCubit>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: salesCubit.salesInventoryList.length,
        itemBuilder: (context, index) {
          return ListTileForSalesInventory(
            salesInventoryModel: salesCubit.salesInventoryList[index],
          );
        },
      ),
    );
  }
}
