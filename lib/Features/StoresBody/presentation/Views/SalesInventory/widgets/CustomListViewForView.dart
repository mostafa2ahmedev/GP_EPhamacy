import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryCubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/ListViewForView.dart';

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
              return ListTileForView(
                salesInventoryModel: storeCubit.salesInventoryList[index],
              );
            },
          ),
        );
      },
    );
  }
}
