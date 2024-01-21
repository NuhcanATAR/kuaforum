import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/login_register_paswor/login/widget/loginbutton_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/login/widget/mail_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/login/widget/registerbutton_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/widget/logregpass_titlesubtitle_widget.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/login_bloc/login_cubit/login_cubit.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/login_bloc/login_state/login_state.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/logregpass_enums/login_enums.dart';
import 'package:kuaforum/product/utility/base/log_reg_pass_base/login_base/login_base.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFormView extends StatefulWidget {
  const LoginFormView({super.key});

  @override
  State<LoginFormView> createState() => _LoginFormViewState();
}

class _LoginFormViewState extends MainLoginBase<LoginFormView> {
  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
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
        },
        builder: (context, state) {
          return Form(
            key: modelService.formLoginKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // title & sub title
                  buildTitleSubTitleWidget,
                  // email
                  buildEmailWidget(context, context.general),
                  // password
                  buildPasswordWidget(context, context.general),
                  // forgot password
                  buildForgotPasswordWidget(context),
                  // login button
                  builLoginButtonWidget(loginCubit, context),
                  // or
                  builOrWiget,
                  // register
                  buildRegisterWidget(context),
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
        title: LoginStrings.titleText.value,
        subTitle: LoginStrings.subTitleText.value,
      );

  // email
  Widget buildEmailWidget(context, contextkartal) => LoginMailWidget(
        contextkartal: contextkartal,
        modelService: modelService,
      );

  // password
  Widget buildPasswordWidget(context, contextkartal) => Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: TextFormField(
          obscureText: modelService.isPassObscured,
          style: GoogleFonts.nunito(
            textStyle: contextkartal.textTheme.labelMedium?.copyWith(
              color: Colors.black,
            ),
          ),
          controller: modelService.passwordController,
          validator: modelService.passwordValidator,
          decoration: InputDecoration(
            icon: const Icon(
              Icons.password_outlined,
              color: Colors.black54,
              size: 18,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  modelService.isPassObscured = !modelService.isPassObscured;
                });
              },
              icon: Icon(
                modelService.isPassObscured
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.grey,
                size: 18,
              ),
            ),
            border: InputBorder.none,
            hintText: "Şifre *",
            hintStyle: GoogleFonts.nunito(
              textStyle: contextkartal.textTheme.labelMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
          ),
        ),
      );

  //  Remember me & forgot password
  Widget buildForgotPasswordWidget(context) => Row(
        children: <Widget>[
          // remember me
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  // checkbox widget
                  Checkbox(
                    activeColor: ColorBackgroundConstant.redDarker,
                    value: modelService.isRememberChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        modelService.isRememberChecked = value!;
                      });

                      modelService.logger.i("Beni Hatırla");
                      modelService.isRememberChecked = value!;
                      SharedPreferences.getInstance().then(
                        (prefs) {
                          prefs.setBool("remember_me", value);
                          prefs.setString(
                              'email', modelService.emailController.text);
                          prefs.setString(
                              'password', modelService.passwordController.text);
                        },
                      );
                      setState(() {
                        modelService.isRememberChecked = value;
                      });
                    },
                  ),
                  // text
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const LabelMediumGreyText(
                        text: "Beni Hatırla",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // forgot password
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  routerService.forgotPasswordViewNavigatorRouter(context);
                },
                child: LabelMediumMainColorText(
                  text: LoginStrings.forgotPasswordText.value,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
        ],
      );

  // login button
  Widget builLoginButtonWidget(loginCubit, context) => LoginButtonWidget(
        modelService: modelService,
        loginCubit: loginCubit,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
  // or
  Widget get builOrWiget => const Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: LabelMediumGreyText(
          text: "veya",
          textAlign: TextAlign.center,
        ),
      );

  // register
  Widget buildRegisterWidget(context) => LoginRegisterButtonWidget(
        routerService: routerService,
      );
}
