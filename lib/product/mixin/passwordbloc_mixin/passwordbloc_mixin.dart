import 'package:kuaforum/product/bloc/log_reg_pass_bloc/password_bloc/password_state/password_state.dart';
import 'package:kuaforum/product/model/log_reg_pass_model/password_model/password_model.dart';
import 'package:kuaforum/product/router/log_reg_pass_router/password_router/password_router.dart';

mixin PasswordBlocMixin {
  void userPasswordResetListeneBloc(context, state) {
    PasswordRouterService routerService = PasswordRouterService();
    ResetPasswordServiceModel modelService = ResetPasswordServiceModel();
    if (state is ResetPasswordLoading) {
    } else if (state is ResetPasswordError) {
      routerService.passwordUserErrorDialog(
          context, modelService.emailController);
    } else if (state is ResetPasswordSuccess) {
      routerService.passwordUserSuccessfulDialog(
          context, modelService.emailController);
    }
  }
}
