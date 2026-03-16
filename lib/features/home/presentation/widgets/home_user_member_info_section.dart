import 'package:blog_app/core/styles/app_theme.dart';
import 'package:blog_app/core/styles/styles.dart';
import 'package:blog_app/core/utils/constants/home_strings.dart';
import 'package:flutter/material.dart';

class HomeUserMemberInfoSection extends StatelessWidget {
  final String name;

  const HomeUserMemberInfoSection({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final homeTheme = Theme.of(context).extension<AppTheme>()!;

    return SliverToBoxAdapter(
      child: Container(
        color: homeTheme.homeSectionBackgroundColor,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  HomeStrings.memberSince,
                  style: homeTheme.homeMemberSinceTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyles.profileHeaderText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



