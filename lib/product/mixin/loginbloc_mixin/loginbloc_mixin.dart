import 'package:flutter/material.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/login_bloc/login_state/login_state.dart';
import 'package:kuaforum/product/router/log_reg_pass_router/login_router/login_router.dart';

mixin LoginBlocMixin {
  LoginRouterService routerService = LoginRouterService();
  void loginListenerBloc(context, state) {
    if (state is LoginLoading) {
    } else if (state is LoginError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } else if (state is LoginSuccess) {
      routerService.loginLoadingViewRouter(context);
    } else if (state is LoginUserNotFound) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } else if (state is LoginWrongPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } else if (state is LoginInvalidEmail) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } else if (state is LoginTooManyRequest) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
