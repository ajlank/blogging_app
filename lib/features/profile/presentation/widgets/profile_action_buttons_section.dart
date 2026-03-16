import 'package:blog_app/core/styles/app_theme.dart';
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
    final profileTheme = Theme.of(context).extension<AppTheme>()!;

    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        color: profileTheme.profileSectionBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: onFollowersTap,
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  color: profileTheme.profileActionButtonColor,
                  borderRadius: profileTheme.profileActionButtonRadius,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Followers',
                      style: profileTheme.profileActionButtonTextStyle,
                    ),
                    Icon(
                      Icons.people_alt_outlined,
                      color: profileTheme.profileActionIconColor,
                    ),
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
                  color: profileTheme.profileActionButtonColor,
                  borderRadius: profileTheme.profileActionButtonRadius,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 6),
                    Text(
                      'Messages',
                      style: profileTheme.profileMessageButtonTextStyle,
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.chat, color: profileTheme.profileActionIconColor),
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



