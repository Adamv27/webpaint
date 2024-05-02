import "package:flutter/material.dart";

class ToolBar extends StatefulWidget {
  const ToolBar({super.key});

  @override
  State<ToolBar> createState() => _ToolBarState();
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

class _ToolBarState extends State<ToolBar> {
  Tools selectedTool = Tools.pointer;

  @override
  Widget build(BuildContext context) {
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
            children: [for (var tool in Tools.values) buildIconButton(tool)],
          ),
        ),
      ),
    );
  }

  Container buildIconButton(Tools tool) {
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
          onPressed: () {
            setState(() {
              selectedTool = tool;
            });
          },
        ),
      ),
    );
  }
}
