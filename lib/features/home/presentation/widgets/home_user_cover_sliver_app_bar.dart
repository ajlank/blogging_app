import 'package:blog_app/core/utils/customs/custom_clipper.dart';
import 'package:blog_app/core/styles/app_theme.dart';
import 'package:flutter/material.dart';

class HomeUserCoverSliverAppBar extends StatelessWidget {
  final String coverImageUrl;

  const HomeUserCoverSliverAppBar({
    super.key,
    required this.coverImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final homeTheme = Theme.of(context).extension<AppTheme>()!;

    return SliverAppBar(
      backgroundColor: homeTheme.homeAppBarBackgroundColor,
      expandedHeight: 300.0,
      pinned: false,
      snap: false,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            ClipPath(
              clipper: CurveClipper(),
              child: Image.network(
                coverImageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



