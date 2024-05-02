import "package:flutter/material.dart";
import "package:webpaint/providers/canvas_state.dart";
import "package:webpaint/tools/circle.dart";
import "package:webpaint/tools/eraser.dart";
import "package:webpaint/tools/line.dart";
import "package:webpaint/tools/pencil.dart";
import "package:webpaint/tools/pointer.dart";
import "package:webpaint/tools/square.dart";
import "package:webpaint/tools/tool.dart";
import 'package:provider/provider.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    CanvasState canvasState = context.watch<CanvasState>();

    List<Tool> tools = [
      Pointer(),
      Line(),
      Square(),
      Circle(),
      Pencil(),
      Eraser()
    ];

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        alignment: Alignment.topCenter,
        height: 40,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var tool in tools)
                buildIconButton(
                  tool,
                  canvasState,
                )
            ],
          ),
        ),
      ),
    );
  }

  Container buildIconButton(Tool tool, CanvasState canvasState) {
    final selectedTool = canvasState.selectedTool;
    bool isSelected = selectedTool.runtimeType == tool.runtimeType;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueAccent.shade200 : null,
        borderRadius: isSelected ? BorderRadius.circular(5) : null,
      ),
      child: FittedBox(
        child: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          icon: tool.icon,
          onPressed: () => canvasState.setSelectedTool(tool),
        ),
      ),
    );
  }
}
