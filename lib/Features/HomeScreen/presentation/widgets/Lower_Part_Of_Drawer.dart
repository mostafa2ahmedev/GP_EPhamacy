import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/App_Images.dart';
import 'package:gppharmacy/Utils/Shared_Prefrences.dart';
import 'package:gppharmacy/generated/l10n.dart';

class LowerPartOfDrawer extends StatelessWidget {
  const LowerPartOfDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<DrawerCubit>(context);
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Expanded(
                child: SizedBox(
                  height: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.sunny,
                          color: Colors.white,
                        ),
                        title: Text(
                          S.of(context).Mode,
                          style: AppStyles.styleMeduim16(context),
                        ),
                        trailing: Switch(
                          activeColor: Theme.of(context).cardColor,
                          value: BlocProvider.of<DrawerCubit>(context)
                                  .selectedMode ??
                              false,
                          onChanged: (value) {
                            BlocProvider.of<DrawerCubit>(context).changeMode();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        subtitle: Text(
                          'E / A',
                          style: AppStyles.styleMeduim16(context),
                        ),
                        leading: const Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        title: Text(
                          S.of(context).Language,
                          style: AppStyles.styleMeduim16(context),
                        ),
                        trailing: Switch(
                          activeColor: Theme.of(context).cardColor,
                          value: BlocProvider.of<DrawerCubit>(context)
                                  .selectedLang ??
                              false,
                          onChanged: (value) {
                            BlocProvider.of<DrawerCubit>(context).changeLang();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          Assets.imagesUser,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                        ),
                        title: Text(
                          S.of(context).LogOut,
                          style: AppStyles.styleRegular16(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        );
      },
    );
  }
}
