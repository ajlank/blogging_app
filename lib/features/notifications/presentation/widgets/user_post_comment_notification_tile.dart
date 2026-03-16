import 'package:blog_app/core/styles/app_theme.dart';
import 'package:blog_app/core/styles/styles.dart';
import 'package:blog_app/core/utils/constants/notification_strings.dart';
import 'package:flutter/material.dart';

class UserPostCommentNotificationTile extends StatelessWidget {
  final String senderImage;
  final String senderName;

  const UserPostCommentNotificationTile({
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
        title: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  Text(senderName, style: TextStyles.userTitle),
                  SizedBox(width: 7),
                  Text(
                    NotificationStrings.reactedOnYourPost,
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

