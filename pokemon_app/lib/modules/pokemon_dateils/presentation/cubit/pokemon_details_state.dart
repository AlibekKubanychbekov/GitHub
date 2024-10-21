import 'package:pocemon_app/modules/pokemon_dateils/domain/entity/pokemon_details_entity.dart';

abstract class PokemonDetailsState {}

class PokemonDetailsInitState extends PokemonDetailsState {}

class PokemonDetailsLoadingState extends PokemonDetailsState {}

class PokemonDetailsSuccessState extends PokemonDetailsState {
  final PokemonDetailsEntity details;

  PokemonDetailsSuccessState({required this.details});
}

class PokemonDetailsErrorState extends PokemonDetailsState {}
