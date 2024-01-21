import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/register_bloc/register_state/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuaforum/product/model/log_reg_pass_model/register_model/register_model.dart';
import 'package:kuaforum/product/router/log_reg_pass_router/register_router/register_router.dart';
import 'package:kuaforum/product/utility/database/log_reg_pas_db/register_db/register_db.dart';

class AuthSignUpCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthSignUpCubit() : super(AuthInitial());

  // models
  RegisterServiceModel modelService = RegisterServiceModel();

  // routers
  RegisterServiceRouter serviceRouter = RegisterServiceRouter();

  void signUp(String email, String password, String name, String surname,
      BuildContext context) async {
    emit(AuthLoading());

    try {
      // Önce Firebase'e kayıtlı e-posta olup olmadığını kontrol et
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await RegisterDB.USERS.userRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "ID": FirebaseAuth.instance.currentUser!.uid,
        "NAME": name,
        "SURNAME": surname,
        "EMAIL": email,
        "PASSWORD": password,
        "PHONENUMBER": "",
        "CITY": "",
        "DATE": FieldValue.serverTimestamp(),
        "ACTIVE": true,
      }).then((value) {
        serviceRouter.registerUserSuccessfulDialog(
          context,
          modelService.nameController,
          modelService.surnameController,
          modelService.emailController,
          modelService.passwordController,
        );
      }).catchError((err) {
        serviceRouter.registerUserErrorDialog(
          context,
          modelService.nameController,
          modelService.surnameController,
          modelService.emailController,
          modelService.passwordController,
        );
      });

      User? userAuth = userCredential.user;
      await userAuth?.sendEmailVerification();
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          emit(AuthEmailAlReadyInUse('E-posta adresi zaten kullanımda.'));
        } else {
          emit(AuthError('Kayıt işlemi başarısız oldu. Hata: ${e.message}'));
        }
      } else {
        emit(AuthError('Kayıt işlemi başarısız oldu. Hata: $e'));
      }
    }
  }
}
