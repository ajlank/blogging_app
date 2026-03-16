import 'package:blog_app/core/styles/app_theme.dart';
import 'package:blog_app/core/styles/styles.dart';
import 'package:blog_app/core/utils/constants/notification_strings.dart';
import 'package:flutter/material.dart';

class UserNotificationTile extends StatelessWidget {
  final String senderImage;
  final String senderName;

  const UserNotificationTile({
    super.key,
    required this.senderImage,
    required this.senderName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListTile(
        tileColor: const Color.fromARGB(255, 215, 209, 216),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(senderImage),
        ),
        title: Row(
          children: [
            Text(senderName, style: TextStyles.userTitle),
            SizedBox(width: 8),
            Text(NotificationStrings.isFollowingYou),
          ],
        ),
      ),
    );
  }
}

