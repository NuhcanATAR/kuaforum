import 'package:flutter/material.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/profile_bloc/profile_state/profile_state.dart';

mixin ProfileSettingBlocMixin {
  void profileNameSurnameUpdateListenerBloc(context, state) {
    if (state is ProfileNameSurnameUpdateSuccess) {
      final snackBar = SnackBar(
        content: const Text("Ad Soyad Güncellendi"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is ProfileNameSurnameUpdateError) {
      final snackBar = SnackBar(
        content: const Text("Hata oluştu, Tekrar Deneyiniz!"),
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

  void profilePhoneNumberUpdateListenerBloc(context, state) {
    if (state is ProfilePhoneNumberUpdateSuccess) {
      final snackBar = SnackBar(
        content: const Text("Telefon Numaranız Güncellendi"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is ProfilePhoneNumberUpdateError) {
      final snackBar = SnackBar(
        content: const Text("Hata oluştu, Tekrar Deneyiniz!"),
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

  void profileCityLocationUpdateListenerBloc(context, state) {
    if (state is ProfileCityUpdateSuccess) {
      final snackBar = SnackBar(
        content: const Text("Şehir Bilginiz Güncellendi"),
        action: SnackBarAction(
          label: "Tamam",
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is ProfileCityUpdateError) {
      final snackBar = SnackBar(
        content: const Text("Hata oluştu, Tekrar Deneyiniz!"),
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
