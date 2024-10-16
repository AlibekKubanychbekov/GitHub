import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocemon_app/core/enums/state_status.dart';
import 'package:pocemon_app/core/presentation/common_bloc_state.dart';
import 'package:pocemon_app/modules/all_pokemons/domain/entity/all_pokemons_entity.dart';
import 'package:pocemon_app/modules/all_pokemons/domain/usecase/fetch_all_pokemons_usecase.dart';
import 'package:pocemon_app/modules/all_pokemons/presentation/bloc/all_pokemons_event.dart';

class AllPokemonsBloc
    extends Bloc<AllPokemonsEvent, CommonBlocState<AllPokemonsEntity>> {
  final FetchAllPokemonsUsecase _fetchAllPokemonsUsecase;
  AllPokemonsBloc({required FetchAllPokemonsUsecase fetchAllPokemonsUsecase})
      : _fetchAllPokemonsUsecase = fetchAllPokemonsUsecase,
        super(
          CommonBlocState(
            status: StateStatus.init,
          ),
        ) {
    on<FetchAllPokemonsEvent>((event, emit) async {
      emit(CommonBlocState(status: StateStatus.loading));
      try {
        final result = await _fetchAllPokemonsUsecase.execute();
        emit(CommonBlocState(status: StateStatus.success, model: result));
      } catch (e) {
        emit(
          CommonBlocState(
            status: StateStatus.error,
            message: e.toString(),
          ),
        );
      }
    });
  }
}
