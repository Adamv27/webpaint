import 'package:flutter/material.dart';
import 'package:webpaint/widgets/toolbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomPaint(
            painter: DemoPainter(Colors.green),
            willChange: true,
            child: const SizedBox.square(
              dimension: 200.0,
            ),
          ),
          const ToolBar(),
        ],
      ),
    );
  }
}

class DemoPainter extends CustomPainter {
  final Color rectColor;
  DemoPainter(this.rectColor);

  var rect = Rect.fromCenter(
    center: const Offset(100.0, 150.0),
    width: 50,
    height: 75,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    var paint = Paint()
      ..color = rectColor
      ..strokeWidth = 9.0;

    canvas.drawRect(rect, paint);
    var radius = 9.0;
    paint = Paint()..color = Colors.blue;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant DemoPainter oldDelegate) {
    return rectColor != oldDelegate.rectColor;
  }

  @override
  bool? hitTest(Offset position) {
    return rect.contains(position);
  }
}
