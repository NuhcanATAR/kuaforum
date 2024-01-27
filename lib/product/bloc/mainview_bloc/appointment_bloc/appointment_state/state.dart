abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentSavedError extends AppointmentState {}

class AppointmentSavedSuccess extends AppointmentState {}

class AppointmentDateUpdateStatusSuccess extends AppointmentState {}

class AppointmentDateUpdateStatusError extends AppointmentState {}

class AppointmentRejectSuccess extends AppointmentState {}

class AppointmentRejectError extends AppointmentState {}

class EvaluationSavedSuccess extends AppointmentState {}

class EvaluationSavedError extends AppointmentState {}
