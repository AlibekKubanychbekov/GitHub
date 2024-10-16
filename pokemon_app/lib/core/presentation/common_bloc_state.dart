import 'package:pocemon_app/core/enums/state_status.dart';

class CommonBlocState<T> {
  final StateStatus status;
  final T? model;
  final String? message;

  CommonBlocState({
    required this.status,
    this.model,
    this.message,
  });
}
