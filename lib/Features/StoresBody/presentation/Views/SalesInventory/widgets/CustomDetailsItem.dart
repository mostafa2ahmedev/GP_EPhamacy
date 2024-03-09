import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';

class CustomDetailsItem extends StatelessWidget {
  const CustomDetailsItem({
    super.key,
    required this.note,
    required this.data,
    required this.icon,
  });
  final String note;
  final String data;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).cardColor,
          ),
          borderRadius: BorderRadius.circular(12)),
      title: Row(
        children: [
          Text('$note: '),
          Text(
            data,
            style: AppStyles.styleMeduim20(context)
                .copyWith(color: Theme.of(context).drawerTheme.backgroundColor),
          )
        ],
      ),
      leading: Icon(icon),
    );
  }
}
