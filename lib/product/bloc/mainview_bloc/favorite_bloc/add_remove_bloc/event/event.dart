abstract class FavoriteAddRemoveEvent {}

class FavoriteAddRemoveModelEvent extends FavoriteAddRemoveEvent {
  final String serviceID;

  FavoriteAddRemoveModelEvent(this.serviceID);
}
