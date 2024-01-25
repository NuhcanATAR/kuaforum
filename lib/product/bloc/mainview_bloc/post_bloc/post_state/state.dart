abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostError extends PostState {
  final String errorText;

  PostError(this.errorText);
}

class PostSuccess extends PostState {}

class PostCommentRemoveSuccess extends PostState {}

class PostCommentRemoveError extends PostState {
  final String errorText;

  PostCommentRemoveError(this.errorText);
}
