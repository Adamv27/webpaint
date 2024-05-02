import 'package:flutter/material.dart';
import 'package:webpaint/providers/canvas_state.dart';
import 'package:webpaint/utilities/drawing.dart';
import 'package:webpaint/tools/tool.dart';

class Pointer extends Tool {
  Pointer() : super(const Icon(Icons.navigation_outlined));

  @override
  Drawing startDrawing(CanvasState canvasState, Offset point) {
    // TODO: implement startDrawing
    throw UnimplementedError();
  }

  @override
  Drawing updateDrawing(CanvasState canvasState, List<Offset> path) {
    // TODO: implement updateDraing
    throw UnimplementedError();
  }
}
