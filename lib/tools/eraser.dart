import 'package:flutter/material.dart';
import 'package:webpaint/providers/canvas_state.dart';
import 'package:webpaint/utilities/drawing.dart';
import 'package:webpaint/tools/tool.dart';

class Eraser extends Tool {
  Eraser() : super(const Icon(Icons.auto_fix_normal));

  @override
  Drawing startDrawing(CanvasState canvasState, Offset point) {
    return Drawing(
      [point],
      Colors.white,
      canvasState.lineThickness,
    );
  }

  @override
  Drawing updateDrawing(CanvasState canvasState, List<Offset> path) {
    return Drawing(
      path,
      Colors.white,
      canvasState.lineThickness,
    );
  }
}
