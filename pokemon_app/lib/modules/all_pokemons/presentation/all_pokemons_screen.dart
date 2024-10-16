import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
import 'package:pocemon_app/modules/welcome/widgets/text_menu.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                const CommonSliverAppbar(),
                const TextMenu(
                  text: 'Select your',
                  fontSize: 34.48,
                  fontWeight: FontWeight.w300,
                ),
                const TextMenu(
                  text: 'Pokèmon',
                  fontSize: 45.98,
                  fontWeight: FontWeight.w600,
                ),
                // SliverToBoxAdapter(
                //   child: ElevatedButton(
                //     onPressed: () {
                //       //   FetchAllPokemonsUsecase(
                //       //           repository: AllPokemonsRepositoryImpl(
                //       //               dio: DioSetting().dio,
                //       //               mapper: AllPokemonsMapper()))
                //       //       .execute();
                //     },
                //     child: const Text('data'),
                //   ),
                // )
                BlocBuilder<AllPokemonsBloc,
                    CommonBlocState<AllPokemonsEntity>>(
                  builder: (context, state) {
                    if (state.status == StateStatus.success) {
                      return SliverGrid.builder(
                        itemCount: state.model?.results?.length ?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            color: AppColors.contColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              state.model?.results?[index].name
                                      ?.toUpperCase() ??
                                  '',
                              style: const TextStyle(
                                  fontSize: 23, color: Colors.white),
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
          )
        ],
      ),
    );
  }
}
