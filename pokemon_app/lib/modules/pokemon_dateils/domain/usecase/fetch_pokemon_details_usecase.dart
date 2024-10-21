import 'package:pocemon_app/modules/pokemon_dateils/domain/entity/pokemon_details_entity.dart';
import 'package:pocemon_app/modules/pokemon_dateils/domain/repository/pokemon_details_repository.dart';

class FetchPokemonDetailsUsecase {
  final PokemonDetailsRepository _repository;

  FetchPokemonDetailsUsecase({required PokemonDetailsRepository repository})
      : _repository = repository;

  Future<PokemonDetailsEntity> execute({required int id}) {
    return _repository.fetchPokemonDetails(id: id);
  }
}
