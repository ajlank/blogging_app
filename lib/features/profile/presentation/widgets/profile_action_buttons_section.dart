import 'package:blog_app/base/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileActionButtonsSection extends StatelessWidget {
  final VoidCallback onFollowersTap;
  final VoidCallback onMessagesTap;

  const ProfileActionButtonsSection({
    super.key,
    required this.onFollowersTap,
    required this.onMessagesTap,
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
            GestureDetector(
              onTap: onFollowersTap,
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Followers',
                      style: TextStyles.profileButtonDesign.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Icon(Icons.people_alt_outlined, color: Colors.white),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: onMessagesTap,
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 6),
                    Text(
                      'Messages',
                      style: TextStyles.profileButtonDesign.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.chat, color: Colors.white),
                    Container(
                      margin: EdgeInsets.only(bottom: 25),
                      child: Badge(label: Text('1')),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
