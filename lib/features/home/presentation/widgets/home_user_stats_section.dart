import 'package:blog_app/features/home/presentation/widgets/home_user_stat_item.dart';
import 'package:blog_app/core/styles/app_theme.dart';
import 'package:blog_app/core/utils/constants/home_strings.dart';
import 'package:flutter/material.dart';

class HomeUserStatsSection extends StatelessWidget {
  final String userId;
  final dynamic followCount;
  final Future<int> Function(String userId) getUserPostCount;
  final Future<int> Function(String userId) getUserReactionCount;

  const HomeUserStatsSection({
    super.key,
    required this.userId,
    required this.followCount,
    required this.getUserPostCount,
    required this.getUserReactionCount,
  });

  @override
  Widget build(BuildContext context) {
    final homeTheme = Theme.of(context).extension<AppTheme>()!;

    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        color: homeTheme.homeSectionBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeUserStatItem(
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
                label: HomeStrings.totalPosts,
              ),
              HomeUserStatItem(
                icon: Icons.people,
                value: Text(followCount.toString()),
                label: HomeStrings.followers,
              ),
              HomeUserStatItem(
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
                label: HomeStrings.reactions,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



