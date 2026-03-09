import 'package:blog_app/base/styles/text_styles.dart';
import 'package:flutter/material.dart';

class HomeUserMemberInfoSection extends StatelessWidget {
  final String name;

  const HomeUserMemberInfoSection({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Member since Dec 2024',
                  style: TextStyles.profileHeaderText.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
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
