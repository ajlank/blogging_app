import 'package:blog_app/features/notifications/presentation/controllers/notification_notifier.dart';
import 'package:blog_app/features/profile/presentation/controllers/profile_settings_notifier.dart';
import 'package:blog_app/features/profile/presentation/controllers/profile_notifier.dart';
import 'package:blog_app/features/profile/presentation/widgets/profile_about_sections.dart';
import 'package:blog_app/features/profile/presentation/widgets/profile_action_buttons_section.dart';
import 'package:blog_app/features/profile/presentation/widgets/profile_cover_sliver_app_bar.dart';
import 'package:blog_app/features/profile/presentation/widgets/profile_header_section.dart';
import 'package:blog_app/features/profile/presentation/widgets/profile_member_info_section.dart';
import 'package:blog_app/features/profile/presentation/widgets/profile_stats_section.dart';
import 'package:blog_app/core/utils/constants/app_routes.dart';
import 'package:blog_app/core/utils/constants/profile_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileNotifier = context.read<ProfileNotifier>();

    return Scaffold(
      body: StreamBuilder(
        stream: profileNotifier.watchProfileSettings(
          FirebaseAuth.instance.currentUser!.uid,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text(ProfileStrings.loadingEllipsis);
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(ProfileStrings.updateProfilePrompt),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(profileSettingsRoute);
                    },
                    child: const Text(ProfileStrings.updateProfile),
                  ),
                ],
              ),
            );
          }
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            final docId = docs.first.id;
            final profileData = docs.first.data();

            context.read<ProfileSettingsNotifier>().setUserDetals(
              profileData['profileImageUrl'],
              profileData['name'],
            );
            context.read<NotificationNotifier>().setNotifierSenderImage(
              profileData['profileImageUrl'],
            );
            context.read<NotificationNotifier>().setNotifierSenderName(
              profileData['name'],
            );

            return CustomScrollView(
              slivers: [
                ProfileCoverSliverAppBar(
                  coverImageUrl: profileData['coverImageUrl'],
                ),
                ProfileHeaderSection(
                  profileImageUrl: profileData['profileImageUrl'],
                  onCreatePostTap: () {
                    Navigator.of(context).pushNamed(createPostRoute);
                  },
                  onHomeTap: () {
                    Navigator.of(
                      context,
                    ).pushNamedAndRemoveUntil(homeRoute, (_) => false);
                  },
                  onSettingsTap: () {
                    Navigator.of(context).pushNamed(
                      profileUpdateRoute,
                      arguments: {'docId': docId},
                    );
                  },
                ),
                ProfileMemberInfoSection(
                  name: profileData['name'] ?? ProfileStrings.yourNameFallback,
                ),
                ProfileStatsSection(
                  userId: profileData['userId'],
                  followCount: profileData['followCount'],
                  getUserPostCount: profileNotifier.getUserPostCount,
                  getUserReactionCount: profileNotifier.getUserReactionCount,
                ),
                ProfileActionButtonsSection(
                  onFollowersTap: () {
                    Navigator.of(context).pushNamed(followerViewRoute);
                  },
                  onMessagesTap: () {
                    Navigator.of(context).pushNamed(messagesRoute);
                  },
                ),
                const ProfileAboutHeaderSection(),
                ProfileAboutBodySection(about: profileData['about']),
              ],
            );
          }
          return Text(ProfileStrings.loading);
        },
      ),
    );
  }
}
