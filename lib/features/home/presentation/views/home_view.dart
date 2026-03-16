import 'package:blog_app/core/generics/show_snack_bar.dart';
import 'package:blog_app/core/styles/app_theme.dart';
import 'package:blog_app/features/home/presentation/controllers/home_post_notifier.dart';
import 'package:blog_app/features/home/presentation/controllers/home_user_profile_notifier.dart';
import 'package:blog_app/features/notifications/presentation/controllers/notification_notifier.dart';
import 'package:blog_app/features/posts/presentation/controllers/post_comment_notifier.dart';
import 'package:blog_app/features/profile/presentation/controllers/profile_settings_notifier.dart';
import 'package:blog_app/core/utils/constants/home_strings.dart';
import 'package:blog_app/features/home/presentation/controllers/home_notifier.dart';
import 'package:blog_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:blog_app/features/home/presentation/widgets/home_comments_sheet.dart';
import 'package:blog_app/features/home/presentation/widgets/home_post_item.dart';
import 'package:blog_app/core/utils/constants/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return const Scaffold(
        body: Center(child: Text(HomeStrings.pleaseLoginAgain)),
      );
    }

    final currentUserId = currentUser.uid;
    final homeNotifier = context.read<HomeNotifier>();

    final profileSettingsStream = useMemoized(
      () => homeNotifier.watchProfileSettings(currentUserId),
      [homeNotifier, currentUserId],
    );
    final postReactionCommentStream = useMemoized(
      () => homeNotifier.watchPostReactionCommentNotifications(currentUserId),
      [homeNotifier, currentUserId],
    );
    final globalChatroomStream = useMemoized(
      () => homeNotifier.watchGlobalChatroom(),
      [homeNotifier],
    );
    final postsStream = useMemoized(
      () => homeNotifier.watchPosts(),
      [homeNotifier],
    );

    final profileSettingsResult = useStream(profileSettingsStream);
    final profileDocs = profileSettingsResult.data?.docs;
    final followCount =
        (profileDocs != null && profileDocs.isNotEmpty)
            ? (profileDocs.first.data()['followCount'] ?? 0)
            : 0;

    final postReactionCommentResult = useStream(postReactionCommentStream);
    final postReactionCommentCount =
        postReactionCommentResult.data?.docs.length ?? 0;

    final globalChatResult = useStream(globalChatroomStream);
    final globalChatCount = globalChatResult.data?.docs.length ?? 0;

    return Scaffold(
      backgroundColor: appTheme.homeScaffoldBackgroundColor,
      appBar: HomeAppBar(
        globalChatCount: globalChatCount,
        postReactionCommentCount: postReactionCommentCount,
        followCount: followCount,
        onGlobalChatTap: () {
          Navigator.of(context).pushNamed(globalChatRoute);
        },
        onPostReactionCommentTap: () {
          Navigator.of(context).pushNamed(postCommentNotificationRoute);
        },
        onNotificationsTap: () {
          Navigator.of(context).pushNamed(notificationsRoute);
        },
        onProfileTap: () {
          Navigator.of(context).pushNamed(profileRoute);
        },
        onSignOutTap: () async {
          await homeNotifier.signOut();
          context.read<ProfileSettingsNotifier>().clearUserDetails();
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(loginRoute, (_) => false);
        },
      ),
      body: StreamBuilder(
        stream: postsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text(HomeStrings.loading));
          }
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final postData = docs[index].data();

                return HomePostItem(
                  postData: postData,
                  currentUserId: currentUserId,
                  onUserTap: () {
                    context.read<HomeUserProfileNotifier>().setHomeUserId(
                      postData['userId'],
                    );
                    context.read<NotificationNotifier>().setNotifRecieverId(
                      postData['userId'],
                    );
                    context.read<HomeUserProfileNotifier>().setHomeUserName(
                      postData['userName'],
                    );
                    Navigator.of(context).pushNamed(homeUserRoute);
                  },
                  onDelete: () async {
                    await homeNotifier.deletePost(postData['documentId']);
                    showAppSnackBar(context, HomeStrings.postDeleted);
                  },
                  onUpdate: () {
                    context.read<HomePostNotifier>().setUserName(
                      postData['userName'],
                    );
                    context.read<HomePostNotifier>().setUserImgUrl(
                      postData['userImageUrl'],
                    );
                    context.read<HomePostNotifier>().setDocId(
                      postData['documentId'],
                    );
                    context.read<HomePostNotifier>().setPostImage(
                      postData['postImageUrl'],
                    );
                    context.read<HomePostNotifier>().setPostTex(
                      postData['userPostText'],
                    );
                    Navigator.of(context).pushNamed(updatePostRoute);
                  },
                  onLike: () async {
                    final isThatUseWhoLiked =
                        ((postData['likedBy'] ?? []) as List<dynamic>).contains(
                          currentUserId,
                        );

                    if (!isThatUseWhoLiked || isThatUseWhoLiked) {
                      await homeNotifier.likePost(
                        documentId: postData['documentId'],
                        userId: currentUserId,
                      );
                      await homeNotifier.addPostReactionCommentNotification(
                        senderId: currentUserId,
                        receiverId: postData['userId'],
                        senderImg:
                            context.read<NotificationNotifier>().notifSenderImage,
                        senderName:
                            context.read<NotificationNotifier>().notifSenderName,
                      );
                    }
                  },
                  onUnlike: () async {
                    final isThatUseWhoLiked =
                        ((postData['likedBy'] ?? []) as List<dynamic>).contains(
                          currentUserId,
                        );

                    if (isThatUseWhoLiked) {
                      await homeNotifier.unlikePost(
                        documentId: postData['documentId'],
                        userId: currentUserId,
                      );
                    }
                  },
                  onCommentTap: () {
                    context.read<PostCommentNotifier>().setDocId(
                      postData['documentId'],
                    );
                    showHomeCommentsSheet(
                      context,
                      postId: context.read<PostCommentNotifier>().docId,
                    );
                  },
                );
              },
            );
          }
          return Center(child: Text(HomeStrings.loading));
        },
      ),
    );
  }
}
\n
