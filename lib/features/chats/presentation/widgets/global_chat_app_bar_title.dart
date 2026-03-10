import 'package:flutter/material.dart';
import 'package:blog_app/core/utils/constants/chat_strings.dart';

class GlobalChatAppBarTitle extends StatelessWidget {
  const GlobalChatAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(ChatStrings.globalChatroom, style: TextStyle(fontSize: 13)),
        SizedBox(width: 5),
      ],
    );
  }
}
