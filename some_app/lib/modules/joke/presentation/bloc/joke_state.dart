import 'package:some_app/modules/joke/domain/entity/joke_entity.dart';

abstract class JokeState {}

class JokeInitState extends JokeState {}

class JokeLoadingState extends JokeState {}

class JokeSuccesState extends JokeState {
  final JokeEntity joke;

  JokeSuccesState({required this.joke});
}

class JokeErrorState extends JokeState {}
