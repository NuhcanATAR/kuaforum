import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/post_bloc/post_cubit/cubit.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/post_bloc/post_state/state.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/constants/image_constant.dart';
import 'package:kuaforum/product/mixin/postbloc_mixin/postbloc_mixin.dart';

class CommentInputWidget extends StatelessWidget with PostBlocMixin {
  const CommentInputWidget(
      {required this.postModelService, required this.data, super.key});

  final Map<String, dynamic> data;
  final dynamic postModelService;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostMainCubit, PostState>(
      listener: postCommentAddListenerBloc,
      builder: (context, state) {
        final PostMainCubit postCubitService =
            BlocProvider.of<PostMainCubit>(context);
        return Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 15),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 30,
                height: 30,
                child: ProfileImgIconConstant.userIcon.toImg,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: TextFormField(
                    controller: postModelService.commentController,
                    validator: postModelService.commentValidator,
                    style: GoogleFonts.nunito(
                      textStyle:
                          context.general.textTheme.labelMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Yorum yap",
                      hintStyle: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.labelMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (postModelService.formPostCommentKey.currentState!
                      .validate()) {
                    postCubitService.commentAdd(
                        data, postModelService.commentController);
                  }
                },
                child: Icon(
                  Icons.send,
                  color: ColorBackgroundConstant.redDarker,
                  size: 21,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
