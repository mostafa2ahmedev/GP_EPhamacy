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
        child: AspectRatio(
          aspectRatio: 13 / 5,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).drawerTheme.backgroundColor,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                text,
                style: AppStyles.styleBold28(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
