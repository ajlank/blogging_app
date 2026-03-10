import 'package:blog_app/core/base/styles/home_theme.dart';
import 'package:flutter/material.dart';

class HomeUserActionButtonsSection extends StatelessWidget {
  final bool showFollowingButton;
  final bool showFollowButton;
  final bool showChatButton;
  final VoidCallback onFollowingTap;
  final VoidCallback onFollowTap;
  final VoidCallback onChatTap;

  const HomeUserActionButtonsSection({
    super.key,
    required this.showFollowingButton,
    required this.showFollowButton,
    required this.showChatButton,
    required this.onFollowingTap,
    required this.onFollowTap,
    required this.onChatTap,
  });

  @override
  Widget build(BuildContext context) {
    final homeTheme = Theme.of(context).extension<HomeTheme>()!;

    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        color: homeTheme.homeSectionBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            showFollowingButton
                ? GestureDetector(
                    onTap: onFollowingTap,
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        color: homeTheme.homeUserActionFollowingColor,
                        borderRadius: homeTheme.homeActionButtonRadius,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Following',
                            style: homeTheme.homeActionButtonTextStyle,
                          ),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: homeTheme.homeUserActionIconColor,
                          ),
                        ],
                      ),
                    ),
                  )
                : showFollowButton
                ? GestureDetector(
                    onTap: onFollowTap,
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        color: homeTheme.homeUserActionPrimaryColor,
                        borderRadius: homeTheme.homeActionButtonRadius,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Follow',
                            style: homeTheme.homeActionButtonTextStyle,
                          ),
                          Icon(Icons.add, color: homeTheme.homeUserActionIconColor),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            showChatButton
                ? GestureDetector(
                    onTap: onChatTap,
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        color: homeTheme.homeUserActionPrimaryColor,
                        borderRadius: homeTheme.homeActionButtonRadius,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Chat',
                            style: homeTheme.homeActionButtonTextStyle,
                          ),
                          Icon(
                            Icons.chat,
                            color: homeTheme.homeUserActionIconColor,
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
