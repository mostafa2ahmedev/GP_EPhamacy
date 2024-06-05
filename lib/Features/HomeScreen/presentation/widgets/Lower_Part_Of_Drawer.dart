import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/AddAccount/Presentation/Views/AddAccountView.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit.dart';
import 'package:gppharmacy/Features/Auth/Presentation/Auth_View.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/SwitchTile.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2.5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: InkWell(
                      onTap: () {
                        MethodHelper.navigateTo(
                            context, const AddAccountView());
                      },
                      child: const Text(
                        "اضافه حساب جديد",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
                      SwitchWithListTile(
                        value: cubit.selectedMode,
                        onChanged: (value) {
                          cubit.changeMode();
                        },
                        text: S.of(context).Mode,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SwitchWithListTile(
                        value: cubit.selectedLang,
                        onChanged: (value) {
                          cubit.changeLang();
                        },
                        text: S.of(context).Language,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: TextButton.icon(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {
                              BlocProvider.of<AuthCubit>(context).signOut();
                              MethodHelper.navigateToWithRep(
                                  context, const AuthView());
                            },
                            icon: const Icon(
                              Icons.logout,
                              color: ColorManeger.darkPrimaryColor,
                            ),
                            label: Text(
                              S.of(context).LogOut,
                              style: AppStyles.styleMeduim16(context).copyWith(
                                  color: ColorManeger.darkPrimaryColor),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        );
      },
    );
  }
}
