import 'package:some_app/modules/joke/data/model/joke_model.dart';
import 'package:some_app/modules/joke/domain/entity/joke_entity.dart';

class JokeMapper {
  JokeEntity mapModel({required JokeModel model}) {
    return JokeEntity(
      id: model.id,
      joke: model.joke,
      status: model.status,
    );
  }
}
