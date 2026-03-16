import 'package:blog_app/features/home/presentation/widgets/home_app_bar_actions.dart';
import 'package:blog_app/core/styles/app_theme.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int globalChatCount;
  final int postReactionCommentCount;
  final int followCount;
  final VoidCallback onGlobalChatTap;
  final VoidCallback onPostReactionCommentTap;
  final VoidCallback onNotificationsTap;
  final VoidCallback onProfileTap;
  final VoidCallback onSignOutTap;

  const HomeAppBar({
    super.key,
    required this.globalChatCount,
    required this.postReactionCommentCount,
    required this.followCount,
    required this.onGlobalChatTap,
    required this.onPostReactionCommentTap,
    required this.onNotificationsTap,
    required this.onProfileTap,
    required this.onSignOutTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final homeTheme = Theme.of(context).extension<AppTheme>()!;

    return AppBar(
      backgroundColor: homeTheme.homeAppBarBackgroundColor,
      actionsPadding: EdgeInsets.all(12),
      actions: [
        HomeAppBarActions(
          globalChatCount: globalChatCount,
          postReactionCommentCount: postReactionCommentCount,
          followCount: followCount,
          onGlobalChatTap: onGlobalChatTap,
          onPostReactionCommentTap: onPostReactionCommentTap,
          onNotificationsTap: onNotificationsTap,
          onProfileTap: onProfileTap,
          onSignOutTap: onSignOutTap,
        ),
      ],
    );
  }
}



