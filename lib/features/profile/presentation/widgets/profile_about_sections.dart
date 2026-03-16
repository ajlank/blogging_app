import 'package:blog_app/core/styles/app_theme.dart';
import 'package:blog_app/core/styles/styles.dart';
import 'package:flutter/material.dart';

class ProfileAboutHeaderSection extends StatelessWidget {
  const ProfileAboutHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final profileTheme = Theme.of(context).extension<AppTheme>()!;

    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        color: profileTheme.profileSectionBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0, left: 20),
          child: Row(children: [Text('About', style: TextStyles.aboutDesign)]),
        ),
      ),
    );
  }
}

class ProfileAboutBodySection extends StatelessWidget {
  final String about;

  const ProfileAboutBodySection({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    final profileTheme = Theme.of(context).extension<AppTheme>()!;

    return SliverToBoxAdapter(
      child: Container(
        height: 500,
        color: profileTheme.profileSectionBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(about),
        ),
      ),
    );
  }
}



