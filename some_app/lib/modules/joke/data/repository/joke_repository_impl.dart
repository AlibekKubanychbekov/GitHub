import 'package:dio/dio.dart';
import 'package:some_app/modules/joke/data/mapper/joke_mapper.dart';
import 'package:some_app/modules/joke/data/repository/joke_repository.dart';
import 'package:some_app/modules/joke/data/model/joke_model.dart';
import 'package:some_app/modules/joke/domain/entity/joke_entity.dart';

class JokeRepositoryImpl implements JokeRepository {
  final Dio dio;
  final JokeMapper mapper;

  JokeRepositoryImpl({
    required this.dio,
    required this.mapper,
  });
  @override
  Future<JokeEntity> fetchJoke() async {
    JokeModel jokeModel;
    do {
      final result = await dio.get('https://icanhazdadjoke.com/',
          options: Options(headers: {'Accept': 'application/json'}));
      jokeModel = JokeModel.fromJson(result.data);
    } while (!(jokeModel.joke?.contains('?') ?? false));
    return mapper.mapModel(model: jokeModel);
  }
}
