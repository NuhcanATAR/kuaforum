import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuaforum/feature/main_view/home/view/post_detail_view/widget/commentinput_widget.dart';
import 'package:kuaforum/feature/main_view/home/view/post_detail_view/widget/commentlist_widget.dart';
import 'package:kuaforum/feature/main_view/home/view/post_detail_view/widget/postcard_widget.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/post_bloc/post_cubit/cubit.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/utility/base/main_view_base/home_base/home_base.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends MainHomeBase<PostDetailView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => PostMainCubit(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: ColorBackgroundConstant.redDarker,
                size: 18,
              ),
            ),
            title: const LabelMediumMainColorText(
              text: "Gönderi Detayı",
              textAlign: TextAlign.center,
            ),
          ),
          body: Form(
            key: postModelService.formPostCommentKey,
            child: ListView(
              children: <Widget>[
                // post card
                buildPostCardWidget(
                  context,
                  widget.data,
                ),
                // comment input
                buildCommentInputWidget,
                // comment list
                buildCommentListWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // post card
  Widget buildPostCardWidget(context, data) => PostCardSubWidget(
        data: data,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // comment input
  Widget get buildCommentInputWidget => CommentInputWidget(
        postModelService: postModelService,
        data: widget.data,
      );
  // comment list
  Widget get buildCommentListWidget => CommentListWidget(
        data: widget.data,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        routerService: routerService,
      );
}
