import 'package:blog_app/controller/profile_settings_notifier.dart';
import 'package:blog_app/features/home/presentation/controllers/home_notifier.dart';
import 'package:blog_app/core/base/styles/home_theme.dart';
import 'package:blog_app/core/utils/constants/home_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showHomeCommentsSheet(
  BuildContext context, {
  required String postId,
}) {
  final TextEditingController commentController = TextEditingController();
  final homeNotifier = context.read<HomeNotifier>();
  final homeTheme = Theme.of(context).extension<HomeTheme>()!;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: homeTheme.homeCommentSheetBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: homeTheme.homeCommentSheetRadius,
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                color: homeTheme.homeCommentSheetHandleColor,
                borderRadius: homeTheme.homeCommentSheetHandleRadius,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: StreamBuilder(
                stream: homeNotifier.watchComments(postId),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final comments = snapshot.data!.docs;
                  homeNotifier.updateTotalComment(
                    postId: postId,
                    totalComment: comments.length,
                  );
                  if (comments.isEmpty) {
                    return const Center(child: Text(HomeStrings.noCommentsYet));
                  }

                  return ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final comment = comments[index];

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(comment['userImage']),
                        ),
                        title: Text(comment['userName']),
                        subtitle: Text(comment['commentText']),
                      );
                    },
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: commentController,
                      decoration: const InputDecoration(
                        hintText: HomeStrings.addCommentHint,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: homeTheme.homeCommentSendIconColor,
                    ),
                    onPressed: () async {
                      final text = commentController.text;
                      final currentUser = FirebaseAuth.instance.currentUser;
                      if (currentUser == null) {
                        return;
                      }
                      if (text.isNotEmpty) {
                        await homeNotifier.addComment(
                          postId: postId,
                          userId: currentUser.uid,
                          userName: Provider.of<ProfileSettingsNotifier>(
                            context,
                            listen: false,
                          ).userName,
                          userImage: Provider.of<ProfileSettingsNotifier>(
                            context,
                            listen: false,
                          ).profileImageUrl,
                          commentText: text,
                        );

                        commentController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
