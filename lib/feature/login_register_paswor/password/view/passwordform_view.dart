import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/login_register_paswor/password/widget/mail_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/password/widget/resetpasswordbutton_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/widget/logregpass_titlesubtitle_widget.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/password_bloc/password_cubit/password_cubit.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/password_bloc/password_state/password_state.dart';

import 'package:kuaforum/product/enums/logregpass_enums/password_enums.dart';

class PasswordFormView extends StatelessWidget {
  const PasswordFormView(
      {required this.modelService,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.routerService,
      super.key});

  final dynamic modelService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    final ResetPasswordCubit resetPasswordCubit =
        BlocProvider.of<ResetPasswordCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordLoading) {
          } else if (state is ResetPasswordError) {
            routerService.passwordUserErrorDialog(
                context, modelService.emailController);
          } else if (state is ResetPasswordSuccess) {
            routerService.passwordUserSuccessfulDialog(
                context, modelService.emailController);
          }
        },
        builder: (context, state) {
          return Form(
            key: modelService.formResPassKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // title & sub title
                  buildTitleSubTitleWidget,
                  // email
                  buildEmailWidget(context, context.general),
                  // reset button
                  builResetButtonWidget(context, resetPasswordCubit),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // title & sub title
  Widget get buildTitleSubTitleWidget =>
      LoginRegisterPasswordTitleSubTitleWidget(
        title: PasswordStrings.titleText.value,
        subTitle: PasswordStrings.subTitleText.value,
      );

  // email
  Widget buildEmailWidget(context, contextkartal) => PasswordMailWidget(
        modelService: modelService,
        contextkartal: contextkartal,
      );

  // reset button
  Widget builResetButtonWidget(context, resetPasswordCubit) =>
      ResetPasswordButtonWidget(
        modelService: modelService,
        resetPasswordCubit: resetPasswordCubit,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
