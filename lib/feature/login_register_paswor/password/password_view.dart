import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kuaforum/feature/login_register_paswor/password/view/passwordform_view.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/password_bloc/password_cubit/password_cubit.dart';

import 'package:kuaforum/product/utility/base/log_reg_pass_base/password_base/password_base.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({super.key});

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends MainPasswordBase<PasswordView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ResetPasswordCubit(),
        child: PasswordFormView(
          modelService: modelService,
          maxWidth: maxWidth,
          dynamicHeight: dynamicHeight,
          routerService: routerService,
        ),
      ),
    );
  }
}
