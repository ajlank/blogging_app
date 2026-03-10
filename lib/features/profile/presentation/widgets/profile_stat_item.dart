import 'package:blog_app/core/base/styles/text_styles.dart';
import 'package:blog_app/core/base/styles/profile_theme.dart';
import 'package:flutter/material.dart';

class ProfileStatItem extends StatelessWidget {
  final IconData icon;
  final Widget value;
  final String label;

  const ProfileStatItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final profileTheme = Theme.of(context).extension<ProfileTheme>()!;

    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 0.6,
            color: profileTheme.profileStatDividerColor,
          ),
        ),
      ),
      child: Column(
        children: [
          Icon(icon),
          SizedBox(height: 4),
          value,
          SizedBox(height: 4),
          Text(
            label,
            style: profileTheme.profileStatLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
