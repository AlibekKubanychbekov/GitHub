import 'package:pocemon_app/modules/pokemon_dateils/domain/entity/pokemon_details_entity.dart';

abstract class PokemonDetailsRepository {
  Future<PokemonDetailsEntity> fetchPokemonDetails({required int id});
}
