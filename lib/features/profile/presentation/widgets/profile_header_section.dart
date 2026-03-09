import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ProfileHeaderSection extends StatelessWidget {
  final String profileImageUrl;
  final VoidCallback onCreatePostTap;
  final VoidCallback onHomeTap;
  final VoidCallback onSettingsTap;

  const ProfileHeaderSection({
    super.key,
    required this.profileImageUrl,
    required this.onCreatePostTap,
    required this.onHomeTap,
    required this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: onCreatePostTap,
                    icon: Icon(FluentIcons.add_16_regular),
                  ),
                  IconButton(
                    onPressed: onHomeTap,
                    icon: Icon(FluentIcons.home_12_regular),
                  ),
                  GestureDetector(
                    onTap: onSettingsTap,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: const Color.fromARGB(255, 142, 140, 140),
                        ),
                      ),
                      child: Icon(Icons.settings),
                    ),
                  ),
                  SizedBox(width: 30),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                  SizedBox(width: 30),
                ],
              ),
            ),
            SizedBox(width: 50),
          ],
        ),
      ),
    );
  }
}
