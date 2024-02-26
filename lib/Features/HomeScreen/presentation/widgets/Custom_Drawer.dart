import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Background.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';
import 'package:gppharmacy/Features/HomeScreen/data/Drawer_Item_Model.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Drawer_List_View.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/App_Images.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/generated/l10n.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          color: ColorManeger.primaryColor,
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: AuthBackground(
                    backColor: Colors.white,
                    borderColor: ColorManeger.primaryColor,
                  ),
                )),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.of(context).SidalyaEltlba,
                      style: AppSytles.styleMeduim20(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                const DrawerListView(),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.sunny,
                          color: Colors.white,
                        ),
                        title: Text(
                          S.of(context).Mode,
                          style: AppSytles.styleMeduim16(context),
                        ),
                        trailing: Switch(
                          value: BlocProvider.of<DrawerCubit>(context)
                              .selectedMode,
                          onChanged: (value) {
                            BlocProvider.of<DrawerCubit>(context).changeMode();
                          },
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 12,
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          Assets.imagesBell,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                        ),
                        title: Text(
                          S.of(context).Resgistarion,
                          style: AppSytles.styleRegular16(context),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
