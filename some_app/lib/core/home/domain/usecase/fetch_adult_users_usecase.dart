import 'package:some_app/core/home/data/repository/user_repository.dart';
import 'package:some_app/core/home/domain/entity/user_entity.dart';

class FetchAdultUsersUsecase {
  final UserRepository repository;

  FetchAdultUsersUsecase({required this.repository});

  List<UserEntity> fetchAdultUsers() {
    final allUsers = repository.fetchUsers();
    List<UserEntity> users = [];
    allUsers.map((e) {
      if (e.age > 17) {
        users.add(e);
      }
    }).toList();

    return users;
  }
}
