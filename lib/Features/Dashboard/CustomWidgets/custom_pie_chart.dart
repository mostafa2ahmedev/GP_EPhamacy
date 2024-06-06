import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(
        text: 'Sales by sales person',
        textStyle: TextStyle(color: Colors.white),
      ),
      legend: Legend(
        isVisible: true,
        toggleSeriesVisibility: false,
        orientation: LegendItemOrientation.vertical,
        position: LegendPosition.right,
        textStyle: TextStyle(color: Colors.white , fontSize: 14 , fontWeight: FontWeight.bold),
      ),
      series: <PieSeries<_PieData, String>>[
        PieSeries<_PieData, String>(
          explode: true,
          explodeIndex: 0,
          dataSource: pieData,
          xValueMapper: (_PieData data, _) => data.xData,
          yValueMapper: (_PieData data, _) => data.yData,
          dataLabelMapper: (_PieData data, _) => data.text,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: TextStyle(color: Colors.white , fontSize: 14 , fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}

final List<_PieData> pieData = [
  _PieData('medicine', 30, '30%'),
  _PieData('art', 20, '20%'),
  _PieData('engineering', 15, '15%'),
  _PieData('agriculture', 10, '10%'),
  _PieData('geometry', 25, '20%'),
  _PieData('other', 10, '5%'),
];
