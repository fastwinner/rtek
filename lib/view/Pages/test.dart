import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CustomPaint(
          size: Size(300, 200), // You can adjust the size as needed
          painter: CurvedShapePainter(),
        ),
      ),
    ),
  ));
}

class CurvedShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    // First curve (light blue)
    Path path1 = Path();
    path1.moveTo(0, size.height * 0.75);
    path1.quadraticBezierTo(size.width * 0.5, size.height, size.width, size.height * 0.5);
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();

    paint.color = Colors.lightBlueAccent.withOpacity(0.2);
    canvas.drawPath(path1, paint);

    // Second curve (blue)
    Path path2 = Path();
    path2.moveTo(0, size.height * 0.85);
    path2.quadraticBezierTo(size.width * 0.5, size.height, size.width, size.height * 0.5);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();

    paint.color = Colors.blueAccent;
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
