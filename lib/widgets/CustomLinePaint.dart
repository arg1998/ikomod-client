import 'package:flutter/material.dart';

class Triangle extends StatelessWidget {
  final Color lineColor;
  final double lineWidth;
  final double width;
  final double height;

  Triangle({Key key, this.lineColor, this.lineWidth, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: SizedBox(
          height: height ?? double.infinity, width: width ?? double.infinity),
      painter: DrawTringle(lineColor: lineColor, lineWidth: lineWidth),
    );
  }
}

class DrawTringle extends CustomPainter {
  final Paint linePainter;
  final Color lineColor;
  final double lineWidth;

  DrawTringle({this.lineColor, this.lineWidth})
      : linePainter = Paint()
          ..strokeCap = StrokeCap.round
          ..color = lineColor
          ..strokeWidth = lineWidth;

  @override
  void paint(Canvas canvas, Size size) {
    //change linOffset 2 to 3 for stick Triangle to the advertize
    final double lineOffset = lineWidth / 3;

    final topCenter = Offset(size.width / 2, lineOffset);
    final bottomLeft = Offset(0 + lineOffset, size.height - lineOffset);
    final bottomRight =
        Offset(size.width - lineOffset, size.height - lineOffset);

    canvas.drawLine(topCenter, bottomRight, linePainter);
    canvas.drawLine(topCenter, bottomLeft, linePainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
