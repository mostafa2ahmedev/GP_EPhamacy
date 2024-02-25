import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout(
      {super.key,
      required this.mobileDashboard,
      required this.tabletDashboard,
      required this.desktopDashboard});
  final WidgetBuilder mobileDashboard, tabletDashboard, desktopDashboard;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileDashboard(context);
        } else if (constraints.maxWidth < 900) {
          return tabletDashboard(context);
        } else {
          return desktopDashboard(context);
        }
      },
    );
  }
}
