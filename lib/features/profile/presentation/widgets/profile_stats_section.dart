import 'package:blog_app/features/profile/presentation/widgets/profile_stat_item.dart';
import 'package:blog_app/base/styles/profile_theme.dart';
import 'package:flutter/material.dart';

class ProfileStatsSection extends StatelessWidget {
  final String userId;
  final dynamic followCount;
  final Future<int> Function(String userId) getUserPostCount;
  final Future<int> Function(String userId) getUserReactionCount;

  const ProfileStatsSection({
    super.key,
    required this.userId,
    required this.followCount,
    required this.getUserPostCount,
    required this.getUserReactionCount,
  });

  @override
  Widget build(BuildContext context) {
    final profileTheme = Theme.of(context).extension<ProfileTheme>()!;

    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        color: profileTheme.profileSectionBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileStatItem(
                icon: Icons.post_add,
                value: FutureBuilder<int>(
                  future: getUserPostCount(userId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: 14,
                        width: 14,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    } else if (snapshot.hasError) {
                      return Text("0");
                    } else {
                      return Text(snapshot.data.toString());
                    }
                  },
                ),
                label: 'Total Posts',
              ),
              ProfileStatItem(
                icon: Icons.people,
                value: Text(followCount.toString()),
                label: 'Followers',
              ),
              ProfileStatItem(
                icon: Icons.favorite,
                value: FutureBuilder<int>(
                  future: getUserReactionCount(userId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: 14,
                        width: 14,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    } else if (snapshot.hasError) {
                      return Text("0");
                    } else {
                      return Text(snapshot.data.toString());
                    }
                  },
                ),
                label: 'Reactions',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
