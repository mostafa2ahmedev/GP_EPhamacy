import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Dashboard/data/statistics_model/statistics_model.dart';
import 'package:gppharmacy/Features/Dashboard/manager/Cubit/dashboard_cubit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartesianChart extends StatefulWidget {
  const CartesianChart({super.key, required this.statisticsModel});
  final StatisticsModel statisticsModel;
  @override
  State<CartesianChart> createState() => _CartesianChartState();
}

class _CartesianChartState extends State<CartesianChart> {
  late List<double?> sales;
  late List<_SalesData> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    sales = widget.statisticsModel.sales!.map((e) => e.price).toList();
    data = [
      _SalesData('Jan', sales[0] ?? 0),
      _SalesData('Feb', sales[1] ?? 0),
      _SalesData('Mar', sales[2] ?? 0),
      _SalesData('Apr', sales[3] ?? 0),
      _SalesData('May', sales[4] ?? 0),
      _SalesData('Jun', sales[5] ?? 0),
      _SalesData('Jul', sales[6] ?? 0),
      _SalesData('Aug', sales[7] ?? 0),
      _SalesData('Sep', sales[8] ?? 0),
      _SalesData('Oct', sales[9] ?? 0),
      _SalesData('Nov', sales[10] ?? 0),
      _SalesData('Dec', sales[11] ?? 0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Calculate minimum and maximum values for the y-axis
    double minY =
        data.map((e) => e.sales).reduce((a, b) => a < b ? a : b) * 0.85;
    double maxY =
        data.map((e) => e.sales).reduce((a, b) => a > b ? a : b) * 1.1;

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
            interval: (maxY - minY) /
                5, // Adjust interval to get 6 lines including the start and end lines
          ),
          tooltipBehavior: TooltipBehavior(
            enable: true,
            textStyle: const TextStyle(
                color: Colors.white), // Customize tooltip text color
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
          "yearly Sales analysis",
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
