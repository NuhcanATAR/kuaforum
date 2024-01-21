import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError(this.errorMessage);
}

class AuthEmailAlReadyInUse extends AuthState {
  final String errorMessage;

  AuthEmailAlReadyInUse(this.errorMessage);
}

class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess(this.user);
}
