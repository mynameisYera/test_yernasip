
part of 'post_bloc.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.initial() = _Initial;
  const factory PostState.loading() = _Loading;
  const factory PostState.loadingFaliure() = _LoadingFailure;
  const factory PostState.loaded({required PostViewModel viewModel}) = _Loaded;
}


@freezed
class PostViewModel with _$PostViewModel {
  factory PostViewModel({
    List<PostModel>? cartItems,
    PostModel? currentCartItems,
  }) = _PostViewModel;
}