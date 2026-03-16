import 'package:blog_app/core/styles/app_colors.dart';
import 'package:blog_app/core/styles/app_theme.dart';
import 'package:flutter/material.dart';

void showAppSnackBar(BuildContext context, String text) {
  final appTheme = Theme.of(context).extension<AppTheme>();
  final backgroundColor =
      appTheme?.homeSnackBarBackgroundColor ?? AppColors.homeSnackBarBackground;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 3),
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.all(14),
    ),
  );
}
