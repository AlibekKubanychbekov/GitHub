import 'package:pocemon_app/modules/pokemon_dateils/data/model/pokemon_details_model.dart';
import 'package:pocemon_app/modules/pokemon_dateils/domain/entity/pokemon_details_entity.dart';

class PokemonDetailsMapper {
  PokemonDetailsEntity map(PokemonDetailsModel model) {
    return PokemonDetailsEntity(
        abilities:
            model.abilities?.map((e) => _mapPokemonAbilities(e)).toList(),
        baseExperience: model.baseExperience,
        cries: _mapCries(model.cries ?? CriesModel()),
        gameIndices: model.gameIndices?.map((e) => _mapGameIndices(e)).toList(),
        height: model.height,
        id: model.id,
        isDefault: model.isDefault,
        locationAreaEncounters: model.locationAreaEncounters,
        moves: model.moves?.map((e) => _mapMoves(e)).toList(),
        name: model.name,
        order: model.order,
        species: _mapPokemonSingleAbility(PokemonSingleAbilityModel(
          name: '',
          url: '',
        )),
        sprites: _mapSprites(model.sprites ?? SpritesModel()),
        stats: model.stats?.map((e) => _mapStats(e)).toList(),
        types: model.types?.map((e) => _mapTypes(e)).toList(),
        weight: model.weight);
  }

  TypesEntity _mapTypes(TypesModel model) {
    return TypesEntity(
        slot: model.slot,
        type: _mapPokemonSingleAbility(model.type ??
            PokemonSingleAbilityModel(
              name: '',
              url: '',
            )));
  }

  StatsEntity _mapStats(StatsModel model) {
    return StatsEntity(
        baseStat: model.baseStat,
        effort: model.effort,
        stat: _mapPokemonSingleAbility(model.stat ??
            PokemonSingleAbilityModel(
              name: '',
              url: '',
            )));
  }

  SpritesEntity _mapSprites(SpritesModel model) {
    return SpritesEntity(
      backDefault: model.backDefault,
      backFemale: model.backFemale,
      backShiny: model.backShiny,
      backShinyFemale: model.backShinyFemale,
      frontDefault: model.frontDefault,
      frontFemale: model.frontFemale,
      frontShiny: model.frontShiny,
      frontShinyFemale: model.frontShinyFemale,
    );
  }

  MovesEntity _mapMoves(MovesModel model) {
    return MovesEntity(
      move: _mapPokemonSingleAbility(model.move ??
          PokemonSingleAbilityModel(
            name: '',
            url: '',
          )),
    );
  }

  GameIndicesEntity _mapGameIndices(GameIndicesModel model) {
    return GameIndicesEntity(
        gameIndex: model.gameIndex,
        version: _mapPokemonSingleAbility(model.version ??
            PokemonSingleAbilityModel(
              name: '',
              url: '',
            )));
  }

  PokemonSingleAbilityEntity _mapPokemonSingleAbility(
      PokemonSingleAbilityModel model) {
    return PokemonSingleAbilityEntity(name: model.name, url: model.url);
  }

  CriesEntity _mapCries(CriesModel model) {
    return CriesEntity(latest: model.latest, legacy: model.legacy);
  }

  PokemonAbilitiesEntity _mapPokemonAbilities(PokemonAbilitiesModel model) {
    return PokemonAbilitiesEntity(
      ability: _mapPokemonSingleAbility(
          model.ability ?? PokemonSingleAbilityModel(name: '', url: '')),
      isHidden: model.isHidden,
      slot: model.slot,
    );
  }
}
