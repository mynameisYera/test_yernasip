import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/src/features/main/data/models/post_model.dart';
import 'package:test_task/src/features/main/domain/usecases/get_current_post_usecase.dart';
import 'package:test_task/src/features/main/domain/usecases/get_posts_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostsUseCase getPostsUseCase;
  final GetCurrentPostUsecase getCurrentPostUsecase;


  PostBloc(this.getPostsUseCase, this.getCurrentPostUsecase) : super(const PostState.initial()) {
    on<PostEvent>(_onEventHandler);
  }

  Future<void> _onEventHandler(PostEvent event, Emitter<PostState> emit) async {
    await event.when(
      getPosts: () => _getPosts(emit),
      getCurrentPost: (_) => _getCurrentPost(emit, event as _GetCurrentPost)
    );
  }

  Future<void> _getPosts(Emitter<PostState> emit) async {
    emit(const PostState.loading());
    try {
      final posts = await getPostsUseCase();
      print(posts);
      emit(PostState.loaded(viewModel: PostViewModel(cartItems: posts)));
    } catch (e) {
      emit(const PostState.loadingFaliure());
    }
  }


  Future<void> _getCurrentPost(Emitter<PostState> emit, _GetCurrentPost event) async {
    emit(const PostState.loading());
    try {
      final posts = await getCurrentPostUsecase.call(event.productId);
      print(posts);
      emit(PostState.loaded(viewModel: PostViewModel(
        currentCartItems: posts
      )));
    } catch (e) {
      emit(const PostState.loadingFaliure());
    }
  }
}