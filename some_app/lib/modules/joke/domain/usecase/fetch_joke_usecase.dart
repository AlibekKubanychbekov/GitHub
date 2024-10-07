import 'package:some_app/modules/joke/data/repository/joke_repository.dart';
import 'package:some_app/modules/joke/domain/entity/joke_entity.dart';

class FetchJokeUsecase {
  final JokeRepository repository;

  FetchJokeUsecase({required this.repository});

  Future<JokeEntity> fetchJoke() async {
    return await repository.fetchJoke();
  }
}
