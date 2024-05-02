import 'package:flutter/material.dart';
import 'package:webpaint/utilities/drawing.dart';

abstract class Tool {
  final Icon icon;

  Tool(this.icon);

  Drawing startDrawing();
  Drawing updateDraing();
  Drawing endDrawing();
}

class Pencil extends Tool {
  Pencil(super.icon);

  @override
  Drawing endDrawing() {
    // TODO: implement endDrawing
    throw UnimplementedError();
  }

  @override
  Drawing startDrawing() {
    // TODO: implement startDrawing
    throw UnimplementedError();
  }

  @override
  Drawing updateDraing() {
    // TODO: implement updateDraing
    throw UnimplementedError();
  }
}

enum Tools {
  pointer(icon: Icon(Icons.navigation)),
  line(icon: Icon(Icons.horizontal_rule)),
  square(icon: Icon(Icons.crop_square)),
  circle(icon: Icon(Icons.circle_outlined)),
  pencil(icon: Icon(Icons.draw)),
  eraser(icon: Icon(Icons.auto_fix_normal));

  const Tools({
    required this.icon,
  });

  final Icon icon;
}
