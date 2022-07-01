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
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _homeController.posts,
        builder: (_, list, __) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, index) => ListTile(
              leading: Text(list[index].id.toString()),
              title: Text(list[index].title),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            separatorBuilder: (_, __) => const Divider(),
          );
        },
      ),
    );
  }
}
