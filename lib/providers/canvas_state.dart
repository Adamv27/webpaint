import 'package:flutter/material.dart';
import 'package:webpaint/utilities/tools.dart';

class CanvasState extends ChangeNotifier {
  Tools selectedTool = Tools.pencil;

  void setSelectedTool(tool) {
    selectedTool = tool;
    notifyListeners();
  }
}
