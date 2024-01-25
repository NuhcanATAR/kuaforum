abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentSavedError extends AppointmentState {
  final String errorText;

  AppointmentSavedError(this.errorText);
}

class AppointmentSavedSuccess extends AppointmentState {}
