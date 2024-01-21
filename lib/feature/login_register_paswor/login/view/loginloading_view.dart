import 'package:flutter/material.dart';

class LoginLoadingView extends StatelessWidget {
  const LoginLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Başarılı Yönlendiriliyorsunuz"),
      ),
    );
  }
}
