import 'package:blog_app/core/base/styles/text_styles.dart';
import 'package:blog_app/core/base/styles/profile_theme.dart';
import 'package:flutter/material.dart';

class ProfileMemberInfoSection extends StatelessWidget {
  final String name;

  const ProfileMemberInfoSection({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final profileTheme = Theme.of(context).extension<ProfileTheme>()!;

    return SliverToBoxAdapter(
      child: Container(
        color: profileTheme.profileSectionBackgroundColor,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Member since Dec 2024',
                  style: profileTheme.profileMemberSinceTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(name, style: TextStyles.profileHeaderText)],
            ),
          ],
        ),
      ),
    );
  }
}
