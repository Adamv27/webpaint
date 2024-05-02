import 'package:flutter/material.dart';

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
