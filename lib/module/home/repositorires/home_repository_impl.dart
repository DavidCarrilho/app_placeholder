import 'dart:convert';

import 'package:app_placeholder/core/models/post_model.dart';
import 'package:app_placeholder/module/home/repositorires/home_repository.dart';
import 'package:flutter/services.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    var value = await rootBundle.loadString('assets/data.json');
    List postJson = jsonDecode(value);
    return postJson.map((e) => PostModel.fromJson(e)).toList();
  }
}
