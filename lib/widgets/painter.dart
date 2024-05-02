import 'package:flutter/material.dart';
import 'package:webpaint/utilities/drawing.dart';

class Painter extends CustomPainter {
  final List<Drawing> drawings;
  Painter(this.drawings);

  var rect = Rect.fromCenter(
    center: const Offset(100.0, 150.0),
    width: 50,
    height: 75,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeCap = StrokeCap.round;

    for (final drawing in drawings) {
      for (int i = 0; i < drawing.path.length - 1; ++i) {
        paint.color = drawing.color;
        paint.strokeWidth = drawing.width;
        final start = drawing.path[i];
        final end = drawing.path[i + 1];
        canvas.drawLine(start, end, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant Painter oldDelegate) {
    return drawings != oldDelegate.drawings;
  }

  @override
  bool? hitTest(Offset position) {
    return rect.contains(position);
  }
}
