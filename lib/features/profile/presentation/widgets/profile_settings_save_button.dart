import 'package:flutter/material.dart';
import 'package:blog_app/core/utils/constants/profile_strings.dart';

class ProfileSettingsSaveButton extends StatelessWidget {
  final Future<void> Function() onSave;

  const ProfileSettingsSaveButton({
    super.key,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await onSave();
      },
      child: const Text(ProfileStrings.saveProfile),
    );
  }
}
