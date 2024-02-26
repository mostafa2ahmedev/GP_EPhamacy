import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Features/Statistics/presentation/widgets/PieChart_With_Drop_Down_Button.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/generated/l10n.dart';

class StatisticsMobileBody extends StatelessWidget {
  const StatisticsMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).HomeDashboard,
              style: AppSytles.styleSemiBold24(context)
                  .copyWith(color: ColorManeger.primaryColor),
            ),
            const SizedBox(
              height: 30,
            ),
            const PieChartWithDropDown()
          ],
        ),
      ),
    );
  }
}
