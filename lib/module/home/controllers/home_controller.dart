import '../../../core/models/post_model.dart';
import '../repositorires/home_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);

  void fetch() async {
    posts.value = await _homeRepository.getList();
  }
}
