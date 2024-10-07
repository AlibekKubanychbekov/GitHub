import 'package:some_app/core/home/domain/entity/user_entity.dart';

abstract class UserRepository {
  List<UserEntity> fetchUsers();
}

// class NewUserRepository implements UserRepository {
//   @override
//   List<UserModel> fetchUsers() {
//     throw UnimplementedError();
//   }
// }

// class OldUserRepository implements UserRepository {
//   @override
//   List<UserModel> fetchUsers() {
//     throw UnimplementedError();
//   }
// }

// class Fetcher {
//   final UserRepository repo;

//   Fetcher({required this.repo});
// }
