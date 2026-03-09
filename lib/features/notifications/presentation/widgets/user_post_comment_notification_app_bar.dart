import 'package:blog_app/base/styles/text_styles.dart';
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
        'Reactions',
        style: TextStyles.profileHeaderText.copyWith(fontSize: 25),
      ),
    );
  }
}
