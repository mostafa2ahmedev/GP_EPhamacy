import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/AddAccount/Presentation/widgets/Mobie_Add_Account_View.dart';

import 'package:gppharmacy/Utils/AdaptiveLayout.dart';

class AddAccountView extends StatelessWidget {
  const AddAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileDashboard: (context) => const MobileAddAccountView(),
        tabletDashboard: (context) => const SizedBox(),
        desktopDashboard: (context) => const SizedBox(),
      ),
    );
  }
}
