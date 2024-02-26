import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/App_Images.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.borderColor, this.backColor});
  final Color borderColor;
  final Color? backColor;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
        decoration: BoxDecoration(
          color: backColor,
          shape: BoxShape.circle,
          border: Border.all(
            width: backColor == null ? 10 : 0,
            color: borderColor,
          ),
        ),
        child: const Image(
          image: AssetImage(
            Assets.imagesBenhaLogo,
          ),
        ),
      ),
    );
  }
}
