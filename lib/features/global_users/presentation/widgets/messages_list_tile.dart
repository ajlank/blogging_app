import 'package:flutter/material.dart';

class MessagesListTile extends StatelessWidget {
  final String senderName;
  final String imageUrl;
  final String message;
  final VoidCallback onTap;

  const MessagesListTile({
    super.key,
    required this.senderName,
    required this.imageUrl,
    required this.message,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(senderName),
      subtitle: Text(message),
      splashColor: const Color.fromARGB(255, 226, 221, 202),
    );
  }
}
