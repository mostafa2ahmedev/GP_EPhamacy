import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/HomeScreen/data/Container_Item_Model.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';

class ContainerItem extends StatelessWidget {
  const ContainerItem(
      {super.key, required this.containerItemModel, required this.isSelected});
  final ContainerItemModel containerItemModel;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: isSelected
              ? ColorManeger.primaryColor
              : const Color(0xff9dadbc).withOpacity(0.6)),
      child: Center(
          child: Text(
        containerItemModel.text,
        style: AppSytles.styleSemiBold24(context).copyWith(color: Colors.white),
      )),
    );
  }
}
