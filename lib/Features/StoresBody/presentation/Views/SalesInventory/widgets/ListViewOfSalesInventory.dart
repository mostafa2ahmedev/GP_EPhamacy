import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/ExecuseView/data/cubit/execuse_colleges_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/Sales%20inventoryModel.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryCubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/ListTileForSalesInventory.dart';

class ListViewForExecuseColleges extends StatelessWidget {
  const ListViewForExecuseColleges({super.key});

  @override
  Widget build(BuildContext context) {
    var execuseColleges = BlocProvider.of<ExecuseCollegesCubit>(context);
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 12,
          );
        },
        itemCount: execuseColleges.searchedColleges.length,
        itemBuilder: (context, index) {
          return ListTileForExecuse(
            usageColleges: execuseColleges.searchedColleges[index],
          );
        },
      ),
    );
  }
}

class ListViewOfSalesInventory extends StatelessWidget {
  const ListViewOfSalesInventory({super.key});

  @override
  Widget build(BuildContext context) {
    var salesCubit = BlocProvider.of<SalesInventoryCubit>(context);
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 12,
          );
        },
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
