import 'package:flutter/material.dart';

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
              'https://user-images.githubusercontent.com/89972827/208123817-524df66c-fcc6-4a29-8c27-cdeb3c989e41.png',
            ),
          ),
          SizedBox(width: 10),
          Text('Chat'),
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
