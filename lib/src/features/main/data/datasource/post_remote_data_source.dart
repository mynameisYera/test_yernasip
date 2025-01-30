import 'package:dio/dio.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
  Future<PostModel> getCurrentPost(int id);
}


class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await dio.get('https://jsonplaceholder.org/posts');
    return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
  }

  @override
  Future<PostModel> getCurrentPost(int id) async {
    final response = await dio.get('https://jsonplaceholder.org/posts/$id');
    return PostModel.fromJson(response.data);
  }
}
