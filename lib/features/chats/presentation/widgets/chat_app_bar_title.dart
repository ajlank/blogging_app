import 'package:flutter/material.dart';
import 'package:blog_app/core/utils/constants/chat_strings.dart';

class ChatAppBarTitle extends StatelessWidget {
  final String userName;

  const ChatAppBarTitle({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(ChatStrings.chattingWith, style: TextStyle(fontSize: 13)),
        SizedBox(width: 5),
        Text(
          userName,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
