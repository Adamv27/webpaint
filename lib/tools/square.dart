import 'package:flutter/material.dart';
import 'package:webpaint/providers/canvas_state.dart';
import 'package:webpaint/utilities/drawing.dart';
import 'package:webpaint/tools/tool.dart';

class Square extends Tool {
  Square() : super(const Icon(Icons.crop_square_outlined));

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

    Offset corner1 = Offset(end.dx, start.dy);
    Offset corner2 = Offset(start.dx, end.dy);
    return Drawing(
      // Start and end are on opposite corners
      [start, corner1, end, corner2, start],
      canvasState.selectedColor,
      canvasState.lineThickness,
    );
  }
}
