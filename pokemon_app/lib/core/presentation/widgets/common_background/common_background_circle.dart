import 'package:flutter/material.dart';

class CommonBackgroundCircle extends StatelessWidget {
  const CommonBackgroundCircle({
    required this.color,
    this.radius = 300,
    super.key,
  });

  final Color color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 1,
      decoration: BoxDecoration(
          color: color.withOpacity(0.01),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 100,
              color: color.withOpacity(0.3),
              spreadRadius: radius,
            )
          ]),
    );
  }
}
