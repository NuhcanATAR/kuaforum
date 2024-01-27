import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/login_register_paswor/register/widget/email_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/register/widget/loginbtn_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/register/widget/namesurname_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/register/widget/password_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/register/widget/registerbtn_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/widget/logregpass_titlesubtitle_widget.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/register_bloc/register_cubit/register_cubit.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/register_bloc/register_state/register_state.dart';

import 'package:kuaforum/product/enums/logregpass_enums/register_enums.dart';
import 'package:kuaforum/product/mixin/registerbloc_mixin/registerbloc_mixin.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class RegisterForm extends StatelessWidget with RegisterBlocMixin {
  const RegisterForm(
      {required this.maxWidth,
      required this.dynamicHeight,
      required this.modelService,
      required this.routerService,
      super.key});

  final dynamic modelService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    final AuthSignUpCubit authCubit = BlocProvider.of<AuthSignUpCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildRegisterBodyWidget(context, authCubit),
    );
  }

  // main body widget
  Widget buildRegisterBodyWidget(context, authCubit) =>
      BlocConsumer<AuthSignUpCubit, AuthState>(
        listener: registerUserListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formRegisterKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // title & sub title
                  buildTitleSubTitleWidget,
                  // name surname
                  buildNameSurnameWiget(context, context.general),
                  // email
                  buildEmailWidget(context, context.general),
                  // password
                  buildPasswordWidget(context, context.general),
                  // register button
                  builRegisterButtonWidget(context, authCubit),
                  // or
                  builOrWiget,
                  // login
                  buildLoginWidget(context),
                ],
              ),
            ),
          );
        },
      );

  // title & sub title
  Widget get buildTitleSubTitleWidget =>
      LoginRegisterPasswordTitleSubTitleWidget(
        title: RegisterStrings.titleText.value,
        subTitle: RegisterStrings.subTitleText.value,
      );

  // name surname
  Widget buildNameSurnameWiget(context, contextkartal) => NameSurnameWidget(
        contextkartal: contextkartal,
        modelService: modelService,
      );

  // email
  Widget buildEmailWidget(context, contextkartal) => EmailWidget(
        contextkartal: contextkartal,
        modelService: modelService,
      );

  // password
  Widget buildPasswordWidget(context, contextkartal) => PasswordWidget(
        contextkartal: contextkartal,
        modelService: modelService,
      );

  // register button
  Widget builRegisterButtonWidget(context, authCubit) => RegisterButtonWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        modelService: modelService,
        authCubit: authCubit,
      );
  // or
  Widget get builOrWiget => const Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: LabelMediumGreyText(
          text: "veya",
          textAlign: TextAlign.center,
        ),
      );
  // login
  Widget buildLoginWidget(context) => LoginButtonWidget(
        routerService: routerService,
      );
}
