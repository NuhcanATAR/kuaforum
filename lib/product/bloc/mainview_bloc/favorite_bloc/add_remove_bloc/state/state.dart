abstract class FavoriteAddRemoveState {}

class FavoriteAddRemoveInitial extends FavoriteAddRemoveState {}

class FavoriteAddRemoveLoading extends FavoriteAddRemoveState {}

class FavoriteAddRemoveError extends FavoriteAddRemoveState {
  final String errorText;

  FavoriteAddRemoveError(this.errorText);
}

class FavoriteAddRemoveSuccess extends FavoriteAddRemoveState {}

class FavoriteAddSuccess extends FavoriteAddRemoveState {}

class FavoriteRemoveSuccess extends FavoriteAddRemoveState {}
