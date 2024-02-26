import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/AddAccount/Presentation/AddAccountView.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';

import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Custom_Drawer.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Home_App_Bar.dart';
import 'package:gppharmacy/Features/Statistics/presentation/StatisticsBody.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Stores_Body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scafoldKey = GlobalKey();

  List<Widget> bodyWidgets = [
    const StatisticsBody(),
    const StoresBody(),
    const StoresBody(),
    const AddAccountView(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerStates>(
      listener: (context, state) {
        if (state is DrawerSelectedIndexChanged) {
          scafoldKey.currentState!.closeDrawer();
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: scafoldKey,
          drawer: const CustomDrawer(),
          appBar: HomeAppBar(scafoldKey: scafoldKey),
          body:
              bodyWidgets[BlocProvider.of<DrawerCubit>(context).selectedIndex],
        );
      },
    );
  }
}
