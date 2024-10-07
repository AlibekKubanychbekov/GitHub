import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void setup() {
  final di = GetIt.instance;
  di.registerSingleton(Dio());
}
