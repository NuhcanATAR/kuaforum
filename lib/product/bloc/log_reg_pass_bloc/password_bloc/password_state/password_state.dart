abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final String message;

  ResetPasswordSuccess({required this.message});
}

class ResetPasswordError extends ResetPasswordState {
  final String errorMessage;

  ResetPasswordError({required this.errorMessage});
}
