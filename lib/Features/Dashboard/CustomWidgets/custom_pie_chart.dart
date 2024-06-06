import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Dashboard/data/statistics_model/student_per_collage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;

class CustomPieChart extends StatefulWidget {
  CustomPieChart({super.key, required this.studentPerCollage});
  final List<StudentPerCollage> studentPerCollage;

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  late final List<_PieData> pieData;
  late List<StudentPerCollage> states;
  @override
  void initState() {
    super.initState();
    //get total count of students
    int totalStudents =
        widget.studentPerCollage.fold(0, (sum, e) => sum + e.count!);

    //sort the list
    widget.studentPerCollage.sort((a, b) => b.count! - a.count!);

    //get top five element
    states = widget.studentPerCollage.sublist(0, 4);

    states.add(new StudentPerCollage(
        collage: "Other(${widget.studentPerCollage.length - 4})",
        count: widget.studentPerCollage
            .sublist(5)
            .fold(0, (sum, e) => sum! + e.count!)));

    pieData = states.map((e) {
      int precentage = ((e.count! / totalStudents) * 100).floor();
      String myString = e.collage!.replaceAll("كلية", "");
      int maxLength = 17; // Maximum allowed characters

      String limitedString = myString.substring(
          0, maxLength < myString.length ? maxLength : myString.length);
      return _PieData(limitedString, e.count!, "$precentage %");
    }).toList();
  }

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
        textStyle: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
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
            textStyle: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
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
