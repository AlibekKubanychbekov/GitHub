class PokemonDetailsEntity {
  List<PokemonAbilitiesEntity>? abilities;
  int? baseExperience;
  CriesEntity? cries;
  List<GameIndicesEntity>? gameIndices;
  int? height;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<MovesEntity>? moves;
  String? name;
  int? order;
  PokemonSingleAbilityEntity? species;
  SpritesEntity? sprites;
  List<StatsEntity>? stats;
  List<TypesEntity>? types;
  int? weight;

  PokemonDetailsEntity(
      {required this.abilities,
      required this.baseExperience,
      required this.cries,
      required this.gameIndices,
      required this.height,
      required this.id,
      required this.isDefault,
      required this.locationAreaEncounters,
      required this.moves,
      required this.name,
      required this.order,
      required this.species,
      required this.sprites,
      required this.stats,
      required this.types,
      required this.weight});
}

class PokemonAbilitiesEntity {
  PokemonSingleAbilityEntity? ability;
  bool? isHidden;
  int? slot;

  PokemonAbilitiesEntity({this.ability, this.isHidden, this.slot});
}

class PokemonSingleAbilityEntity {
  String? name;
  String? url;

  PokemonSingleAbilityEntity({this.name, this.url});
}

class CriesEntity {
  String? latest;
  String? legacy;

  CriesEntity({this.latest, this.legacy});
}

class GameIndicesEntity {
  int? gameIndex;
  PokemonSingleAbilityEntity? version;

  GameIndicesEntity({this.gameIndex, this.version});
}

class MovesEntity {
  PokemonSingleAbilityEntity? move;

  MovesEntity({
    this.move,
  });
}

class SpritesEntity {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;
  Other? other;

  SpritesEntity({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });
}

class Other {
  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;
  Showdown? showdown;

  Other({this.dreamWorld, this.home, this.officialArtwork, this.showdown});
}

class DreamWorld {
  String? frontDefault;
  String? frontFemale;

  DreamWorld({this.frontDefault, this.frontFemale});
}

class Home {
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  Home(
      {this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale});
}

class OfficialArtwork {
  String? frontDefault;
  String? frontShiny;

  OfficialArtwork({this.frontDefault, this.frontShiny});
}

class Showdown {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  Showdown(
      {this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale});
}

class StatsEntity {
  int? baseStat;
  int? effort;
  PokemonSingleAbilityEntity? stat;

  StatsEntity({this.baseStat, this.effort, this.stat});
}

class TypesEntity {
  int? slot;
  PokemonSingleAbilityEntity? type;

  TypesEntity({this.slot, this.type});
}
