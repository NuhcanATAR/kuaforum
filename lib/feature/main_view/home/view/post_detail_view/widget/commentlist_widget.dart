import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/post_bloc/post_cubit/cubit.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/post_bloc/post_state/state.dart';
import 'package:kuaforum/product/constants/image_constant.dart';
import 'package:kuaforum/product/mixin/postbloc_mixin/postbloc_mixin.dart';
import 'package:kuaforum/product/utility/database/main_view_db/home_db/home_db.dart';
import 'package:kuaforum/product/utility/service/firebase_service.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class CommentListWidget extends StatelessWidget with PostBlocMixin {
  const CommentListWidget(
      {required this.data,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.routerService,
      super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostMainCubit, PostState>(
      listener: postCommentDeleteListenerBloc,
      builder: (context, state) {
        final PostMainCubit postCubitService =
            BlocProvider.of<PostMainCubit>(context);
        return StreamBuilder<QuerySnapshot>(
          stream: HomeDB.COMMENTS.commentListQuery,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const SizedBox();
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }

            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
              return Column(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> index =
                      document.data()! as Map<String, dynamic>;
                  if (index['POSTID'] != data['ID']) {
                    return const SizedBox();
                  } else {
                    return buildCommentCardWidget(
                        context, index, postCubitService);
                  }
                }).toList(),
              );
            } else {
              return const SizedBox();
            }
          },
        );
      },
    );
  }

  // comment card widget
  Widget buildCommentCardWidget(
          context, Map<String, dynamic> index, postCubitService) =>
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            // profile image
            SizedBox(
              width: 35,
              height: 35,
              child: ProfileImgIconConstant.userIconGrey.toImg,
            ),
            // user name, comment
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: <Widget>[
                    // user name
                    SizedBox(
                      width: maxWidth,
                      child: FutureBuilder<DocumentSnapshot>(
                        future: HomeDB.USERS.userRefTable(index),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const SizedBox();
                          }

                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return const SizedBox();
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> userData =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return LabelMediumBlackBoldText(
                              text:
                                  "${userData['NAME']} ${userData['SURNAME']}",
                              textAlign: TextAlign.left,
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                    // comment
                    SizedBox(
                      width: maxWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: LabelMediumBlackText(
                          text: index['COMMENT'],
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // comment delete
            index['USERID'] == FirebaseService().authID
                ? GestureDetector(
                    onTap: () {
                      routerService.commentDeleteDialog(
                          context, postCubitService, dynamicHeight, index);
                    },
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                      size: 21,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
}
