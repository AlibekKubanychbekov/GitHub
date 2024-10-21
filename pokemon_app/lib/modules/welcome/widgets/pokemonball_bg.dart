import 'package:flutter/material.dart';
import 'package:pocemon_app/core/assets/app_images.dart';

class PokemonballBg extends StatelessWidget {
  const PokemonballBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Image.asset(
        AppImages.welcomePokeball,
        scale: 2.5,
      ),
    );
  }
}
