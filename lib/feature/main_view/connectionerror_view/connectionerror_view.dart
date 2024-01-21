import 'package:flutter/material.dart';

class ConnectionErrorView extends StatelessWidget {
  const ConnectionErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("İnternet Bağlantısı Yok"),
      ),
    );
  }
}
