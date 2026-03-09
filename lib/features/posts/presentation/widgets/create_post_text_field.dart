import 'package:flutter/material.dart';

class CreatePostTextField extends StatelessWidget {
  final TextEditingController controller;

  const CreatePostTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: 'Write your post...'),
    );
  }
}
