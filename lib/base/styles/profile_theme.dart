import 'package:flutter/material.dart';

@immutable
class ProfileTheme extends ThemeExtension<ProfileTheme> {
  final Color profileSectionBackgroundColor;
  final Color profileActionButtonColor;
  final Color profileActionIconColor;
  final Color profileSettingsBorderColor;
  final Color profileStatDividerColor;
  final BorderRadius profileActionButtonRadius;
  final BorderRadius profileSettingsBorderRadius;
  final TextStyle profileMemberSinceTextStyle;
  final TextStyle profileActionButtonTextStyle;
  final TextStyle profileMessageButtonTextStyle;
  final TextStyle profileStatLabelTextStyle;

  const ProfileTheme({
    required this.profileSectionBackgroundColor,
    required this.profileActionButtonColor,
    required this.profileActionIconColor,
    required this.profileSettingsBorderColor,
    required this.profileStatDividerColor,
    required this.profileActionButtonRadius,
    required this.profileSettingsBorderRadius,
    required this.profileMemberSinceTextStyle,
    required this.profileActionButtonTextStyle,
    required this.profileMessageButtonTextStyle,
    required this.profileStatLabelTextStyle,
  });

  @override
  ProfileTheme copyWith({
    Color? profileSectionBackgroundColor,
    Color? profileActionButtonColor,
    Color? profileActionIconColor,
    Color? profileSettingsBorderColor,
    Color? profileStatDividerColor,
    BorderRadius? profileActionButtonRadius,
    BorderRadius? profileSettingsBorderRadius,
    TextStyle? profileMemberSinceTextStyle,
    TextStyle? profileActionButtonTextStyle,
    TextStyle? profileMessageButtonTextStyle,
    TextStyle? profileStatLabelTextStyle,
  }) {
    return ProfileTheme(
      profileSectionBackgroundColor:
          profileSectionBackgroundColor ?? this.profileSectionBackgroundColor,
      profileActionButtonColor:
          profileActionButtonColor ?? this.profileActionButtonColor,
      profileActionIconColor:
          profileActionIconColor ?? this.profileActionIconColor,
      profileSettingsBorderColor:
          profileSettingsBorderColor ?? this.profileSettingsBorderColor,
      profileStatDividerColor:
          profileStatDividerColor ?? this.profileStatDividerColor,
      profileActionButtonRadius:
          profileActionButtonRadius ?? this.profileActionButtonRadius,
      profileSettingsBorderRadius:
          profileSettingsBorderRadius ?? this.profileSettingsBorderRadius,
      profileMemberSinceTextStyle:
          profileMemberSinceTextStyle ?? this.profileMemberSinceTextStyle,
      profileActionButtonTextStyle:
          profileActionButtonTextStyle ?? this.profileActionButtonTextStyle,
      profileMessageButtonTextStyle:
          profileMessageButtonTextStyle ?? this.profileMessageButtonTextStyle,
      profileStatLabelTextStyle:
          profileStatLabelTextStyle ?? this.profileStatLabelTextStyle,
    );
  }

  @override
  ProfileTheme lerp(ThemeExtension<ProfileTheme>? other, double t) {
    if (other is! ProfileTheme) {
      return this;
    }
    return ProfileTheme(
      profileSectionBackgroundColor: Color.lerp(
            profileSectionBackgroundColor,
            other.profileSectionBackgroundColor,
            t,
          ) ??
          profileSectionBackgroundColor,
      profileActionButtonColor: Color.lerp(
            profileActionButtonColor,
            other.profileActionButtonColor,
            t,
          ) ??
          profileActionButtonColor,
      profileActionIconColor: Color.lerp(
            profileActionIconColor,
            other.profileActionIconColor,
            t,
          ) ??
          profileActionIconColor,
      profileSettingsBorderColor: Color.lerp(
            profileSettingsBorderColor,
            other.profileSettingsBorderColor,
            t,
          ) ??
          profileSettingsBorderColor,
      profileStatDividerColor: Color.lerp(
            profileStatDividerColor,
            other.profileStatDividerColor,
            t,
          ) ??
          profileStatDividerColor,
      profileActionButtonRadius: BorderRadius.lerp(
            profileActionButtonRadius,
            other.profileActionButtonRadius,
            t,
          ) ??
          profileActionButtonRadius,
      profileSettingsBorderRadius: BorderRadius.lerp(
            profileSettingsBorderRadius,
            other.profileSettingsBorderRadius,
            t,
          ) ??
          profileSettingsBorderRadius,
      profileMemberSinceTextStyle: TextStyle.lerp(
            profileMemberSinceTextStyle,
            other.profileMemberSinceTextStyle,
            t,
          ) ??
          profileMemberSinceTextStyle,
      profileActionButtonTextStyle: TextStyle.lerp(
            profileActionButtonTextStyle,
            other.profileActionButtonTextStyle,
            t,
          ) ??
          profileActionButtonTextStyle,
      profileMessageButtonTextStyle: TextStyle.lerp(
            profileMessageButtonTextStyle,
            other.profileMessageButtonTextStyle,
            t,
          ) ??
          profileMessageButtonTextStyle,
      profileStatLabelTextStyle: TextStyle.lerp(
            profileStatLabelTextStyle,
            other.profileStatLabelTextStyle,
            t,
          ) ??
          profileStatLabelTextStyle,
    );
  }
}
