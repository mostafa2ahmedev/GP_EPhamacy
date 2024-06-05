import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Home_Mobile_View.dart';
import 'package:gppharmacy/Utils/AdaptiveLayout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
        mobileDashboard: (context) => const MobileHomeView(),
        tabletDashboard: (context) => const SizedBox(),
        desktopDashboard: (context) => const SizedBox());
  }
}
