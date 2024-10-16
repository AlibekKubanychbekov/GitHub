import 'package:pocemon_app/modules/all_pokemons/domain/entity/all_pokemons_entity.dart';
import 'package:pocemon_app/modules/all_pokemons/domain/entity/all_pokemons_repository.dart';

class FetchAllPokemonsUsecase {
  final AllPokemonsRepository _repository;

  FetchAllPokemonsUsecase({required AllPokemonsRepository repository})
      : _repository = repository;

  Future<AllPokemonsEntity> execute() {
    return _repository.fetchAllPokemons();
  }
}
