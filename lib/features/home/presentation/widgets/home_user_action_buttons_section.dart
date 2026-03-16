import 'package:blog_app/core/styles/app_theme.dart';
import 'package:blog_app/core/utils/constants/home_strings.dart';
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
    final homeTheme = Theme.of(context).extension<AppTheme>()!;

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
                            HomeStrings.following,
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
                            HomeStrings.follow,
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
                            HomeStrings.chat,
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



