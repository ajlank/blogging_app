import 'package:flutter/material.dart';
import 'package:blog_app/core/base/styles/home_theme.dart';

class HomeUserAvatarSection extends StatelessWidget {
  final String profileImageUrl;

  const HomeUserAvatarSection({
    super.key,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final homeTheme = Theme.of(context).extension<HomeTheme>()!;

    return SliverToBoxAdapter(
      child: Container(
        color: homeTheme.homeSectionBackgroundColor,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
