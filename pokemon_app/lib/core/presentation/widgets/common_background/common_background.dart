import 'package:flutter/material.dart';
import 'package:pocemon_app/core/theme/app_colors.dart';
import 'package:pocemon_app/core/presentation/widgets/common_background/common_background_circle.dart';

class CommonBackground extends StatelessWidget {
  const CommonBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.bgColor,
        ),
        const CommonBackgroundCircle(color: AppColors.color41AAF7),
        const Positioned(
            top: -100,
            right: 0,
            bottom: 0,
            child: CommonBackgroundCircle(
              color: AppColors.yellow,
            )),
        const Positioned(
            bottom: 0,
            child: CommonBackgroundCircle(
              color: AppColors.red,
              radius: 350,
            )),
      ],
    );
  }
}
