import 'package:blog_app/base/styles/text_styles.dart';
import 'package:flutter/material.dart';

class HomeUserActionButtonsSection extends StatelessWidget {
  final bool showFollowingButton;
  final bool showFollowButton;
  final bool showChatButton;
  final VoidCallback onFollowingTap;
  final VoidCallback onFollowTap;
  final VoidCallback onChatTap;

  const HomeUserActionButtonsSection({
    super.key,
    required this.showFollowingButton,
    required this.showFollowButton,
    required this.showChatButton,
    required this.onFollowingTap,
    required this.onFollowTap,
    required this.onChatTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            showFollowingButton
                ? GestureDetector(
                    onTap: onFollowingTap,
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Following',
                            style: TextStyles.profileButtonDesign.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                : showFollowButton
                ? GestureDetector(
                    onTap: onFollowTap,
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Follow',
                            style: TextStyles.profileButtonDesign.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          Icon(Icons.add, color: Colors.white),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            showChatButton
                ? GestureDetector(
                    onTap: onChatTap,
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Chat',
                            style: TextStyles.profileButtonDesign.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          Icon(Icons.chat, color: Colors.white),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
