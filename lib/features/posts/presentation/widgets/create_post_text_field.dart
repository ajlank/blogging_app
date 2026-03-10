import 'package:flutter/material.dart';
import 'package:blog_app/core/utils/constants/post_strings.dart';

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
      decoration: InputDecoration(hintText: PostStrings.writeYourPostHint),
    );
  }
}
