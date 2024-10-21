import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocemon_app/core/assets/app_images.dart';
import 'package:pocemon_app/core/enums/state_status.dart';
import 'package:pocemon_app/core/presentation/common_bloc_state.dart';
import 'package:pocemon_app/core/presentation/widgets/common_background/common_background.dart';
import 'package:pocemon_app/core/presentation/widgets/common_sliver_appbar.dart';
import 'package:pocemon_app/core/theme/app_colors.dart';
import 'package:pocemon_app/modules/all_pokemons/domain/entity/all_pokemons_entity.dart';
import 'package:pocemon_app/modules/all_pokemons/domain/repository/all_pokemons_repository_impl.dart';
import 'package:pocemon_app/modules/all_pokemons/presentation/bloc/all_pokemons_bloc.dart';
import 'package:pocemon_app/modules/all_pokemons/presentation/bloc/all_pokemons_event.dart';
import 'package:pocemon_app/modules/pokemon_dateils/presentation/cubit/pokemon_details_cubit.dart';
import 'package:pocemon_app/modules/pokemon_dateils/presentation/pokemon_details_screen.dart';
import 'package:pocemon_app/modules/welcome/widgets/pokemonball_bg.dart';
import 'package:pocemon_app/modules/welcome/widgets/menu_pokemons_text.dart';

class AllPokemonsScreen extends StatefulWidget {
  const AllPokemonsScreen(
      {super.key, required AllPokemonsRepositoryImpl repository});

  @override
  State<AllPokemonsScreen> createState() => _AllPokemonsScreenState();

  void execute() {}
}

class _AllPokemonsScreenState extends State<AllPokemonsScreen> {
  @override
  void initState() {
    context.read<AllPokemonsBloc>().add(FetchAllPokemonsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          Image.asset(
            AppImages.satinAsh,
            opacity: const AlwaysStoppedAnimation(0.7),
          ),
          const CommonBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomScrollView(
              slivers: [
                const CommonSliverAppbar(),
                const SliverToBoxAdapter(
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MenuPokemonsText(
                              text: 'Select Your',
                              fontSize: 34.48,
                              fontWeight: true,
                            ),
                            MenuPokemonsText(
                              text: 'Pokèmon',
                              fontSize: 45.98,
                              fontWeight: false,
                            ),
                          ]),
                    ),
                    PokemonballBg(),
                  ]),
                ),
                BlocBuilder<AllPokemonsBloc,
                    CommonBlocState<AllPokemonsEntity>>(
                  builder: (context, state) {
                    if (state.status == StateStatus.success) {
                      return SliverGrid.builder(
                        itemCount: state.model?.results?.length ?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 16,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            context
                                .read<PokemonDetailsCubit>()
                                .fetchPokemonDetails(id: index + 1);
                            // int.parse(state
                            // .model?.results?[index].url?
                            //     .split('pokemon')
                            //     .last
                            //     .replaceAll('/', '') ?? ''));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PokemonDetailsScreen(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.mainText,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                state.model?.results?[index].name
                                        ?.toUpperCase() ??
                                    '',
                                style: const TextStyle(
                                    fontSize: 23, color: AppColors.appBarBg),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (state.status == StateStatus.loading) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Text('No data'),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
