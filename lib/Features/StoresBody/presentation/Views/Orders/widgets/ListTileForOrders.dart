import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/Order_Model.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/Utils/Widgets/CustomBorderForItems.dart';

class ListTileForOrders extends StatelessWidget {
  final OrderModel orderModel;

  const ListTileForOrders({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MethodHelper.ShowOrderDetails(context, ordermodel: orderModel);
      },
      child: CustomBorderForItems(
        child: ListTile(
          title: Text(
            orderModel.supplier.name,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).drawerTheme.backgroundColor,
            ),
          ),
          subtitle: Text(orderModel.dateofsupply,
              style: AppStyles.styleRegular16(context)
                  .copyWith(color: Colors.grey.shade900)),
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
      ),
    );
  }
}
