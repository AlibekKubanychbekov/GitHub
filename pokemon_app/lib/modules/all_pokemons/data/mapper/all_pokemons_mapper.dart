import 'package:pocemon_app/modules/all_pokemons/data/model/all_pokemons_model.dart';
import 'package:pocemon_app/modules/all_pokemons/domain/entity/all_pokemons_entity.dart';

class AllPokemonsMapper {
  AllPokemonsEntity map({required AllPokemonsModel model}) {
    return AllPokemonsEntity(
        count: model.count,
        next: model.next,
        previous: model.previous,
        results: model.results?.map((e) => _mapItem(model: e)).toList());
  }

  AllPokemonsItemEntity _mapItem({required AllPokemonsItemModel model}) {
    return AllPokemonsItemEntity(name: model.name, url: model.url);
  }
}
