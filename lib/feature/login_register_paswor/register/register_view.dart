import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuaforum/feature/login_register_paswor/register/view/registerform_view.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/register_bloc/register_cubit/register_cubit.dart';

import 'package:kuaforum/product/utility/base/log_reg_pass_base/register_base/register_base.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends MainRegisterBase<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthSignUpCubit(),
        child: RegisterForm(
          maxWidth: maxWidth,
          dynamicHeight: dynamicHeight,
          modelService: modelService,
          routerService: routerService,
        ),
      ),
    );
  }
}
