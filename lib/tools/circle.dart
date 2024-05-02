import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webpaint/providers/canvas_state.dart';
import 'package:webpaint/utilities/drawing.dart';
import 'package:webpaint/tools/tool.dart';

class Circle extends Tool {
  Circle() : super(const Icon(Icons.circle_outlined));

  @override
  Drawing startDrawing(CanvasState canvasState, Offset point) {
    return Drawing(
      [point],
      canvasState.selectedColor,
      canvasState.lineThickness,
    );
  }

  @override
  Drawing updateDrawing(CanvasState canvasState, List<Offset> path) {
    Offset start = path[0];
    Offset end = path[path.length - 1];

    double centerX = start.dx;
    double centerY = start.dy;
    double radius =
        sqrt(pow(end.dx - start.dx, 2) + pow(end.dy - start.dy, 2)) / 2;

    List<Offset> points = [];
    points.addAll(getCircleOutline(centerX, centerY, radius));
    return Drawing(
        points, canvasState.selectedColor, canvasState.lineThickness);
  }

  List<Offset> getCircleOutline(centerX, centerY, radius) {
    List<Offset> points = [];
    for (int angle = 0; angle < 360; angle += 1) {
      double angleRadians = angle * (pi / 180);
      double x = centerX + radius * cos(angleRadians);
      double y = centerY + radius * sin(angleRadians);
      points.add(Offset(x, y));
    }
    return points;
  }
}
