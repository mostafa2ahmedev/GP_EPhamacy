import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/App_Images.dart';

class CustomNoDataContainer extends StatelessWidget {
  const CustomNoDataContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.05,
        ),
        AspectRatio(
          aspectRatio: 2 / 1.5,
          child: Image.asset(
            Assets.imagesSearch,
          ),
        ),
        Text(
          'اوووبس! لا يوجد اي معلومات',
          style: AppStyles.styleBold28(context).copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
