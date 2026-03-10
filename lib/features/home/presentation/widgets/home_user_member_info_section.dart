import 'package:blog_app/core/base/styles/text_styles.dart';
import 'package:blog_app/core/base/styles/home_theme.dart';
import 'package:flutter/material.dart';

class HomeUserMemberInfoSection extends StatelessWidget {
  final String name;

  const HomeUserMemberInfoSection({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final homeTheme = Theme.of(context).extension<HomeTheme>()!;

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
                  'Member since Dec 2024',
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
