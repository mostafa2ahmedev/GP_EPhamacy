import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/Order_Model.dart';

class ListTileForOrders extends StatelessWidget {
  final OrderModel orderModel;
  const ListTileForOrders({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: ListTile(
        title: Text(orderModel.supplier.name),
        subtitle: Text(orderModel.dateofsupply),
        trailing: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).drawerTheme.backgroundColor,
          ),
          child: Center(
            child: Text(
              '${orderModel.orderMedicines.length}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
