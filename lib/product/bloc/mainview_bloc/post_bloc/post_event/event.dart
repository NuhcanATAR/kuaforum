abstract class PostEvent {}

class PostModelEvent extends PostEvent {
  final String commentText;

  PostModelEvent(this.commentText);
}
