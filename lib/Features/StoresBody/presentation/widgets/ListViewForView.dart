import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/Sales%20inventory.dart';

class ListTileForView extends StatelessWidget {
  const ListTileForView({
    super.key,
    required this.salesInventoryModel,
  });
  final SalesInventoryModel salesInventoryModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(salesInventoryModel.name),
      subtitle: Text(salesInventoryModel.barcode),
      trailing: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).drawerTheme.backgroundColor,
          ),
          child: Center(
            child: Text(
              salesInventoryModel.amount,
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
