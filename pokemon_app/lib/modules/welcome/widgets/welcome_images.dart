import 'package:flutter/material.dart';
import 'package:pocemon_app/core/assets/app_images.dart';
import 'package:pocemon_app/core/extensions/build_context_extension.dart';

class WelcomeImages extends StatelessWidget {
  const WelcomeImages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width * 0.6,
                child: Image.asset(
                  AppImages.welcomeLogoText,
                  scale: 4,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  AppImages.welcomePokeball,
                  scale: 4,
                ),
              )
            ],
          ),
          Expanded(
            child: Image.asset(
              AppImages.welcomeAsh,
            ),
          ),
        ],
      ),
    );
  }
}
