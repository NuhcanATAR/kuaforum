import 'package:flutter/material.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gönderi Detayı"),
      ),
    );
  }
}
