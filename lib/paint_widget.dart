import 'package:flutter/material.dart';

class PaintWidget extends StatelessWidget {
  const PaintWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cx = MediaQuery.of(context).size.width / 2;
    var cy = MediaQuery.of(context).size.height / 2;
    var path = Path()
      ..moveTo(cx - 25, cy - 25)
      ..relativeLineTo(50, 0)
      ..relativeLineTo(0, 50)
      ..relativeLineTo(-50, 0)
      ..relativeLineTo(0, -50);
    return InteractiveViewer(
      scaleEnabled: true,
      maxScale: 5,
      panEnabled: true,
      child: CustomPaint(
        painter: FilledPathPainter(path: path, color: Colors.teal),
      ),
    );
  }
}

class FilledPathPainter extends CustomPainter {
  const FilledPathPainter({
    required this.path,
    required this.color,
  });

  final Path path;
  final Color color;

  @override
  bool shouldRepaint(FilledPathPainter oldDelegate) =>
      oldDelegate.path != path || oldDelegate.color != color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool hitTest(Offset position) => path.contains(position);
}
