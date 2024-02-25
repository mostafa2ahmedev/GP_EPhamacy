import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/App_Images.dart';

import 'package:gppharmacy/Utils/Color_Maneger.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 10,
            color: ColorManeger.primaryColor,
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
