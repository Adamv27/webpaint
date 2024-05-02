import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webpaint/providers/canvas_state.dart';
import 'package:webpaint/utilities/drawing.dart';
import 'package:webpaint/widgets/painter.dart';
import 'package:webpaint/widgets/toolbar.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({super.key});

  @override
  State<CanvasPage> createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  List<Drawing> drawings = <Drawing>[];
  Drawing currentDrawing = Drawing([], Colors.green, 1);

  final drawingsStreamController = StreamController<List<Drawing>>.broadcast();
  final currentDrawingStreamController = StreamController<Drawing>.broadcast();

  void onPanStart(DragStartDetails details, CanvasState canvasState) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    currentDrawing = canvasState.selectedTool.startDrawing(canvasState, point);
  }

  void onPanUpdate(DragUpdateDetails details, CanvasState canvasState) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);

    final path = List<Offset>.from(currentDrawing.path)..add(point);
    currentDrawing = canvasState.selectedTool.updateDrawing(canvasState, path);
    currentDrawingStreamController.add(currentDrawing);
  }

  void onPanEnd(DragEndDetails details) {
    drawings = List.from(drawings)..add(currentDrawing);
    drawingsStreamController.add(drawings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildAllDrawings(context),
          buildCurrentPath(context),
          const ToolBar(),
        ],
      ),
    );
  }

  GestureDetector buildCurrentPath(BuildContext context) {
    CanvasState canvasState = context.watch<CanvasState>();
    return GestureDetector(
      onPanStart: (DragStartDetails details) =>
          onPanStart(details, canvasState),
      onPanUpdate: (DragUpdateDetails details) =>
          onPanUpdate(details, canvasState),
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<Drawing>(
              stream: currentDrawingStreamController.stream,
              builder: (context, snapshot) {
                return CustomPaint(
                  painter: Painter([currentDrawing]),
                );
              }),
        ),
      ),
    );
  }

  Widget buildAllDrawings(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<List<Drawing>>(
            stream: drawingsStreamController.stream,
            builder: (context, snapshot) {
              return CustomPaint(
                painter: Painter(drawings),
              );
            }),
      ),
    );
  }
}
