import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCircleAdd extends StatelessWidget {
  const CustomCircleAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: const Icon(
        Icons.add,
        color: Colors.green,
      ),
    );
  }
}
