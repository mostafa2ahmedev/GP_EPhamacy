import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';
import 'package:gppharmacy/Features/HomeScreen/data/Drawer_Item_Model.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Drawer_Item.dart';
import 'package:gppharmacy/Utils/App_Images.dart';
import 'package:gppharmacy/generated/l10n.dart';

class DrawerListView extends StatefulWidget {
  const DrawerListView({super.key});

  @override
  State<DrawerListView> createState() => _DrawerListViewState();
}

class _DrawerListViewState extends State<DrawerListView> {
  @override
  Widget build(BuildContext context) {
    List<DrawerItemModel> items = [
      DrawerItemModel(
          image: Assets.imagesReportsSvgrepoCom,
          title: S.of(context).HomeDashboard),
      DrawerItemModel(
          image: Assets.imagesReportsSvgrepoCom,
          title: S.of(context).HomeStores),
      DrawerItemModel(
          image: Assets.imagesReportsSvgrepoCom,
          title: S.of(context).HomePatients),
      DrawerItemModel(image: Assets.imagesBell, title: S.of(context).AddAccount)
    ];
    return BlocConsumer<DrawerCubit, DrawerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SliverList.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (BlocProvider.of<DrawerCubit>(context).selectedIndex !=
                    index) {
                  BlocProvider.of<DrawerCubit>(context).selectedIndex = index;
                  BlocProvider.of<DrawerCubit>(context).changeIndex();
                }
              },
              child: DrawerItem(
                isSelected:
                    BlocProvider.of<DrawerCubit>(context).selectedIndex ==
                        index,
                item: items[index],
              ),
            );
          },
        );
      },
    );
  }
}
