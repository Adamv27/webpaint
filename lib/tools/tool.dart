import 'package:flutter/material.dart';
import 'package:webpaint/providers/canvas_state.dart';
import 'package:webpaint/utilities/drawing.dart';

abstract class Tool {
  final Icon icon;

  Tool(this.icon);

  Drawing startDrawing(CanvasState canvasState, Offset point);
  Drawing updateDrawing(CanvasState canvasState, List<Offset> path);
}
