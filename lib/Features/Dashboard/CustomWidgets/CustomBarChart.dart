import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({super.key});

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  late TooltipBehavior _tooltip;
  late double minY;
  late double maxY;
  late double interval;

  @override
  void initState() {
    super.initState();
    _tooltip = TooltipBehavior(enable: true);

    // Calculate the minimum and maximum values from the chart data
    minY = chartData.map((data) => data.y).reduce((a, b) => a < b ? a : b);
    maxY = chartData.map((data) => data.y).reduce((a, b) => a > b ? a : b);

    // Adjust the minimum and maximum values
    minY = minY - (minY * 0.22); // 22% less than the smallest value
    maxY = maxY + (maxY * 0.06); // 6% more than the largest value

    // Calculate interval for 6 horizontal lines (5 intervals)
    interval = (maxY - minY) / 5;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.transparent,
          ),
          child: SfCartesianChart(
            borderWidth: 0,
            tooltipBehavior: _tooltip,
            primaryXAxis: CategoryAxis(
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
            primaryYAxis: NumericAxis(
              minimum: minY,
              maximum: maxY,
              interval: interval,
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
            series: <CartesianSeries<ChartData, String>>[
              ColumnSeries<ChartData, String>(
                dataSource: chartData,
                color: Colors.blue,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Half yearly sales analysis',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  final List<ChartData> chartData = [
    ChartData('Jan', 9000),
    ChartData('Feb', 13000),
    ChartData('Mar', 6800),
    ChartData('Apr', 4341),
    ChartData('May', 7913),
    ChartData('Jun', 2000),
  ];
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
