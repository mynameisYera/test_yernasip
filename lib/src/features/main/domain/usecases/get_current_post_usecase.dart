import 'package:test_task/src/features/main/data/models/post_model.dart';
import 'package:test_task/src/features/main/domain/repository/post_repository.dart';

class GetCurrentPostUsecase {
  final PostRepository repository;

  GetCurrentPostUsecase(this.repository);

  Future<PostModel> call(int id) async {
    return await repository.getCurrentPosts(id);
  }
}
