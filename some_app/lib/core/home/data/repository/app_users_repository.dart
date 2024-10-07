import 'package:some_app/core/home/data/mapper/user_mapper.dart';
import 'package:some_app/core/home/data/model/user.dart';
import 'package:some_app/core/home/data/repository/user_repository.dart';
import 'package:some_app/core/home/domain/entity/user_entity.dart';

var data = [
  UserModel(name: 'Samat', surname: 'Alibekov', age: 34, gender: 'male'),
  UserModel(name: 'Arnella', surname: 'Tostokova', age: 22, gender: 'female'),
  UserModel(name: 'Dima', surname: 'Bilan', age: 31, gender: 'male'),
  UserModel(name: 'Hasan', surname: 'Abdullaev', age: 14, gender: 'male'),
  UserModel(name: 'Dastan', surname: 'Tekebaev', age: 12, gender: 'male'),
  UserModel(name: 'Anton', surname: 'Tscherbakov', age: 10, gender: 'male'),
];

class AppUsersRepository implements UserRepository {
  final UserMapper userMapper;

  AppUsersRepository({required this.userMapper});
  @override
  List<UserEntity> fetchUsers() {
    return data.map((e) => userMapper.map(model: e)).toList();
  }
}
