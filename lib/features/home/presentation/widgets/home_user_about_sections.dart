import 'package:blog_app/base/styles/text_styles.dart';
import 'package:blog_app/base/styles/home_theme.dart';
import 'package:flutter/material.dart';

class HomeUserAboutHeaderSection extends StatelessWidget {
  const HomeUserAboutHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final homeTheme = Theme.of(context).extension<HomeTheme>()!;

    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        color: homeTheme.homeSectionBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0, left: 20),
          child: Row(
            children: [Text('About', style: TextStyles.aboutDesign)],
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
    final homeTheme = Theme.of(context).extension<HomeTheme>()!;

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
