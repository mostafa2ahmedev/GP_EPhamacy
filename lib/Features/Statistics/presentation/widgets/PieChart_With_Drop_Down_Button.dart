import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Statistics/presentation/widgets/Custom_Drop_Down_Button.dart';
import 'package:gppharmacy/Features/Statistics/presentation/widgets/Pie_Chart_With_Details.dart';

class PieChartWithDropDown extends StatelessWidget {
  const PieChartWithDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDropDownButton(),
          SizedBox(
            height: 12,
          ),
          PieChartWithDetails(),
        ],
      ),
    );
  }
}
