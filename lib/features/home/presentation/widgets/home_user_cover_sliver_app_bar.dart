import 'package:blog_app/customs/custom_clipper.dart';
import 'package:flutter/material.dart';

class HomeUserCoverSliverAppBar extends StatelessWidget {
  final String coverImageUrl;

  const HomeUserCoverSliverAppBar({
    super.key,
    required this.coverImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
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
