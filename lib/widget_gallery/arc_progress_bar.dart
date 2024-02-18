import 'dart:math';
import 'package:flutter/material.dart';

class ArcProgressBar extends StatelessWidget {
  const ArcProgressBar(
      {super.key,
      required this.fillingPercentage,
      required this.width,
      required this.height,
      this.onEnd,
      this.backgroundLineColor = Colors.grey,
      this.foregroundLineColor = Colors.blue,
      this.backgroundLineWidth = 3,
      this.foregroundLineWidth = 4,
      this.scale = 1,
      this.indent = 0.0});

  final double height;
  final double width;
  final double indent;
  final double fillingPercentage;
  final double backgroundLineWidth;
  final double foregroundLineWidth;
  final double scale;
  final Color backgroundLineColor;
  final Color foregroundLineColor;
  final VoidCallback? onEnd;

  @override
  Widget build(BuildContext context) {
    fillingPercentage == 100 && onEnd != null ? onEnd!() : null;
    assert(indent >= 0.0 && indent <= 1);
    assert(fillingPercentage >= 0.0 && fillingPercentage <= 100);
    return CustomPaint(
      size: Size(width, (height / 2) - (indent * 300)),
      painter: _MyPainter(
          indent: indent,
          backgroundLineColor: backgroundLineColor,
          foregroundLineColor: foregroundLineColor,
          fillingPercentage: fillingPercentage,
          foregroundLineWidth: foregroundLineWidth,
          backgroundLineWidth: backgroundLineWidth,
          scale: scale),
    );
  }
}

class _MyPainter extends CustomPainter {
  _MyPainter({
    required this.indent,
    required this.fillingPercentage,
    required this.foregroundLineWidth,
    required this.backgroundLineWidth,
    required this.backgroundLineColor,
    required this.foregroundLineColor,
    required this.scale,
  });

  final double indent;
  final double fillingPercentage;
  final double foregroundLineWidth;
  final double scale;
  final double backgroundLineWidth;
  final Color backgroundLineColor;
  final Color foregroundLineColor;

  /* The canvas size is equal to the size of the "Size" object. 
  The size of object Size is equal to the size of the parent.*/
  @override
  void paint(Canvas canvas, Size size) {
    final paintBackground = Paint()
      ..color = backgroundLineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = backgroundLineWidth
      ..strokeCap = StrokeCap.round;
    final paintForeground = Paint()
      ..color = foregroundLineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = foregroundLineWidth
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(
      0, //Axis X
      0, //Axis Y
      size.width, // Width
      size.height * 2 + (indent * 300), // Height
    );
    //Initial angle
    final startAngle = pi + indent;
    //Arc length.The length of the arc is determined from the initial angle
    final sweepAngleBackground = pi - indent * 2;

    final sweepAngleForeground = calculatePercentage(fillingPercentage);

    canvas.scale(scale);

    canvas.drawArc(
        rect, startAngle, sweepAngleBackground, false, paintBackground);
    canvas.drawArc(
        rect, startAngle, sweepAngleForeground, false, paintForeground);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double calculatePercentage(double percent) {
    return ((pi - indent * 2) / 100 * percent).toDouble();
  }
}
