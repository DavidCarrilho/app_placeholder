import '../../../core/models/post_model.dart';
import '../controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../repositorires/home_repository_impl.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder<List<PostModel>>(
              valueListenable: _homeController.posts,
              builder: (_, list, __) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (_, index) => ListTile(
                    title: Text(list[index].title),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
