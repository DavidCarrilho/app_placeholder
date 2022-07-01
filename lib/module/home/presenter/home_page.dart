import 'package:app_placeholder/core/models/post_model.dart';
import 'package:app_placeholder/module/home/controllers/home_controller.dart';
import 'package:app_placeholder/module/home/repositorires/home_repository_impl.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController(HomeRepositoryImpl());

  @override
  void initState() {
    super.initState();
    _homeController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _homeController.posts,
        builder: (_, list, __) {
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(list[index].title),
            ),
          );
        },
      ),
    );
  }
}
