import 'package:flutter/material.dart';
import 'package:webpaint/providers/canvas_state.dart';
import 'package:webpaint/utilities/drawing.dart';
import 'package:webpaint/tools/tool.dart';

class Line extends Tool {
  Line() : super(const Icon(Icons.horizontal_rule));

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
    return Drawing(
      [path[0], path[path.length - 1]],
      canvasState.selectedColor,
      canvasState.lineThickness,
    );
  }
}
