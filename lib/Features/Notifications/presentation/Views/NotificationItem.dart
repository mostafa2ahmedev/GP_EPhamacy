import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Features/Notifications/data/NotificationModel.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Widgets/CustomBorderForItems.dart';

class ListTileNotificaiton extends StatelessWidget {
  const ListTileNotificaiton({super.key, required this.notificationModel});
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return CustomBorderForItems(
      child: ListTile(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            notificationModel.message,
            style: AppStyles.styleBold20(context),
          ),
        ),
        trailing: Text(
          'يرجي اعاده طلب كميه جديده',
          style:
              AppStyles.styleRegular16(context).copyWith(color: Colors.black87),
        ),
        leading: const Icon(Icons.notification_add),
      ),
    );
  }
}

class ListTileNotificaitonLoading extends StatelessWidget {
  const ListTileNotificaitonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBorderForItems(
        child: ListTile(
      title: Container(
        height: 10, // Set a minimum height
        width: 20, // Placeholder text
        color: Colors.amber,
      ),
      trailing: Container(
        height: 10, // Set a minimum height
        width: 20, // Placeholder text
        color: Colors.amber,
      ),
      leading: Container(
        height: 10, // Set a minimum height
        width: 20, // Placeholder text
        color: Colors.amber,
      ),
    ));
  }
}
