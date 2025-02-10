
import 'package:test_task/src/features/main/data/datasource/post_remote_data_source.dart';
import 'package:test_task/src/features/main/domain/repository/post_repository.dart';

import '../models/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      return await remoteDataSource.getPosts();
    } catch (e) {
      throw Exception('Error loading posts');
    }
  }
  
  @override
  Future<PostModel> getCurrentPosts(int id) async {
    try {
      return await remoteDataSource.getCurrentPost(id);
    } catch (e) {
      throw Exception('Error loading current post');
    }
  }
}
