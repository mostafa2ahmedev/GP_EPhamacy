import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartesianChart extends StatefulWidget {
  const CartesianChart({Key? key}) : super(key: key);

  @override
  State<CartesianChart> createState() => _CartesianChartState();
}

class _CartesianChartState extends State<CartesianChart> {
  List<_SalesData> data = [
    _SalesData('Jan', 110),
    _SalesData('Feb', 28),
    _SalesData('Mar', 65),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
    _SalesData('jun', 80)
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate minimum and maximum values for the y-axis
    double minY = data.map((e) => e.sales).reduce((a, b) => a < b ? a : b) * 0.85;
    double maxY = data.map((e) => e.sales).reduce((a, b) => a > b ? a : b) * 1.1;

    return Column(
      children: [ 
        SfCartesianChart(
          primaryXAxis: const CategoryAxis(
            labelStyle: TextStyle(color: Colors.white),
          ),
          primaryYAxis: NumericAxis(
            labelStyle: const TextStyle(color: Colors.white),
            minimum: minY,
            maximum: maxY,
            interval: (maxY - minY) / 5, // Adjust interval to get 6 lines including the start and end lines
          ),
          tooltipBehavior: TooltipBehavior(
            enable: true,
            textStyle: const TextStyle(color: Colors.white), // Customize tooltip text color
          ),
          series: <CartesianSeries<dynamic, dynamic>>[
            LineSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              name: 'Sales',
              // Enable data label
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                // Change label text color to white
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const Text(
          "Half yearly prescriptions analysis",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
