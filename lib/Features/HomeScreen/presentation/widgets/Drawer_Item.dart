import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gppharmacy/Features/HomeScreen/data/Drawer_Item_Model.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.item, required this.isSelected});
  final DrawerItemModel item;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        color: isSelected ? const Color.fromARGB(255, 69, 101, 139) : null,
        child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 6),
            leading: SvgPicture.asset(
              item.image,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            title: Text(item.title,
                style: isSelected
                    ? AppStyles.styleBold16(context)
                    : AppStyles.styleRegular16(context)),
            trailing: isSelected
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    width: 4,
                    color: ColorManeger.lightPrimaryColor,
                  )
                : null),
      ),
    );
  }
}
