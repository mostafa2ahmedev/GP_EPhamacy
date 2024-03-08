import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/Sales%20inventory.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/cubit/stores_cubit_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/widgets/ListViewForView.dart';

class ListViewOfSalesInventory extends StatelessWidget {
  const ListViewOfSalesInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoresCubit, StoresCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = BlocProvider.of<StoresCubit>(context);
        return ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: ListTileForView(
                salesInventoryModel: SalesInventoryModel(
                  name: 'ABILIFY',
                  barcode: '6222014003547',
                  amount: '2',
                ),
              ),
            );
          },
        );
      },
    );
  }
}
