import 'package:blog_app/base/styles/text_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum HomePostMenuAction { delete, update }

class HomePostItem extends StatelessWidget {
  final Map<String, dynamic> postData;
  final String currentUserId;
  final VoidCallback onUserTap;
  final Future<void> Function() onDelete;
  final VoidCallback onUpdate;
  final Future<void> Function() onLike;
  final Future<void> Function() onUnlike;
  final VoidCallback onCommentTap;

  const HomePostItem({
    super.key,
    required this.postData,
    required this.currentUserId,
    required this.onUserTap,
    required this.onDelete,
    required this.onUpdate,
    required this.onLike,
    required this.onUnlike,
    required this.onCommentTap,
  });

  @override
  Widget build(BuildContext context) {
    final isOwner = postData['userId'] == currentUserId;
    final isLikedByCurrentUser = ((postData['likedBy'] ?? []) as List<dynamic>)
        .contains(currentUserId);
    final isMarkedLiked = ((postData['isLiked'] ?? []) as List<dynamic>)
        .contains(currentUserId);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 254, 251, 251),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(postData['userImageUrl'] ?? ''),
                radius: 24,
              ),
              const SizedBox(width: 9),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onUserTap,
                    child: Text(
                      postData['userName'] ?? '',
                      style: TextStyles.userTitle,
                    ),
                  ),
                  Text(
                    'Posted on ${DateFormat('MMMM d, y - hh:mm a').format((postData['postedAt'] as Timestamp).toDate())}',
                    style: TextStyles.profileHeaderText.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              isOwner
                  ? PopupMenuButton<HomePostMenuAction>(
                      onSelected: (value) async {
                        switch (value) {
                          case HomePostMenuAction.delete:
                            await onDelete();
                          case HomePostMenuAction.update:
                            onUpdate();
                        }
                      },
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem<HomePostMenuAction>(
                            height: 2.1,
                            value: HomePostMenuAction.delete,
                            child: Text('delete'),
                          ),
                          PopupMenuItem<HomePostMenuAction>(
                            height: 2.1,
                            value: HomePostMenuAction.update,
                            child: Text('update'),
                          ),
                        ];
                      },
                    )
                  : SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            postData['userPostText'] ?? '',
            style: TextStyles.profileHeaderText.copyWith(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
            ),
          ),
          if ((postData['postImageUrl'] ?? '').isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(postData['postImageUrl']),
              ),
            ),
          const SizedBox(height: 12),
          Row(
            children: [
              !(isLikedByCurrentUser && isMarkedLiked)
                  ? GestureDetector(
                      onTap: () async {
                        await onLike();
                      },
                      child: Icon(FluentIcons.heart_16_regular),
                    )
                  : GestureDetector(
                      onTap: () async {
                        await onUnlike();
                      },
                      child: Icon(FluentIcons.heart_16_filled),
                    ),
              const SizedBox(width: 5),
              Text(postData['likeCount'].toString()),
              const SizedBox(width: 17),
              GestureDetector(
                onTap: onCommentTap,
                child: Icon(FluentIcons.comment_28_regular),
              ),
              const SizedBox(width: 5),
              Text(postData['totalComment'].toString()),
            ],
          ),
        ],
      ),
    );
  }
}

