import 'package:blog_app/controller/home_user_profile_notifier.dart';
import 'package:blog_app/controller/notification_notifier.dart';
import 'package:blog_app/controller/profile_settings_notifier.dart';
import 'package:blog_app/core/base/styles/home_theme.dart';
import 'package:blog_app/features/chats/presentation/views/chat_view.dart';
import 'package:blog_app/features/home/presentation/controllers/home_notifier.dart';
import 'package:blog_app/features/home/presentation/widgets/home_user_about_sections.dart';
import 'package:blog_app/features/home/presentation/widgets/home_user_action_buttons_section.dart';
import 'package:blog_app/features/home/presentation/widgets/home_user_avatar_section.dart';
import 'package:blog_app/features/home/presentation/widgets/home_user_cover_sliver_app_bar.dart';
import 'package:blog_app/features/home/presentation/widgets/home_user_member_info_section.dart';
import 'package:blog_app/features/home/presentation/widgets/home_user_stats_section.dart';
import 'package:blog_app/core/utils/constants/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key});

  String getChatId(String uid1, String uid2) {
    if (uid1.compareTo(uid2) > 0) {
      return '${uid2}_$uid1';
    } else {
      return '${uid1}_$uid2';
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final homeUserProfileNotifier = context.watch<HomeUserProfileNotifier>();
    final homeNotifier = context.read<HomeNotifier>();

    return Scaffold(
      body: StreamBuilder(
        stream: homeNotifier.watchProfileSettings(homeUserProfileNotifier.homeUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading..');
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Please update your profile and navigate to this view"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(profileSettingsRoute);
                    },
                    child: const Text('Update profile'),
                  ),
                ],
              ),
            );
          }
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            final profileData = docs.first.data();

            context.read<ProfileSettingsNotifier>().setUserDetals(
              profileData['profileImageUrl'],
              profileData['name'],
            );

            final isSameUser = homeUserProfileNotifier.homeUserId == currentUserId;
            final followers = (profileData['followers'] ?? []) as List<dynamic>;
            final isFollowing = followers.contains(currentUserId);

            return CustomScrollView(
              slivers: [
                HomeUserCoverSliverAppBar(
                  coverImageUrl: profileData['coverImageUrl'],
                ),
                HomeUserAvatarSection(
                  profileImageUrl: profileData['profileImageUrl'],
                ),
                HomeUserMemberInfoSection(
                  name: profileData['name'] ?? 'Your name',
                ),
                HomeUserStatsSection(
                  userId: profileData['userId'],
                  followCount: profileData['followCount'],
                  getUserPostCount: homeNotifier.getUserPostCount,
                  getUserReactionCount: homeNotifier.getUserReactionCount,
                ),
                HomeUserActionButtonsSection(
                  showFollowingButton: !isSameUser && isFollowing,
                  showFollowButton: !isSameUser && !isFollowing,
                  showChatButton: !isSameUser,
                  onFollowingTap: () async {
                    await homeNotifier.removeFollower(
                      profileDocId: docs.first.id,
                      currentUserId: currentUserId,
                    );
                    showSnckBar(
                      context,
                      "Successfully unfollowed ${profileData['name']}",
                    );
                  },
                  onFollowTap: () async {
                    await homeNotifier.addFollower(
                      profileDocId: docs.first.id,
                      currentUserId: currentUserId,
                    );

                    try {
                      await homeNotifier.addFollowingNotification(
                        senderId: currentUserId,
                        receiverId: profileData['userId'],
                        senderImg: context
                            .read<NotificationNotifier>()
                            .notifSenderImage,
                        senderName: context
                            .read<NotificationNotifier>()
                            .notifSenderName,
                      );

                      showSnckBar(
                        context,
                        "You are now following ${profileData['name']}",
                      );
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  onChatTap: () async {
                    final currentUser = await homeNotifier.getCurrentUserChatProfile(
                      currentUserId,
                    );

                    final senderName = currentUser['name'];
                    final senderImgUrl = currentUser['profileImageUrl'];

                    final chatRoomId = getChatId(currentUserId, profileData['userId']);

                    context.read<HomeUserProfileNotifier>().setRecieverImage(
                      profileData['profileImageUrl'],
                    );
                    GetStorage().write(profileData['userId'], chatRoomId);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ChatView(
                          chatRoomId: chatRoomId,
                          senderName: senderName,
                          imgUrl: senderImgUrl,
                          recieverId: profileData['userId'],
                        ),
                      ),
                    );
                  },
                ),
                const HomeUserAboutHeaderSection(),
                HomeUserAboutBodySection(about: profileData['about']),
              ],
            );
          }
          return Text('Loading');
        },
      ),
    );
  }
}

void showSnckBar(BuildContext context, String text) {
  final homeTheme = Theme.of(context).extension<HomeTheme>()!;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 3),
      backgroundColor: homeTheme.homeSnackBarBackgroundColor,
      padding: EdgeInsets.all(14),
    ),
  );
}
