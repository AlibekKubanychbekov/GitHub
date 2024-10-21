import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocemon_app/modules/pokemon_dateils/domain/usecase/fetch_pokemon_details_usecase.dart';
import 'package:pocemon_app/modules/pokemon_dateils/presentation/cubit/pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  final FetchPokemonDetailsUsecase _fetchPokemonDetailsUsecase;

  PokemonDetailsCubit(
      {required FetchPokemonDetailsUsecase fetchAllPokemonsUsecase})
      : _fetchPokemonDetailsUsecase = fetchAllPokemonsUsecase,
        super(PokemonDetailsInitState());

  Future<void> fetchPokemonDetails({required int id}) async {
    emit(PokemonDetailsLoadingState());
    try {
      final result = await _fetchPokemonDetailsUsecase.execute(id: id);
      emit(PokemonDetailsSuccessState(details: result));
    } catch (e) {
      emit(PokemonDetailsErrorState());
    }
  }
}
