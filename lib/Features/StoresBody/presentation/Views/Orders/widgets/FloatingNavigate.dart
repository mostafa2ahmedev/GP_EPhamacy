import 'package:flutter/material.dart';

class FloatingNavigate extends StatelessWidget {
  const FloatingNavigate({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      onPressed: ontap,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
