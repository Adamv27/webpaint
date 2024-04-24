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
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(50.0),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected) ||
                states.contains(MaterialState.pressed)) {
              return Colors.grey.withOpacity(0.9);
            }

            return Colors.white.withOpacity(0.6);
          }),
        ),
        showSelectedIcon: false,
        segments: const [
          ButtonSegment(
            value: Tools.pointer,
            icon: Icon(Icons.navigation),
          ),
          ButtonSegment(
            value: Tools.line,
            icon: Icon(Icons.horizontal_rule),
          ),
          ButtonSegment(
            value: Tools.square,
            icon: Icon(Icons.crop_square),
          ),
          ButtonSegment(
            value: Tools.circle,
            icon: Icon(Icons.circle_outlined),
          ),
          ButtonSegment(
            value: Tools.pencil,
            icon: Icon(Icons.draw),
          ),
          ButtonSegment(value: Tools.eraser, icon: Icon(Icons.auto_fix_normal))
        ],
        selected: <Tools>{toolsView},
        onSelectionChanged: (Set<Tools> newTool) {
          setState(() {
            toolsView = newTool.first;
          });
        });
  }
}
