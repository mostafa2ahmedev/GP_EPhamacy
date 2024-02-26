import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomPieChart extends StatefulWidget {
  const CustomPieChart({
    super.key,
  });

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  int activeIndex = -1;
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          enabled: true,
          touchCallback: (p0, response) {
            activeIndex = response?.touchedSection?.touchedSectionIndex ?? -1;
            setState(() {});
          },
        ),
        sectionsSpace: 4,
        sections: List.generate(
          3,
          (index) => PieChartSectionData(
            radius: activeIndex == 0 ? 60 : 50,
            showTitle: false,
            value: 200,
            color: const Color(
              0xff208bc7,
            ),
          ),
        ),
      ),
    );
  }
}
