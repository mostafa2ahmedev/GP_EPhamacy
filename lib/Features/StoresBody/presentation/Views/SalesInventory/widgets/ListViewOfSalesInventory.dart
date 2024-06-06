import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/ExecuseView/data/ExecuseModel.dart';
import 'package:gppharmacy/Features/ExecuseView/data/cubit/execuse_colleges_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/Sales%20inventoryModel.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryCubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/ListTileForSalesInventory.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoDataContainer.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoMatchingData.dart';

class ListViewForExecuseColleges extends StatelessWidget {
  const ListViewForExecuseColleges({super.key, required this.usageCollege});
  final List<UsageColleges> usageCollege;
  @override
  Widget build(BuildContext context) {
    return usageCollege.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemCount: usageCollege.length,
              itemBuilder: (context, index) {
                return ListTileForExecuse(
                  listUsage: usageCollege,
                  usageColleges: usageCollege[index],
                );
              },
            ),
          )
        : CustomNoMatchingData();
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
