import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/password_bloc/password_state/password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ResetPasswordCubit() : super(ResetPasswordInitial());

  void resetPassword(String email) async {
    emit(ResetPasswordLoading());

    try {
      await _auth.sendPasswordResetEmail(email: email);
      emit(ResetPasswordSuccess(
          message: 'Şifre sıfırlama linki mailinize gönderildi.'));
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(ResetPasswordError(errorMessage: e.message ?? 'Bir hata oluştu'));
      } else {
        emit(ResetPasswordError(errorMessage: 'Bir hata oluştu'));
      }
    }
  }
}
