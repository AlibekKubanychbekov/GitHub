import 'package:flutter/material.dart';
import 'package:some_app/core/home/data/mapper/user_mapper.dart';
import 'package:some_app/core/home/data/repository/app_users_repository.dart';
import 'package:some_app/core/home/domain/entity/user_entity.dart';
import 'package:some_app/core/home/domain/usecase/fetch_male_users_usecase.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserEntity> users = [];

  @override
  void initState() {
    final fetchAdultUsersUsecase = FetchMaleUsersUsecase(
        repository: AppUsersRepository(userMapper: UserMapper()));
    users = fetchAdultUsersUsecase.fetchMaleUsers();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) => Text(
              '${users[index].name} ${users[index].surname} ${users[index].age} age')),
    );
  }
}
