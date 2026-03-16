import 'package:blog_app/core/styles/app_theme.dart';
import 'package:blog_app/core/styles/styles.dart';
import 'package:flutter/material.dart';

class ProfileMemberInfoSection extends StatelessWidget {
  final String name;

  const ProfileMemberInfoSection({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final profileTheme = Theme.of(context).extension<AppTheme>()!;

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



