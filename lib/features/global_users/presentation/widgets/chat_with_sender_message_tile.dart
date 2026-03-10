import 'package:flutter/material.dart';
import 'package:blog_app/core/base/styles/global_users_theme.dart';

class ChatWithSenderMessageTile extends StatelessWidget {
  final String senderMessage;
  final String recieverMessage;

  const ChatWithSenderMessageTile({
    super.key,
    required this.senderMessage,
    required this.recieverMessage,
  });

  @override
  Widget build(BuildContext context) {
    final globalUsersTheme = Theme.of(context).extension<GlobalUsersTheme>()!;

    return ListTile(
      title: Text(
        senderMessage,
        style: globalUsersTheme.chatWithSenderMessageTextStyle,
      ),
      trailing: Text(
        recieverMessage,
        style: globalUsersTheme.chatWithSenderMessageTextStyle,
      ),
    );
  }
}
