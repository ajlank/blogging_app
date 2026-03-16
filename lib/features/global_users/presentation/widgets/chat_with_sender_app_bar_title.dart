import 'package:flutter/material.dart';
import 'package:blog_app/core/styles/app_theme.dart';
import 'package:blog_app/core/utils/constants/chat_strings.dart';

class ChatWithSenderAppBarTitle extends StatelessWidget {
  final String senderName;

  const ChatWithSenderAppBarTitle({
    super.key,
    required this.senderName,
  });

  @override
  Widget build(BuildContext context) {
    final globalUsersTheme = Theme.of(context).extension<AppTheme>()!;

    return Row(
      children: [
        Text(
          ChatStrings.chattingWith,
          style: globalUsersTheme.chatWithSenderLabelTextStyle,
        ),
        SizedBox(width: 5),
        Text(
          senderName,
          style: globalUsersTheme.chatWithSenderNameTextStyle,
        ),
      ],
    );
  }
}



