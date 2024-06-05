import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/Order_Model.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Orders/widgets/ListTileForOrders.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoMatchingData.dart';

class ListViewOfOrders extends StatelessWidget {
  final List<OrderModel> orders;
  const ListViewOfOrders({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return orders.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return ListTileForOrders(
                  orderModel: orders[index],
                );
              },
            ),
          )
        : const CustomNoMatchingData();
  }
}
