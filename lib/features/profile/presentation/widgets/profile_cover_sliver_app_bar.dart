import 'package:blog_app/core/utils/customs/custom_clipper.dart';
import 'package:blog_app/core/base/styles/profile_theme.dart';
import 'package:flutter/material.dart';

class ProfileCoverSliverAppBar extends StatelessWidget {
  final String coverImageUrl;

  const ProfileCoverSliverAppBar({super.key, required this.coverImageUrl});

  @override
  Widget build(BuildContext context) {
    final profileTheme = Theme.of(context).extension<ProfileTheme>()!;

    return SliverAppBar(
      backgroundColor: profileTheme.profileSectionBackgroundColor,
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
