import 'package:flutter/material.dart';
import 'package:blog_app/core/utils/constants/post_strings.dart';

class CreatePostButton extends StatelessWidget {
  final Future<void> Function() onPressed;

  const CreatePostButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await onPressed();
      },
      child: const Text(PostStrings.postButton),
    );
  }
}
