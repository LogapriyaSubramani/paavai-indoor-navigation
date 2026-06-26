import 'package:flutter/material.dart';
import '../models/location_model.dart';

class MapPainter extends CustomPainter {
  final LocationModel source;
  final LocationModel destination;

  const MapPainter({
    required this.source,
    required this.destination,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Route line
    final routePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(source.x, source.y),
      Offset(destination.x, destination.y),
      routePaint,
    );

    // Source marker
    final sourcePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(source.x, source.y),
      10,
      sourcePaint,
    );

    // Destination marker
    final destinationPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(destination.x, destination.y),
      10,
      destinationPaint,
    );

    // Destination label
    final textPainter = TextPainter(
      text: TextSpan(
        text: destination.name,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.white,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    textPainter.paint(
      canvas,
      Offset(destination.x + 12, destination.y - 10),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}