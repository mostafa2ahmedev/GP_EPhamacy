import 'package:flutter/material.dart';

import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Custom_Drawer.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Home_App_Bar.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Home_Mobile_View.dart';
import 'package:gppharmacy/Utils/AdaptiveLayout.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scafoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      drawer: const CustomDrawer(),
      appBar: HomeAppBar(scafoldKey: scafoldKey),
      body: AdaptiveLayout(
        mobileDashboard: (context) => const HomeMobileView(),
        tabletDashboard: (context) => const SizedBox(),
        desktopDashboard: (context) => const SizedBox(),
      ),
    );
  }
}
