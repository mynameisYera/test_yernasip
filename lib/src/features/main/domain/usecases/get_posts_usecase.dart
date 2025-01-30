
import 'package:test_task/src/features/main/data/models/post_model.dart';
import 'package:test_task/src/features/main/data/repository/post_repository.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<List<PostModel>> call() async {
    return await repository.getPosts();
  }


}
