import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Mobile_Body.dart';
import 'package:gppharmacy/Utils/AdaptiveLayout.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AdaptiveLayout(
        mobileDashboard: (context) => const AuthMobileBody(),
        tabletDashboard: (context) => const SizedBox(),
        desktopDashboard: (context) => const SizedBox(),
      ),
    );
    
  }
}
