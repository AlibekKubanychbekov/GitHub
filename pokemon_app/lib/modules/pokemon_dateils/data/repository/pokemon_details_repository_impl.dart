import 'package:dio/dio.dart';
import 'package:pocemon_app/modules/pokemon_dateils/data/mapper/pokemon_details_mapper.dart';
import 'package:pocemon_app/modules/pokemon_dateils/data/model/pokemon_details_model.dart';
import 'package:pocemon_app/modules/pokemon_dateils/domain/entity/pokemon_details_entity.dart';
import 'package:pocemon_app/modules/pokemon_dateils/domain/repository/pokemon_details_repository.dart';

class PokemonDetailsRepositoryImpl implements PokemonDetailsRepository {
  final Dio _dio;
  final PokemonDetailsMapper _mapper;

  PokemonDetailsRepositoryImpl(
      {required Dio dio, required PokemonDetailsMapper mapper})
      : _dio = dio,
        _mapper = mapper;

  @override
  Future<PokemonDetailsEntity> fetchPokemonDetails({required int id}) async {
    final result = await _dio.get('pokemon/$id');
    final model = PokemonDetailsModel.fromJson(result.data);
    return _mapper.map(model);
  }
}
