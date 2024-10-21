import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocemon_app/core/assets/app_images.dart';
import 'package:pocemon_app/core/presentation/widgets/common_background/common_background.dart';
import 'package:pocemon_app/core/theme/app_colors.dart';
import 'package:pocemon_app/modules/pokemon_dateils/presentation/cubit/pokemon_details_cubit.dart';
import 'package:pocemon_app/modules/pokemon_dateils/presentation/cubit/pokemon_details_state.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(children: [
        Positioned(
          width: 876.73,
          height: 659.54,
          top: 1.64,
          left: -235,
          child: Image.asset(
            AppImages.charizardBG,
            opacity: const AlwaysStoppedAnimation(0.9),
          ),
        ),
        const CommonBackground(),
        Positioned(
          top: 50.93,
          bottom: 0,
          left: 0,
          right: -12,
          child: Image.asset(
            AppImages.vectorTop,
            opacity: const AlwaysStoppedAnimation(0.8),
            scale: 3,
          ),
        ),
        Positioned(
          top: 491.91,
          bottom: 90,
          left: 0,
          right: 0,
          child: Image.asset(
            AppImages.vectorBt,
            opacity: const AlwaysStoppedAnimation(0.8),
            scale: 3,
          ),
        ),
        BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
            builder: (context, state) {
          if (state is PokemonDetailsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonDetailsSuccessState) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    state.details.sprites?.frontDefault ?? '',
                    scale: 0.4,
                  ),
                  Text(
                    state.details.name?.toUpperCase() ?? 'null',
                    style:
                        const TextStyle(color: AppColors.yellow, fontSize: 36),
                  ),
                ],
              ),
            );
          } else if (state is PokemonDetailsErrorState) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: Text('No data'),
            );
          }
        }),
      ]),
    );
  }
}
