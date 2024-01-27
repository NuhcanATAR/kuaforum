import 'package:flutter/material.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/favorite_bloc/state/state.dart';

mixin FavoriteBlocMixin {
  void favoriteListenerBloc(context, state) {
    if (state is FavoriteAddSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Favoriye Eklendi"),
          action: SnackBarAction(
            label: "Tamam",
            onPressed: () {},
          ),
          duration: const Duration(
            seconds: 4,
          ),
        ),
      );
    } else if (state is FavoriteRemoveSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Favoriden Kaldırıldı!"),
          action: SnackBarAction(
            label: "Tamam",
            onPressed: () {},
          ),
          duration: const Duration(
            seconds: 4,
          ),
        ),
      );
    } else if (state is FavoriteAddRemoveError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Hata oluştu, Tekrar deneyiniz!"),
          action: SnackBarAction(
            label: "Tamam",
            onPressed: () {},
          ),
          duration: const Duration(
            seconds: 4,
          ),
        ),
      );
    }
  }
}
