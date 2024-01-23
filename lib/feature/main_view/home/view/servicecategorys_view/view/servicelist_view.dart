import 'package:flutter/material.dart';

class ServiceListView extends StatelessWidget {
  const ServiceListView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kateogirye bağlı hizmetler"),
      ),
    );
  }
}
