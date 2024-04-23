import "package:flutter/material.dart";

class ToolBar extends StatefulWidget {
  const ToolBar({super.key});

  @override
  State<ToolBar> createState() => _ToolBarState();
}

enum Tools { pointer, line, square, circle, pencil, eraser }

class _ToolBarState extends State<ToolBar> {
  Tools toolsView = Tools.pointer;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Tools>(
        segments: const [
          ButtonSegment(
            value: Tools.pointer,
            icon: Icon(Icons.navigate_before),
          ),
          ButtonSegment(
            value: Tools.line,
            icon: Icon(Icons.line_axis),
          ),
        ],
        selected: <Tools>{
          toolsView
        },
        onSelectionChanged: (Set<Tools> newTool) {
          setState(() {
            toolsView = newTool.first;
          });
        });
  }
}
