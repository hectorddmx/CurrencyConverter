import 'dart:ui' as ui;
import 'package:flutter/material.dart';

/// TODO: test this later and see if I'm able to add a UI similar to the card.
/// TEST for custom painter from SVG designed from Figma
/// And then converted with https://fluttershapemaker.com/
/// Can be called like this:
/// ```dart
/// CustomPaint(
//   size: Size(WIDTH, (WIDTH * 0.9232876712328767).toDouble()),
//   //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//   painter: RPSCustomPainter(),
// ),
/// ```
///Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.05479452, 0);
    path_0.cubicTo(size.width * 0.02453236, 0, 0, size.height * 0.02657062, 0,
        size.height * 0.05934718);
    path_0.lineTo(0, size.height * 0.4213650);
    path_0.cubicTo(
        0,
        size.height * 0.4541424,
        size.width * 0.02453238,
        size.height * 0.4807122,
        size.width * 0.05479452,
        size.height * 0.4807122);
    path_0.lineTo(size.width * 0.7067753, size.height * 0.4807122);
    path_0.cubicTo(
        size.width * 0.7183288,
        size.height * 0.4332226,
        size.width * 0.7661068,
        size.height * 0.3976261,
        size.width * 0.8232877,
        size.height * 0.3976261);
    path_0.cubicTo(
        size.width * 0.8804685,
        size.height * 0.3976261,
        size.width * 0.9282466,
        size.height * 0.4332226,
        size.width * 0.9398000,
        size.height * 0.4807122);
    path_0.lineTo(size.width * 0.9452055, size.height * 0.4807122);
    path_0.cubicTo(size.width * 0.9754685, size.height * 0.4807122, size.width,
        size.height * 0.4541424, size.width, size.height * 0.4213650);
    path_0.lineTo(size.width, size.height * 0.05934718);
    path_0.cubicTo(size.width, size.height * 0.02657065, size.width * 0.9754685,
        0, size.width * 0.9452055, 0);
    path_0.lineTo(size.width * 0.05479452, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.black.withOpacity(1.0);
    // paint_0_fill.maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(0.1));
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.7055315, size.height * 0.5192878);
    path_1.lineTo(size.width * 0.05479452, size.height * 0.5192878);
    path_1.cubicTo(size.width * 0.02453236, size.height * 0.5192878, 0,
        size.height * 0.5458576, 0, size.height * 0.5786350);
    path_1.lineTo(0, size.height * 0.9406528);
    path_1.cubicTo(0, size.height * 0.9734303, size.width * 0.02453238,
        size.height, size.width * 0.05479452, size.height);
    path_1.lineTo(size.width * 0.9452055, size.height);
    path_1.cubicTo(size.width * 0.9754685, size.height, size.width,
        size.height * 0.9734303, size.width, size.height * 0.9406528);
    path_1.lineTo(size.width, size.height * 0.5786350);
    path_1.cubicTo(
        size.width,
        size.height * 0.5458576,
        size.width * 0.9754685,
        size.height * 0.5192878,
        size.width * 0.9452055,
        size.height * 0.5192878);
    path_1.lineTo(size.width * 0.9410438, size.height * 0.5192878);
    path_1.cubicTo(
        size.width * 0.9321699,
        size.height * 0.5697151,
        size.width * 0.8828274,
        size.height * 0.6083086,
        size.width * 0.8232877,
        size.height * 0.6083086);
    path_1.cubicTo(
        size.width * 0.7637479,
        size.height * 0.6083086,
        size.width * 0.7144055,
        size.height * 0.5697151,
        size.width * 0.7055315,
        size.height * 0.5192878);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.red.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.green.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.8219178, size.height * 0.5014837),
        size.width * 0.07397260, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
