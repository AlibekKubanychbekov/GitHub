import 'package:some_app/core/home/data/repository/app_users_repository.dart';
import 'package:some_app/core/home/domain/entity/user_entity.dart';

class FetchMaleUsersUsecase {
  final AppUsersRepository repository;
  FetchMaleUsersUsecase({required this.repository});

  List<UserEntity> fetchMaleUsers() {
    final allUsers = repository.fetchUsers();
    List<UserEntity> maleUsers = [];
    allUsers.map((e) {
      if (e.gender == 'male') {
        maleUsers.add(e);
      }
    }).toList();

    return maleUsers;
  }
}
