import 'package:flutter/material.dart';
import 'package:blog_app/core/utils/constants/chat_strings.dart';

class MessagesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MessagesAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(ChatStrings.allMessages), centerTitle: true);
  }
}
