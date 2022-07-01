import 'package:app_placeholder/core/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}