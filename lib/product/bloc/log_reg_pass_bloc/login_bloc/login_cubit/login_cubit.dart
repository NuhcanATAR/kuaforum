import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/login_bloc/login_state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  LoginCubit() : super(LoginInitial());

  void signIn(String email, String password) async {
    emit(LoginLoading());

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = userCredential.user!;

      if (user.emailVerified) {
        emit(LoginSuccess(user));
      } else {
        emit(LoginError(
            'Hesap doğrulanmamış. Lütfen e-posta adresinizi kontrol edin.'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginUserNotFound(
            'Kullanıcı bulunamadı. Lütfen e-posta adresinizi kontrol edin.'));
      } else if (e.code == 'wrong-password') {
        emit(
            LoginWrongPassword('Yanlış şifre. Lütfen şifrenizi kontrol edin.'));
      } else if (e.code == 'too-many-requests') {
        emit(LoginTooManyRequest('Çok fazla hatalı giriş yaptınız.'));
      } else if (e.code == "invalid-email") {
        emit(LoginInvalidEmail("E-mail Adresi Geçersizdir!"));
      }
    } catch (e) {
      emit(LoginError('Giriş işlemi başarısız oldu.'));
    }
  }
}
