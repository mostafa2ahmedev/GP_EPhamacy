import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/widgets/Stores_Mobile_Body.dart';
import 'package:gppharmacy/Utils/AdaptiveLayout.dart';

class StoresBody extends StatelessWidget {
  const StoresBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileDashboard: (context) => const StoresMobileBody(),
      tabletDashboard: (context) => const SizedBox(),
      desktopDashboard: (context) => const SizedBox(),
    );
  }
}
