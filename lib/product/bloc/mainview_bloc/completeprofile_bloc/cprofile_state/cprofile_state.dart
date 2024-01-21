abstract class AuthProfileState {}

class AuthProfileInitial extends AuthProfileState {}

class AuthProfileLoading extends AuthProfileState {}

class AuthProfileError extends AuthProfileState {
  final String errorMessage;

  AuthProfileError(this.errorMessage);
}

class AuthSuccessProfile extends AuthProfileState {}
