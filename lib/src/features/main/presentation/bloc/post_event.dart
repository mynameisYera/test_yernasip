part of 'post_bloc.dart';

@freezed
class PostEvent with _$PostEvent {
  const factory PostEvent.getPosts() = _GetPosts;
  const factory PostEvent.getCurrentPost({required int productId}) = _GetCurrentPost;
}
