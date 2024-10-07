import 'package:some_app/core/home/data/model/user.dart';
import 'package:some_app/core/home/domain/entity/user_entity.dart';

class UserMapper {
  UserEntity map({required UserModel model}) {
    return UserEntity(
      name: model.name,
      surname: model.surname,
      age: model.age,
      gender: model.gender,
    );
  }
}
