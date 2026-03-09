import 'package:flutter/material.dart';

class UpdatePostButton extends StatelessWidget {
  final Future<void> Function() onPressed;

  const UpdatePostButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await onPressed();
      },
      child: const Text('Update'),
    );
  }
}
