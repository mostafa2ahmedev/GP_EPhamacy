import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DottedProgressBar extends StatefulWidget {
  final bool isSquare;
  final bool isRectangle;
  const DottedProgressBar(
      {Key? key, this.isSquare = false, this.isRectangle = false})
      : super(key: key);

  @override
  _DottedProgressBarState createState() => _DottedProgressBarState();
}

class _DottedProgressBarState extends State<DottedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Row(
              children: List.generate(
                widget.isRectangle ? 4 : 7,
                (index) {
                  final progress = (index + 1) / 8;
                  final rectangleProgress = (index + 1) / 5;
                  return Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 24,
                      width: widget.isRectangle ? 40 : null,
                      decoration: BoxDecoration(
                        shape: widget.isSquare
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        color: (widget.isRectangle
                                    ? rectangleProgress
                                    : progress) <=
                                _animation.value
                            ? const Color(0xFF00BAAB) // Your desired color
                            : Colors.black,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}