import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAnimatedIndicator extends StatefulWidget {
  const CustomAnimatedIndicator({super.key});

  @override
  State<CustomAnimatedIndicator> createState() =>
      _CustomAnimatedIndicatorState();
}

class _CustomAnimatedIndicatorState extends State<CustomAnimatedIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isPlaying = false;
  int maxDuration = 10;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: maxDuration))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isPlaying = false;
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double val = (_controller.value * maxDuration);
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomPaint(
                    painter: LiquidPainter(
                      _controller.value * maxDuration,
                      maxDuration.toDouble(),
                    ),
                  ),
                ),
                CustomPaint(
                    painter: RadialProgressPainter(
                  value: _controller.value * maxDuration,
                  backgroundGradientColors: [
                    const Color(0xffFF0069),
                    const Color(0xffFED602),
                    const Color(0xff7639FB),
                    const Color(0xffD500C5),
                    const Color(0xffFF7A01),
                    const Color(0xffFF0069),
                  ],
                  minValue: 0,
                  maxValue: maxDuration.toDouble(),
                )),
              ],
            ),
          );
        });
  }
}

class RadialProgressPainter extends CustomPainter {
  final double value;
  final List<Color> backgroundGradientColors;
  final double minValue;
  final double maxValue;

  // Constructor to initialize the RadialProgressPainter with required parameters.
  RadialProgressPainter({
    required this.value,
    required this.backgroundGradientColors,
    required this.minValue,
    required this.maxValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double diameter = min(size.height, size.width);
    final double radius = diameter / 2;
    final double centerX = radius;
    final double centerY = radius;

    const double strokeWidth = 6;

    final Paint progressPaint = Paint()
      ..shader = SweepGradient(
        colors: backgroundGradientColors,
        startAngle: -pi / 2,
        endAngle: 3 * pi / 2,
        tileMode: TileMode.repeated,
      ).createShader(
          Rect.fromCircle(center: Offset(centerX, centerY), radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final Paint progressTrackPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * value / maxValue;

    canvas.drawCircle(Offset(centerX, centerY), radius, progressTrackPaint);
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class LiquidPainter extends CustomPainter {
  final double value;
  final double maxValue;

  LiquidPainter(this.value, this.maxValue);

  @override
  void paint(Canvas canvas, Size size) {
    double diameter = min(size.height, size.width);
    double radius = diameter / 2;

    double pointX = 0;
    double pointY = diameter - ((diameter + 10) * (value / maxValue));

    Path path = Path();
    path.moveTo(pointX, pointY);
    double amplitude = 10;
    double period = value / maxValue;

    double phaseShift = value * pi;

    for (double i = 0; i <= diameter; i++) {
      path.lineTo(
        i + pointX,
        pointY + amplitude * sin((i * 2 * period * pi / diameter) + phaseShift),
      );
    }

    path.lineTo(pointX + diameter, diameter);
    path.lineTo(pointX, diameter);
    path.close();

    Paint paint = Paint()
      ..shader = const SweepGradient(
              colors: [
                Color(0xffFF7A01),
                Color(0xffFF0069),
                Color(0xff7639FB),
              ],
              startAngle: pi / 2,
              endAngle: 5 * pi / 2,
              tileMode: TileMode.clamp,
              stops: [
                0.25,
                0.35,
                0.5,
              ])
          .createShader(Rect.fromCircle(
              center: Offset(diameter, diameter), radius: radius))
      ..style = PaintingStyle.fill;

    Path circleClip = Path()
      ..addOval(Rect.fromCenter(
          center: Offset(radius, radius), width: diameter, height: diameter));
    canvas.clipPath(circleClip, doAntiAlias: true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
