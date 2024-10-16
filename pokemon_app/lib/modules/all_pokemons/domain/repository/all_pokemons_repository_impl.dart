import 'package:dio/dio.dart';
import 'package:pocemon_app/modules/all_pokemons/data/mapper/all_pokemons_mapper.dart';
import 'package:pocemon_app/modules/all_pokemons/data/model/all_pokemons_model.dart';
import 'package:pocemon_app/modules/all_pokemons/domain/entity/all_pokemons_entity.dart';
import 'package:pocemon_app/modules/all_pokemons/domain/entity/all_pokemons_repository.dart';

class AllPokemonsRepositoryImpl implements AllPokemonsRepository {
  final Dio _dio;
  final AllPokemonsMapper _mapper;

  AllPokemonsRepositoryImpl(
      {required Dio dio, required AllPokemonsMapper mapper})
      : _dio = dio,
        _mapper = mapper;

  @override
  Future<AllPokemonsEntity> fetchAllPokemons() async {
    final result = await _dio.get('pokemon');
    final model = AllPokemonsModel.fromJson(result.data);
    return _mapper.map(model: model);
  }
}
