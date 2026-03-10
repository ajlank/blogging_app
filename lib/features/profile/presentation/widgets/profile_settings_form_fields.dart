import 'package:flutter/material.dart';
import 'package:blog_app/core/utils/constants/profile_strings.dart';

class ProfileSettingsFormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController aboutController;

  const ProfileSettingsFormFields({
    super.key,
    required this.nameController,
    required this.aboutController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(hintText: ProfileStrings.nameHint),
        ),
        TextFormField(
          controller: aboutController,
          decoration: InputDecoration(hintText: ProfileStrings.aboutHint),
        ),
      ],
    );
  }
}
