import 'package:flutter/material.dart';

class PostModelService {
  // form key
  final formPostCommentKey = GlobalKey<FormState>();

  // controller
  late TextEditingController commentController = TextEditingController();

  // validator
  String? commentValidator(String? commentVal) {
    if (commentVal == null || commentVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }
}
