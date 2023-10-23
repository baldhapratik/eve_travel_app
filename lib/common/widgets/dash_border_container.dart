import 'dart:math';

import 'package:eve_travel_app/app_imports/app_imports.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final Color color;
  final Color containerColor;

  const DashedBorderContainer({
    super.key,
    required this.child,
    this.width = 1.0,
    this.color = Colors.black,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedRectPainter(color: color, width: width, borderRadius: 20),
      child: Container(
        decoration: BoxDecoration(color: containerColor,borderRadius: BorderRadius.circular(20)),
        child: child,
      ),
    );
  }
}

class DashedRectPainter extends CustomPainter {
  final Color color;
  final double width;
  final double borderRadius;

  DashedRectPainter({
    required this.color,
    required this.width,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    double dashWidth = 5;
    double dashSpace = 5;
    double startX = borderRadius;
    double startY = borderRadius;
    double endX = size.width - borderRadius;
    double endY = size.height - borderRadius;

    // Draw top dashed line
    while (startX < endX) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }

    // Draw right dashed line
    while (startY < endY) {
      canvas.drawLine(Offset(size.width, startY),
          Offset(size.width, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }

    // Draw bottom dashed line
    startX = endX;
    while (startX > borderRadius) {
      canvas.drawLine(Offset(startX, size.height),
          Offset(startX - dashWidth, size.height), paint);
      startX -= dashWidth + dashSpace;
    }

    // Draw left dashed line
    startY = endY;
    while (startY > borderRadius) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY - dashWidth), paint);
      startY -= dashWidth + dashSpace;
    }

    // Draw arcs at corners
    canvas.drawArc(
      Rect.fromCircle(center: Offset(borderRadius, borderRadius), radius: borderRadius),
      3 * pi / 2,
      pi / 2,
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width - borderRadius, borderRadius), radius: borderRadius),
      0,
      pi / 2,
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: Offset(borderRadius, size.height - borderRadius), radius: borderRadius),
      pi,
      pi / 2,
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width - borderRadius, size.height - borderRadius), radius: borderRadius),
      pi / 2,
      pi / 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(DashedRectPainter oldDelegate) =>
      color != oldDelegate.color || width != oldDelegate.width;

  @override
  bool shouldRebuildSemantics(DashedRectPainter oldDelegate) => false;
}
