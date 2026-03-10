import 'package:blog_app/core/base/styles/text_styles.dart';
import 'package:blog_app/core/utils/constants/notification_strings.dart';
import 'package:flutter/material.dart';

class UserNotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const UserNotificationAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        NotificationStrings.notificationsTitle,
        style: TextStyles.profileHeaderText.copyWith(fontSize: 25),
      ),
    );
  }
}
