import 'package:some_app/modules/joke/domain/entity/joke_entity.dart';

abstract class JokeRepository {
  Future<JokeEntity> fetchJoke();
}
