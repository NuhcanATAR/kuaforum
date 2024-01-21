import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kuaforum/feature/login_register_paswor/login/view/loginform_view.dart';

import 'package:kuaforum/product/bloc/log_reg_pass_bloc/login_bloc/login_cubit/login_cubit.dart';

import 'package:kuaforum/product/utility/base/log_reg_pass_base/login_base/login_base.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends MainLoginBase<LoginView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginFormView(),
      ),
    );
  }
}
