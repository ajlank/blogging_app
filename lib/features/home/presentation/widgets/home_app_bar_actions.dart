import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class HomeAppBarActions extends StatelessWidget {
  final int globalChatCount;
  final int postReactionCommentCount;
  final int followCount;
  final VoidCallback onGlobalChatTap;
  final VoidCallback onPostReactionCommentTap;
  final VoidCallback onNotificationsTap;
  final VoidCallback onProfileTap;
  final VoidCallback onSignOutTap;

  const HomeAppBarActions({
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
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onGlobalChatTap,
          icon: Badge(
            label: Text(globalChatCount.toString()),
            child: Icon(Icons.chat),
          ),
        ),
        IconButton(
          onPressed: onPostReactionCommentTap,
          icon: Badge(
            label: Text(postReactionCommentCount.toString()),
            child: Icon(Icons.podcasts_sharp),
          ),
        ),
        IconButton(
          onPressed: onNotificationsTap,
          icon: Badge(
            label: Text(followCount.toString()),
            child: Icon(Icons.notifications_active),
          ),
        ),
        IconButton(
          onPressed: onProfileTap,
          icon: Icon(FluentIcons.person_12_regular),
        ),
        IconButton(
          onPressed: onSignOutTap,
          icon: Icon(FluentIcons.arrow_exit_20_filled),
        ),
      ],
    );
  }
}
