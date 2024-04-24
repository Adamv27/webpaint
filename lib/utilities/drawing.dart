import 'package:flutter/material.dart';

class Drawing {
  final List<Offset> path;
  final Color color;
  final double width;

  Drawing(this.path, this.color, this.width);
}
