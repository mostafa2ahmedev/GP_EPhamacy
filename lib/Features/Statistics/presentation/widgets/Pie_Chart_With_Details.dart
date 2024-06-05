import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Statistics/presentation/widgets/CustomPieChart.dart';

class PieChartWithDetails extends StatelessWidget {
  const PieChartWithDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomPieChart(),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text('hello'),
                    const Spacer(),
                    const Text('50')
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text('hello'),
                    const Spacer(),
                    const Text('50')
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text('hello'),
                    const Spacer(),
                    const Text('50')
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text('hello'),
                    const Spacer(),
                    const Text('50')
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text('hello'),
                    const Spacer(),
                    const Text('50')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
