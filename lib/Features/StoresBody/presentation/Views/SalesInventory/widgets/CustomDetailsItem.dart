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
          color: Theme.of(context).drawerTheme.backgroundColor!,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$note: ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey.shade900),
                ),
                TextSpan(
                  text: data,
                  style: AppStyles.styleMeduim20(context).copyWith(
                    color: Theme.of(context).drawerTheme.backgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      leading: Icon(icon),
    );
  }
}

class CustomRowItem extends StatelessWidget {
  const CustomRowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [],
    );
  }
}
