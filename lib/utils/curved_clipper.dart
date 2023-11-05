import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var radius = 5.0;

    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.cubicTo(size.width + radius, 0, size.width + radius, size.height,
        size.width - radius, size.height);
    path.lineTo(radius, size.height);
    path.cubicTo(-radius, size.height, -radius, 0, radius, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
