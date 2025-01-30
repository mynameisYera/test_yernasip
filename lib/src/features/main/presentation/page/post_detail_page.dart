import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task/src/core/colors.dart';
import 'package:test_task/src/features/main/presentation/bloc/post_bloc.dart';
import 'package:test_task/src/features/main/presentation/page/posts_page.dart';

class PostDetailPage extends StatefulWidget {
  final int id;
  const PostDetailPage({super.key, required this.id});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    GetIt.instance.get<PostBloc>().add(PostEvent.getCurrentPost(productId: widget.id));
    super.initState();
  }
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
                    viewModel.currentCartItems != null ? viewModel.currentCartItems!.image : 'no data',
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
                        viewModel.currentCartItems != null ? viewModel.currentCartItems!.title : 'no data',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.only(top: 15),
                    child: Text(viewModel.currentCartItems != null ? viewModel.currentCartItems!.content : 'no data'),
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
                        'https://dummyimage.com/800x430/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org',
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
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.only(top: 15),
                    child: Text(
                        'Ante taciti nulla sit libero orci sed nam. Sagittis suspendisse gravida ornare iaculis cras nullam varius ac ullamcorper. Nunc euismod hendrerit netus ligula aptent potenti. Aliquam volutpat nibh scelerisque at. Ipsum molestie phasellus euismod sagittis mauris, erat ut. Gravida morbi, sagittis blandit quis ipsum mi mus semper dictum amet himenaeos. Accumsan non congue praesent interdum habitasse turpis orci. Ante curabitur porttitor ullamcorper sagittis sem donec, inceptos cubilia venenatis ac. Augue fringilla sodales in ullamcorper enim curae; rutrum hac in sociis! Scelerisque integer varius et euismod aenean nulla. Quam habitasse risus nullam enim. Ultrices etiam viverra mattis aliquam? Consectetur velit vel volutpat eget curae;. Volutpat class mus elementum pulvinar! Nisi tincidunt volutpat consectetur. Primis morbi pulvinar est montes diam himenaeos duis elit est orci. Taciti sociis aptent venenatis dui malesuada dui justo faucibus primis consequat volutpat. Rhoncus ante purus eros nibh, id et hendrerit pellentesque scelerisque vehicula sollicitudin quam. Hac class vitae natoque tortor dolor dui praesent suspendisse. Vehicula euismod tincidunt odio platea aenean habitasse neque ad proin. Bibendum phasellus enim fames risus eget felis et sem fringilla etiam. Integer.'),
                  )
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
