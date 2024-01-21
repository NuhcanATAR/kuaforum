import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginUserNotFound extends LoginState {
  final String errorMessage;

  LoginUserNotFound(this.errorMessage);
}

class LoginWrongPassword extends LoginState {
  final String errorMessage;
  LoginWrongPassword(this.errorMessage);
}

class LoginInvalidEmail extends LoginState {
  final String errorMessage;

  LoginInvalidEmail(this.errorMessage);
}

class LoginTooManyRequest extends LoginState {
  final String errorMessage;
  LoginTooManyRequest(this.errorMessage);
}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError(this.errorMessage);
}

class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess(this.user);
}
