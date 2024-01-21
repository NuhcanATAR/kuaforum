abstract class CProfileUpateEvent {}

class ProfileUpateEvent extends CProfileUpateEvent {
  final String phoneNumber;
  final String city;

  ProfileUpateEvent(this.phoneNumber, this.city);
}
