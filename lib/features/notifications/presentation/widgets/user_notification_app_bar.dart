import 'package:blog_app/base/styles/text_styles.dart';
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
        'Notifications',
        style: TextStyles.profileHeaderText.copyWith(fontSize: 25),
      ),
    );
  }
}
