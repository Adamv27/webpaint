import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  final Color rectColor;
  Painter(this.rectColor);

  var rect = Rect.fromCenter(
    center: const Offset(100.0, 150.0),
    width: 50,
    height: 75,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    var paint = Paint()
      ..color = rectColor
      ..strokeWidth = 9.0;

    canvas.drawRect(rect, paint);
    var radius = 9.0;
    paint = Paint()..color = Colors.blue;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant Painter oldDelegate) {
    return rectColor != oldDelegate.rectColor;
  }

  @override
  bool? hitTest(Offset position) {
    return rect.contains(position);
  }
}
