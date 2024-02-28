import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/AddAccount/Presentation/AddAccountView.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';

import 'package:gppharmacy/Features/Statistics/presentation/widgets/Custom_Drop_Down_Button.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/generated/l10n.dart';

class DrawerListView extends StatefulWidget {
  const DrawerListView({super.key});

  @override
  State<DrawerListView> createState() => _DrawerListViewState();
}

class _DrawerListViewState extends State<DrawerListView> {
  static const List<List<String>> items = [
    [
      'حصر المبيعات',
      'الأدويه',
      'عهده المخزن',
      'الواردات',
      'حصر الكليات',
      'صرف الادويه',
    ],
    [
      'جميع المرضي',
      'اضافه مريض جديد',
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SliverList.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return CustomDrawerDropDownButton(
              outerIndex: index,
              hint: index == 0
                  ? S.of(context).HomeStores
                  : S.of(context).HomePatients,
              dropDownItems: items[index],
            );
          },
        );

        return SliverToBoxAdapter(
          child: Column(
            children: [
              CustomDrawerDropDownButton(
                outerIndex: 0,
                hint: S.of(context).HomeStores,
                dropDownItems: items[0],
              ),
              CustomDrawerDropDownButton(
                outerIndex: 1,
                hint: S.of(context).HomePatients,
                dropDownItems: items[1],
              ),
              GestureDetector(
                onTap: () {
                  MethodHelper.navigateTo(context, const AddAccountView());
                },
                child: const ListTile(
                  title: Text('اضافه حساب جديد'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
