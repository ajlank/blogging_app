import 'package:flutter/material.dart';
import 'package:blog_app/core/utils/constants/chat_strings.dart';

class LegacyChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LegacyChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: const [
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(
              ChatStrings.legacyChatAvatarUrl,
            ),
          ),
          SizedBox(width: 10),
          Text(ChatStrings.legacyChatTitle),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      ],
      backgroundColor: Colors.grey.shade800,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
