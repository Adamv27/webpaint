import 'package:flutter/material.dart';
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
  Drawing? currentDrawing;

  void onPanStart(DragStartDetails details) {
    print('User started drawing');
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);

    if (currentDrawing == null) {
      setState(() {
        currentDrawing = Drawing([point], Colors.green, 1);
      });
    }
  }

  void onPanUpdate(DragUpdateDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);

    final path = List<Offset>.from(currentDrawing!.path)..add(point);

    setState(() {
      currentDrawing = Drawing(path, Colors.green, 1);
    });
  }

  void onPanEnd(DragEndDetails details) {
    setState(() {
      drawings = List.from(drawings)..add(currentDrawing!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildCurrentPath(context),
          const ToolBar(),
        ],
      ),
    );
  }

  GestureDetector buildCurrentPath(BuildContext context) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CustomPaint(
            painter: Painter(drawings, Colors.purple),
            willChange: true,
          ),
        ),
      ),
    );
  }
}
