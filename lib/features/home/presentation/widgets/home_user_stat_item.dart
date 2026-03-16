import 'package:blog_app/core/styles/app_theme.dart';
import 'package:flutter/material.dart';

class HomeUserStatItem extends StatelessWidget {
  final IconData icon;
  final Widget value;
  final String label;

  const HomeUserStatItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final homeTheme = Theme.of(context).extension<AppTheme>()!;

    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 0.6,
            color: homeTheme.homeStatDividerColor,
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
            style: homeTheme.homeStatLabelTextStyle,
          ),
        ],
      ),
    );
  }
}



