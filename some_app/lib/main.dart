import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_app/modules/joke/data/mapper/joke_mapper.dart';
import 'package:some_app/modules/joke/data/repository/joke_repository_impl.dart';
import 'package:some_app/modules/joke/domain/usecase/fetch_joke_usecase.dart';
import 'package:some_app/modules/joke/presentation/bloc/joke_bloc.dart';
import 'package:some_app/modules/joke/presentation/joke_screen.dart';

void main() {
  runApp(const SomeApp());
}

class SomeApp extends StatelessWidget {
  const SomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JokeBloc(
          fetchJokeUsecase: FetchJokeUsecase(
              repository:
                  JokeRepositoryImpl(dio: Dio(), mapper: JokeMapper()))),
      child: const MaterialApp(
        home: JokeScreen(),
      ),
    );
  }
}
