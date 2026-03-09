import 'package:blog_app/base/styles/text_styles.dart';
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
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 0.6,
            color: const Color.fromARGB(255, 161, 159, 159),
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
            style: TextStyles.profileHeaderText.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
