import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Background.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Drawer_List_View.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Lower_Part_Of_Drawer.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';

import 'package:gppharmacy/Utils/Color_Maneger.dart';

import 'package:gppharmacy/generated/l10n.dart';

class CustomMobileDrawer extends StatelessWidget {
  const CustomMobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<DrawerCubit>(context);
        return Container(
          color: Theme.of(context).drawerTheme.backgroundColor,
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                    child: Padding(
                  padding: EdgeInsets.only(right: 60, left: 60, top: 60),
                  child: AuthBackground(
                    backColor: Colors.white,
                    borderColor: ColorManeger.lightPrimaryColor,
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
                      style: AppStyles.styleMeduim20(context)
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
                const LowerPartOfDrawer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
