import 'package:flutter/material.dart';
import 'package:pocemon_app/core/theme/app_colors.dart';

class MenuPokemonsText extends StatelessWidget {
  const MenuPokemonsText(
      {required this.text,
      required this.fontSize,
      required this.fontWeight,
      super.key});

  final String text;
  final double fontSize;
  final bool fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight ? FontWeight.w300 : FontWeight.w600,
          color: AppColors.mainText),
    );
  }
}
