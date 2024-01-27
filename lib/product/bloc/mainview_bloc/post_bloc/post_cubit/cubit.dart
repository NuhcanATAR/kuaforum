import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/post_bloc/post_state/state.dart';
import 'package:kuaforum/product/utility/database/main_view_db/home_db/home_db.dart';
import 'package:kuaforum/product/utility/service/firebase_service.dart';

class PostMainCubit extends Cubit<PostState> {
  PostMainCubit() : super(PostInitial());

  void commentAdd(Map<String, dynamic> data,
      TextEditingController commentController) async {
    try {
      await HomeDB.COMMENTS.userCommentRef.add({
        "ID": null,
        "USERID": FirebaseService().authID,
        "POSTID": data['ID'],
        "COMMENT": commentController.text,
        "DATE": FieldValue.serverTimestamp(),
        "ACTIVE": true,
      }).then((value) {
        late String docID = value.id;
        value.update({"ID": docID});
        commentController.clear();
      });

      emit(PostSuccess());
    } catch (e) {
      emit(PostError());
    }
  }

  void commentDelete(Map<String, dynamic> data) async {
    try {
      await HomeDB.COMMENTS.userCommentRef.doc(data['ID']).delete();
      emit(PostCommentRemoveSuccess());
    } catch (e) {
      emit(PostCommentRemoveError());
    }
  }
}
