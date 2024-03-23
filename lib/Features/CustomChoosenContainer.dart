import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';

class CustomChoosenContainer extends StatelessWidget {
  const CustomChoosenContainer({
    super.key,
    required this.text,
    required this.ontap,
  });
  final String text;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              color: Theme.of(context).drawerTheme.backgroundColor,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              text,
              style: AppStyles.styleSemiBold20(context),
            ),
          ),
        ),
      ),
    );
  }
}
