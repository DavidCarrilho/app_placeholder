import 'package:app_placeholder/services/prefs_service.dart';

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
        title: Text('Home'.toUpperCase()),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Sair',
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context).pushReplacementNamed('/login');
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _homeController.posts,
        builder: (_, list, __) {
          if (list.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (_, index) => ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                leading: Text(list[index].id.toString()),
                title: Text(list[index].title),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.of(context).pushNamed('/details', arguments: list[index]),
              ),
              separatorBuilder: (_, __) => const Divider(),
            );
          }
        },
      ),
    );
  }
}
