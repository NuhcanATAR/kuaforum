import 'package:flutter/material.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/completeprofile_bloc/cprofile_state/cprofile_state.dart';
import 'package:kuaforum/product/router/main_view_router/completeprofile_router/completeprofile_router.dart';

mixin ProfileCompleteBlocMixin {
  ProfileCompleteRouterService routerService = ProfileCompleteRouterService();
  void profileAuthListeneBloc(context, state) {
    if (state is AuthSuccessProfile) {
      routerService.loginLoadingViewNavigatorRouter(context);
    } else if (state is AuthProfileError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Hata Oluştu, Daha Sonra Tekrar Deneyiniz."),
          action: SnackBarAction(
            label: "Tamam",
            onPressed: () {},
          ),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }
}
