import 'package:flutter/material.dart';
import 'package:webpaint/providers/canvas_state.dart';
import 'package:webpaint/utilities/drawing.dart';
import 'package:webpaint/tools/tool.dart';

class Pencil extends Tool {
  Pencil() : super(const Icon(Icons.draw));

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
      path,
      canvasState.selectedColor,
      canvasState.lineThickness,
    );
  }
}
