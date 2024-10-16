import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocemon_app/core/services/dio_setting.dart';
import 'package:pocemon_app/modules/all_pokemons/data/mapper/all_pokemons_mapper.dart';
import 'package:pocemon_app/modules/all_pokemons/domain/repository/all_pokemons_repository_impl.dart';
import 'package:pocemon_app/modules/all_pokemons/domain/usecase/fetch_all_pokemons_usecase.dart';
import 'package:pocemon_app/modules/all_pokemons/presentation/bloc/all_pokemons_bloc.dart';
import 'package:pocemon_app/modules/welcome/welcome_screen.dart';

void main() {
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllPokemonsBloc(
            fetchAllPokemonsUsecase: FetchAllPokemonsUsecase(
              repository: AllPokemonsRepositoryImpl(
                dio: DioSetting().dio,
                mapper: AllPokemonsMapper(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'ClashDisplay',
          ),
          home: const WelcomeScreen()),
    );
  }
}
