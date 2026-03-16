import 'package:blog_app/core/styles/app_theme.dart';
import 'package:blog_app/core/utils/constants/home_strings.dart';
import 'package:flutter/material.dart';

class HomeUserAboutHeaderSection extends StatelessWidget {
  const HomeUserAboutHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final homeTheme = Theme.of(context).extension<AppTheme>()!;

    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        color: homeTheme.homeSectionBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0, left: 20),
          child: Row(
            children: [Text(HomeStrings.about, style: TextStyles.aboutDesign)],
          ),
        ),
      ),
    );
  }
}

class HomeUserAboutBodySection extends StatelessWidget {
  final String about;

  const HomeUserAboutBodySection({
    super.key,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    final homeTheme = Theme.of(context).extension<AppTheme>()!;

    return SliverToBoxAdapter(
      child: Container(
        height: 500,
        color: homeTheme.homeSectionBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(child: Text(about)),
        ),
      ),
    );
  }
}



