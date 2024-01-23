import 'package:flutter/material.dart';

class ServiceDetailView extends StatefulWidget {
  const ServiceDetailView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<ServiceDetailView> createState() => _ServiceDetailViewState();
}

class _ServiceDetailViewState extends State<ServiceDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Servis Detayı"),
      ),
    );
  }
}
