import 'package:flutter/material.dart';

class CustomRect extends CustomClipper<Path> {
  final double yOffset;
  CustomRect({this.yOffset});
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo((size.width / 2) - 40.0, size.height);
    path.addArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height+yOffset), radius: 40.0),
        -3.14,
        3.14);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.lineTo(0.0, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}