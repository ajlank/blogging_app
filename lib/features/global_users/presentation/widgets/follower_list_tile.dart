import 'package:flutter/material.dart';

class FollowerListTile extends StatelessWidget {
  final String senderImage;
  final String senderName;

  const FollowerListTile({
    super.key,
    required this.senderImage,
    required this.senderName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(12),
      onTap: () {},
      leading: CircleAvatar(
        backgroundImage: NetworkImage(senderImage),
      ),
      title: Text(senderName),
      splashColor: const Color.fromARGB(255, 226, 221, 202),
    );
  }
}
