import 'package:flutter/material.dart';
import 'package:pocemon_app/core/theme/app_colors.dart';

class TextMenu extends StatelessWidget {
  const TextMenu(
      {required this.text,
      required this.fontSize,
      required this.fontWeight,
      super.key});

  final String text;
  final double fontSize;
  final dynamic fontWeight;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: AppColors.mainText),
      ),
    );
  }
}
