import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_app/modules/joke/theme/app_assets.dart';
import 'package:some_app/modules/joke/theme/app_colorstyle.dart';
import 'package:some_app/modules/joke/theme/app_textstyle.dart';
import 'package:some_app/modules/joke/presentation/bloc/joke_bloc.dart';
import 'package:some_app/modules/joke/presentation/bloc/joke_event.dart';
import 'package:some_app/modules/joke/presentation/bloc/joke_state.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({
    super.key,
  });

  @override
  State<JokeScreen> createState() => _JokeScreenState(Dio());
}

class _JokeScreenState extends State<JokeScreen> {
  final Dio dio;
  List<String> parts = [];
  String text = '';
  bool showAfterQuestionMark = false;

  _JokeScreenState(this.dio);

  @override
  // void initState() {
  //   super.initState();
  //   fetchJoke();
  // }

  // Future<void> fetchJoke() async {
  //   JokeModel jokeModel;
  //   do {
  //     final result = await dio.get('https://icanhazdadjoke.com/',
  //         options: Options(headers: {'Accept': 'application/json'}));
  //     jokeModel = JokeModel.fromJson(result.data);
  //   } while (!(jokeModel.joke?.contains('?') ?? false));

  //   setState(() {
  //     parts = jokeModel.joke?.split('?') ?? [];
  //     text = jokeModel.joke ?? '';
  //     showAfterQuestionMark ? parts[0] : parts[1];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColorstyle.jokeBGColor,
          title: const Text(
            'DAD JOKES',
            style: TextStyle(
              color: AppColorstyle.jokeTextColor,
              fontWeight: FontWeight.w300,
            ),
          )),
      backgroundColor: AppColorstyle.jokeBGColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: 350,
                height: 371,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(AppAssets.unSplash),
                        opacity: 0.4,
                        fit: BoxFit.fitHeight),
                    color: AppColorstyle.jokeContColor,
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xff2D2E53),
                        // Color(0xff3B3C6C),
                        Color(0xff262749),
                        Color(0xff2A2354),
                        // Color(0xff342F6C),
                        Color(0xff201C3E),
                        Color(0xff15283A),
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: AppColorstyle.jokeButtonColor,
                          blurRadius: 9,
                          spreadRadius: 2,
                          blurStyle: BlurStyle.inner),
                    ],
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<JokeBloc, JokeState>(
                      builder: (context, state) {
                        if (state is JokeLoadingState) {
                          return const CircularProgressIndicator.adaptive(
                            backgroundColor: AppColorstyle.jokeTextColor,
                          );
                        }
                        if (state is JokeSuccesState) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(state.joke.joke ?? '${parts[0]}?',
                                    textAlign: TextAlign.center,
                                    style: AppTextstyles.s18w500.copyWith(
                                        color: AppColorstyle.jokeTextColor)),
                              ),
                              if (showAfterQuestionMark)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    parts.length > 1 ? parts[1] : '',
                                    textAlign: TextAlign.center,
                                    style: AppTextstyles.s18w500.copyWith(
                                        color: AppColorstyle.jokeTextColor),
                                  ),
                                ),
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        context.read<JokeBloc>().add(FetchJokeEvent());
                        setState(() {
                          showAfterQuestionMark = !showAfterQuestionMark;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          backgroundColor: AppColorstyle.jokeButtonClr),
                      child: Text(
                        showAfterQuestionMark ? 'FETCH JOKE' : 'SHOW ANSWER',
                        style: AppTextstyles.s17w600
                            .copyWith(color: AppColorstyle.jokeBGColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
