import 'package:flutter/material.dart';

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
          decoration: InputDecoration(hintText: 'Your name?'),
        ),
        TextFormField(
          controller: aboutController,
          decoration: InputDecoration(hintText: 'About yourself....'),
        ),
      ],
    );
  }
}
