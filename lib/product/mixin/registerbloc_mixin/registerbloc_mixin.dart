import 'package:flutter/material.dart';
import 'package:kuaforum/product/bloc/log_reg_pass_bloc/register_bloc/register_state/register_state.dart';

mixin RegisterBlocMixin {
  void registerUserListenerBloc(context, state) {
    if (state is AuthLoading) {
    } else if (state is AuthError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Hata Oluştu, Tekrar deneyiniz!"),
          backgroundColor: Colors.red,
        ),
      );
    } else if (state is AuthSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Hesabınız Başarıyla Oluşturuldu'),
          backgroundColor: Colors.green,
        ),
      );
    } else if (state is AuthEmailAlReadyInUse) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('E-mail Adresi Kullanımda'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}
