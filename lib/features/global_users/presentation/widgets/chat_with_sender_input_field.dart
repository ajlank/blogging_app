import 'package:flutter/material.dart';
import 'package:blog_app/base/styles/global_users_theme.dart';

class ChatWithSenderInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Future<void> Function() onSend;

  const ChatWithSenderInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    final globalUsersTheme = Theme.of(context).extension<GlobalUsersTheme>()!;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            onPressed: () async {
              await onSend();
            },
            icon: Icon(
              Icons.send,
              color: globalUsersTheme.chatWithSenderSendIconColor,
            ),
          ),
        ),
      ),
    );
  }
}
