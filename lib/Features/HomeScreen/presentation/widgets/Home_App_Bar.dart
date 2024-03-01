import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gppharmacy/Utils/App_Images.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.scafoldKey,
  });

  final GlobalKey<ScaffoldState> scafoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        SvgPicture.asset(Assets.imagesBell,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
        const SizedBox(
          width: 12,
        ),
      ],
      backgroundColor: AppBarTheme.of(context).backgroundColor,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: InkWell(
          onTap: () {
            scafoldKey.currentState!.openDrawer();
          },
          child: SvgPicture.asset(
            Assets.imagesMenuBurger,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
