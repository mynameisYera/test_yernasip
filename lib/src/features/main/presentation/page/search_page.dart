import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task/src/core/colors.dart';
import 'package:test_task/src/features/main/presentation/bloc/post_bloc.dart';
import 'package:test_task/src/features/main/presentation/page/posts_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      bloc: GetIt.instance.get<PostBloc>(),
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (viewModel) {
            return Scaffold(
          appBar: AppBar(
              backgroundColor: AppColors.white,
              title: TextField(
              controller: _searchController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                  GetIt.instance.get<PostBloc>().add(PostEvent.getCurrentPost(productId: int.parse(_searchController.text)));
                }, 
                icon: Icon(Icons.arrow_circle_right)),
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
              
            ),
          
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostsPage()));
                  },
                  icon: Icon(Icons.arrow_back_ios))),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                    viewModel.currentCartItems != null ? viewModel.currentCartItems!.image : '',
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: AppColors.bonusText,
                      );
                    },
                    errorWidget: (context, url, error) => SizedBox(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        viewModel.currentCartItems != null ? viewModel.currentCartItems!.title : '',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.only(top: 15),
                    child: Text(viewModel.currentCartItems != null ? viewModel.currentCartItems!.content : ''),
                  )
                ],
              ),
            ),
          ),
        );
          },
          orElse: () {
            return Scaffold(
          appBar: AppBar(
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios))),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBGtGn4UZTYe3VYqM3CpByuPJnS3PpJAmsEmWYWIoziNoqPdl9DfQ2IW_60PtVhsiQX3k&usqp=CAU',
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: AppColors.bonusText,
                      );
                    },
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'No data please try later',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )),
                  
                ],
              ),
            ),
          ),
        );
          },
          
        );
        
      },
    );
  }
}
