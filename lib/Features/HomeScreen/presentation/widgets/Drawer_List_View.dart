import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';
import 'package:gppharmacy/Features/Statistics/presentation/widgets/Custom_Drop_Down_Button.dart';
import 'package:gppharmacy/generated/l10n.dart';

class DrawerListView extends StatefulWidget {
  const DrawerListView({super.key});

  @override
  State<DrawerListView> createState() => _DrawerListViewState();
}

class _DrawerListViewState extends State<DrawerListView> {
  @override
  Widget build(BuildContext context) {
    List<List<String>> getNames(context) {
      var s = S.of(context);
      return [
        [
          s.HsrElmbe3at,
          s.Medicines,
          s.H3ohdeElm5zn,
          s.Imports,
          s.HsrElkolyat,
          s.SrfEladwya
        ],
        [
          s.AllPatient,
          s.AddNewPatient,
        ],
      ];
    }

    return BlocConsumer<DrawerCubit, DrawerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SliverList.builder(
          itemCount: getNames(context).length,
          itemBuilder: (context, index) {
            return CustomDrawerDropDownButton(
              outerIndex: index,
              hint: index == 0
                  ? BlocProvider.of<DrawerCubit>(context).hint1!
                  : BlocProvider.of<DrawerCubit>(context).hint2!,
              dropDownItems: getNames(context)[index],
            );
          },
        );
      },
    );
  }
}
