import 'package:flutter/material.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/post_bloc/post_state/state.dart';

mixin PostBlocMixin {
  void postCommentAddListenerBloc(context, state) {
    if (state is PostSuccess) {
      final snackBar = SnackBar(
        content: const Text("Yorum paylaşıldı!"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(seconds: 4),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is PostError) {
      final snackBar = SnackBar(
        content: const Text("Hata oluştu, Tekrar deneyiniz!"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(seconds: 4),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void postCommentDeleteListenerBloc(context, state) {
    if (state is PostCommentRemoveSuccess) {
      final snackBar = SnackBar(
        content: const Text("Yorum Kaldırıldı"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(seconds: 4),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is PostCommentRemoveError) {
      final snackBar = SnackBar(
        content: const Text("Hata oluştu, Tekrar deneyiniz!"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(seconds: 4),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
