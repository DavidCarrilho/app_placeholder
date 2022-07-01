import 'dart:developer' as developer;

import 'package:dio/dio.dart';

import '../../../core/models/post_model.dart';
import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  Dio dio = Dio();

  @override
  Future<List<PostModel>> getList() async {
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
      developer.log('$response');
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      developer.log('$e');
    }
    return [];
  }
}
