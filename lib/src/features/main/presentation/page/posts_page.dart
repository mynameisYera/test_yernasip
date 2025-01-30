import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task/src/core/colors.dart';
import 'package:test_task/src/features/main/presentation/bloc/post_bloc.dart';
import 'package:test_task/src/features/main/presentation/page/search_page.dart';
import 'package:test_task/src/features/main/presentation/widgets/custom_post_tile.dart';
import 'package:test_task/src/features/main/presentation/page/post_detail_page.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();

  
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    GetIt.instance.get<PostBloc>().add(PostEvent.getPosts());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      bloc: GetIt.instance.get<PostBloc>(),
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return Scaffold(
              body: Container(),
            ); 
          },
          loading: () {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColors.bonusText,
                ),
              ),
            );
          },
          loaded: (viewModel) {
            return Scaffold(
              appBar: AppBar(title: Text('All posts'), actions: [
                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                }, icon: Icon(Icons.search))
              ]),
              body: ListView.builder(
                itemCount: viewModel.cartItems != null ? viewModel.cartItems!.length : 0,
                itemBuilder: (context, index) {
                  String title = viewModel.cartItems![index].title.substring(0, 10);
                  return CustomPostTile(
                    title: title,
                    id: viewModel.cartItems![index].id,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PostDetailPage(
                                id: viewModel.cartItems![index].id,
                              )));
                    },
                  );
                },
              ),
            );  
          },
          initial: () {
            return Scaffold(
              body: Container(),
            );
          },
        );
        
      },
    );
  }
}
