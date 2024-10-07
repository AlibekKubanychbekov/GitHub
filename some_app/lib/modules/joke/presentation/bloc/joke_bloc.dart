import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_app/modules/joke/domain/usecase/fetch_joke_usecase.dart';
import 'package:some_app/modules/joke/presentation/bloc/joke_event.dart';
import 'package:some_app/modules/joke/presentation/bloc/joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final FetchJokeUsecase fetchJokeUsecase;
  JokeBloc({required this.fetchJokeUsecase}) : super(JokeInitState()) {
    on<FetchJokeEvent>((event, emit) async {
      emit(JokeLoadingState());
      try {
        final result = await fetchJokeUsecase.fetchJoke();
        emit(JokeSuccesState(joke: result));
      } catch (e) {
        emit(JokeErrorState());
      }
    });
  }
}
