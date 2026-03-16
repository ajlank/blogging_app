import 'package:blog_app/core/styles/app_theme.dart';
import 'package:blog_app/core/styles/styles.dart';
import 'package:blog_app/core/utils/constants/notification_strings.dart';
import 'package:flutter/material.dart';

class UserPostCommentNotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const UserPostCommentNotificationAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        NotificationStrings.reactionsTitle,
        style: TextStyles.profileHeaderText.copyWith(fontSize: 25),
      ),
    );
  }
}

