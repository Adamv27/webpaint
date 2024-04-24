import 'package:flutter/material.dart';
import 'package:webpaint/widgets/painter.dart';
import 'package:webpaint/widgets/toolbar.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({super.key});

  @override
  State<CanvasPage> createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 25.0),
            Listener(
              child: CustomPaint(
                painter: Painter(Colors.green),
                willChange: true,
              ),
            ),
            const ToolBar(),
          ],
        ),
      ),
    );
  }
}
