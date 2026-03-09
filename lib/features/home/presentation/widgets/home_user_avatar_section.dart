import 'package:flutter/material.dart';

class HomeUserAvatarSection extends StatelessWidget {
  final String profileImageUrl;

  const HomeUserAvatarSection({
    super.key,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
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
