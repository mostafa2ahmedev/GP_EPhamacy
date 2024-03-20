import 'package:flutter/material.dart';

class CustomBorderForItems extends StatelessWidget {
  const CustomBorderForItems({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).drawerTheme.backgroundColor!,
        ),
      ),
      child: child,
    );
  }
}
