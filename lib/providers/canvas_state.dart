import 'package:flutter/material.dart';
import 'package:webpaint/tools/pencil.dart';
import 'package:webpaint/tools/tool.dart';

class CanvasState extends ChangeNotifier {
  Tool selectedTool = Pencil();
  Color selectedColor = Colors.black;
  double lineThickness = 5;

  void setSelectedTool(Tool tool) {
    selectedTool = tool;
    notifyListeners();
  }
}
