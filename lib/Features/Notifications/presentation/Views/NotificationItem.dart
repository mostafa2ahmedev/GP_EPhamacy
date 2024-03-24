import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Notifications/data/NotificationModel.dart';
import 'package:gppharmacy/Utils/Widgets/CustomBorderForItems.dart';

class ListTileNotificaiton extends StatelessWidget {
  const ListTileNotificaiton({super.key, required this.notificationModel});
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return CustomBorderForItems(
      child: ListTile(
        title: Text(notificationModel.message),
        trailing: const Text('يرجي اعاده طلب كميه جديده'),
        leading: const Icon(Icons.notification_add),
      ),
    );
  }
}
