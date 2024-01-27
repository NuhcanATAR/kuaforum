import 'package:flutter/material.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/appointment_bloc/appointment_state/state.dart';

mixin AppointmentBlocMixin {
  void appointmentDateUpdateListenerBloc(context, state) {
    if (state is AppointmentDateUpdateStatusSuccess) {
      final snackBar = SnackBar(
        content: const Text("Randevu Tarihi Güncellendi"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is AppointmentDateUpdateStatusError) {
      final snackBar = SnackBar(
        content: const Text("Hata oluştu!"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is AppointmentRejectSuccess) {
      final snackBar = SnackBar(
        content: const Text("Randevu İptal Edildi"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is AppointmentRejectError) {
      final snackBar = SnackBar(
        content: const Text("Hata oluştu!"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void evaluationCreateListenerBloc(context, state) {
    if (state is EvaluationSavedSuccess) {
      final snackBar = SnackBar(
        content: const Text("Değerlendirme alındı"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is EvaluationSavedError) {
      final snackBar = SnackBar(
        content: const Text("Hata oluştu"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
