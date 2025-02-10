import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task/src/features/main/data/datasource/post_remote_data_source.dart';
import 'package:test_task/src/features/main/domain/repository/post_repository.dart';
import 'package:test_task/src/features/main/data/repository/post_repository_impl.dart';
import 'package:test_task/src/features/main/domain/usecases/get_current_post_usecase.dart';
import 'package:test_task/src/features/main/domain/usecases/get_posts_usecase.dart';
import 'package:test_task/src/features/main/presentation/bloc/post_bloc.dart';
import 'package:test_task/src/features/main/presentation/page/posts_page.dart';

void main() {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(getIt<Dio>()));

  getIt.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(getIt<PostRemoteDataSource>()));

  getIt.registerLazySingleton<GetPostsUseCase>(
      () => GetPostsUseCase(getIt<PostRepository>()));

  getIt.registerLazySingleton<GetCurrentPostUsecase>(
      () => GetCurrentPostUsecase(getIt<PostRepository>()));

  getIt.registerLazySingleton<PostBloc>(
      () => PostBloc(getIt<GetPostsUseCase>(), getIt<GetCurrentPostUsecase>()));


  runApp(const TestTask());
}


class TestTask extends StatelessWidget {
  const TestTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}