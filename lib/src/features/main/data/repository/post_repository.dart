import '../models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
  Future<PostModel> getCurrentPosts(int id);

}
