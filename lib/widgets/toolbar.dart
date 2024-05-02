import "package:flutter/material.dart";
import "package:webpaint/providers/canvas_state.dart";
import "package:webpaint/utilities/tools.dart";
import 'package:provider/provider.dart';

class ToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CanvasState canvasState = context.watch<CanvasState>();
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
              for (var tool in Tools.values)
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

  Container buildIconButton(Tools tool, CanvasState canvasState) {
    final selectedTool = canvasState.selectedTool;
    return Container(
      decoration: BoxDecoration(
        color: selectedTool == tool ? Colors.blueAccent.shade200 : null,
        borderRadius: selectedTool == tool ? BorderRadius.circular(5) : null,
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
