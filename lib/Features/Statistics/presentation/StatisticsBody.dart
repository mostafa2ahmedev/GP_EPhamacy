import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Statistics/presentation/widgets/StatisticsMobileView.dart';
import 'package:gppharmacy/Utils/AdaptiveLayout.dart';

class StatisticsBody extends StatelessWidget {
  const StatisticsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileDashboard: (context) => const StatisticsMobileBody(),
      tabletDashboard: (context) => const SizedBox(),
      desktopDashboard: (context) => const SizedBox(),
    );
  }
}
