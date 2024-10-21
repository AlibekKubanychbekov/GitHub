import 'package:flutter/material.dart';
import 'package:pocemon_app/core/assets/app_images.dart';
import 'package:pocemon_app/core/extensions/build_context_extension.dart';
import 'package:pocemon_app/core/theme/app_colors.dart';
import 'package:pocemon_app/core/presentation/widgets/common_background/common_background.dart';
import 'package:pocemon_app/modules/welcome/widgets/welcome_buttons.dart';
import 'package:pocemon_app/modules/welcome/widgets/welcome_images.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              AppImages.bgLogo,
              color: AppColors.bgLogo.withOpacity(0.7),
              scale: 4.2,
            ),
          ),
          const CommonBackground(),
          const Positioned(
            bottom: 0,
            right: 0,
            child: WelcomeImages(),
          ),
          Positioned(
            bottom: context.height * 0.06,
            left: context.height * 0.09,
            right: context.height * 0.09,
            child: const WelcomeButtons(),
          ),
        ],
      ),
    );
  }
}
