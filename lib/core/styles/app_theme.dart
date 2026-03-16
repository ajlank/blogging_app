import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  final Color authButtonColor;
  final TextStyle authButtonTextStyle;
  final TextStyle authErrorTextStyle;
  final BorderRadius authButtonRadius;
  final BorderRadius authFieldRadius;
  final Color legacyChatBackgroundColor;
  final Color chatWithSenderSendIconColor;
  final TextStyle chatWithSenderLabelTextStyle;
  final TextStyle chatWithSenderNameTextStyle;
  final TextStyle chatWithSenderMessageTextStyle;
  final Color homeScaffoldBackgroundColor;
  final Color homeAppBarBackgroundColor;
  final Color homeSectionBackgroundColor;
  final Color homePostCardBackgroundColor;
  final Color homeSnackBarBackgroundColor;
  final Color homeCommentSheetBackgroundColor;
  final Color homeCommentSheetHandleColor;
  final Color homeCommentSendIconColor;
  final Color homeUserActionFollowingColor;
  final Color homeUserActionPrimaryColor;
  final Color homeUserActionIconColor;
  final Color homeStatDividerColor;
  final BorderRadius homePostCardRadius;
  final BorderRadius homePostImageRadius;
  final BorderRadius homeActionButtonRadius;
  final BorderRadius homeCommentSheetRadius;
  final BorderRadius homeCommentSheetHandleRadius;
  final TextStyle homeMemberSinceTextStyle;
  final TextStyle homePostTimestampTextStyle;
  final TextStyle homePostBodyTextStyle;
  final TextStyle homeStatLabelTextStyle;
  final TextStyle homeActionButtonTextStyle;
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

  const AppTheme({
    required this.authButtonColor,
    required this.authButtonTextStyle,
    required this.authErrorTextStyle,
    required this.authButtonRadius,
    required this.authFieldRadius,
    required this.legacyChatBackgroundColor,
    required this.chatWithSenderSendIconColor,
    required this.chatWithSenderLabelTextStyle,
    required this.chatWithSenderNameTextStyle,
    required this.chatWithSenderMessageTextStyle,
    required this.homeScaffoldBackgroundColor,
    required this.homeAppBarBackgroundColor,
    required this.homeSectionBackgroundColor,
    required this.homePostCardBackgroundColor,
    required this.homeSnackBarBackgroundColor,
    required this.homeCommentSheetBackgroundColor,
    required this.homeCommentSheetHandleColor,
    required this.homeCommentSendIconColor,
    required this.homeUserActionFollowingColor,
    required this.homeUserActionPrimaryColor,
    required this.homeUserActionIconColor,
    required this.homeStatDividerColor,
    required this.homePostCardRadius,
    required this.homePostImageRadius,
    required this.homeActionButtonRadius,
    required this.homeCommentSheetRadius,
    required this.homeCommentSheetHandleRadius,
    required this.homeMemberSinceTextStyle,
    required this.homePostTimestampTextStyle,
    required this.homePostBodyTextStyle,
    required this.homeStatLabelTextStyle,
    required this.homeActionButtonTextStyle,
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

  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seed),
      extensions: const <ThemeExtension<dynamic>>[
        AppTheme(
          authButtonColor: AppColors.authButton,
          authButtonTextStyle: TextStyle(color: AppColors.white, fontSize: 19),
          authErrorTextStyle: TextStyle(
            color: AppColors.authErrorText,
            fontWeight: FontWeight.bold,
          ),
          authButtonRadius: BorderRadius.all(Radius.circular(12)),
          authFieldRadius: BorderRadius.all(Radius.circular(30)),
          legacyChatBackgroundColor: AppColors.chatLegacyBackground,
          chatWithSenderSendIconColor: AppColors.globalUsersSendIcon,
          chatWithSenderLabelTextStyle: TextStyle(fontSize: 13),
          chatWithSenderNameTextStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          chatWithSenderMessageTextStyle: TextStyle(fontSize: 13.2),
          homeScaffoldBackgroundColor: AppColors.homeScaffoldBackground,
          homeAppBarBackgroundColor: AppColors.homeAppBarBackground,
          homeSectionBackgroundColor: AppColors.homeSectionBackground,
          homePostCardBackgroundColor: AppColors.homePostCardBackground,
          homeSnackBarBackgroundColor: AppColors.homeSnackBarBackground,
          homeCommentSheetBackgroundColor: AppColors.homeCommentSheetBackground,
          homeCommentSheetHandleColor: AppColors.homeCommentSheetHandle,
          homeCommentSendIconColor: AppColors.homeCommentSendIcon,
          homeUserActionFollowingColor: AppColors.homeUserActionFollowing,
          homeUserActionPrimaryColor: AppColors.homeUserActionPrimary,
          homeUserActionIconColor: AppColors.homeUserActionIcon,
          homeStatDividerColor: AppColors.homeStatDivider,
          homePostCardRadius: BorderRadius.all(Radius.circular(30)),
          homePostImageRadius: BorderRadius.all(Radius.circular(16)),
          homeActionButtonRadius: BorderRadius.all(Radius.circular(16)),
          homeCommentSheetRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          homeCommentSheetHandleRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          homeMemberSinceTextStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 13,
          ),
          homePostTimestampTextStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
          homePostBodyTextStyle: TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w400,
          ),
          homeStatLabelTextStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),
          homeActionButtonTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 15,
          ),
          profileSectionBackgroundColor: AppColors.profileSectionBackground,
          profileActionButtonColor: AppColors.profileActionButton,
          profileActionIconColor: AppColors.profileActionIcon,
          profileSettingsBorderColor: AppColors.profileSettingsBorder,
          profileStatDividerColor: AppColors.profileStatDivider,
          profileActionButtonRadius: BorderRadius.all(Radius.circular(16)),
          profileSettingsBorderRadius: BorderRadius.all(Radius.circular(15)),
          profileMemberSinceTextStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 13,
          ),
          profileActionButtonTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 15,
          ),
          profileMessageButtonTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 14,
          ),
          profileStatLabelTextStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  @override
  AppTheme copyWith({
    Color? authButtonColor,
    TextStyle? authButtonTextStyle,
    TextStyle? authErrorTextStyle,
    BorderRadius? authButtonRadius,
    BorderRadius? authFieldRadius,
    Color? legacyChatBackgroundColor,
    Color? chatWithSenderSendIconColor,
    TextStyle? chatWithSenderLabelTextStyle,
    TextStyle? chatWithSenderNameTextStyle,
    TextStyle? chatWithSenderMessageTextStyle,
    Color? homeScaffoldBackgroundColor,
    Color? homeAppBarBackgroundColor,
    Color? homeSectionBackgroundColor,
    Color? homePostCardBackgroundColor,
    Color? homeSnackBarBackgroundColor,
    Color? homeCommentSheetBackgroundColor,
    Color? homeCommentSheetHandleColor,
    Color? homeCommentSendIconColor,
    Color? homeUserActionFollowingColor,
    Color? homeUserActionPrimaryColor,
    Color? homeUserActionIconColor,
    Color? homeStatDividerColor,
    BorderRadius? homePostCardRadius,
    BorderRadius? homePostImageRadius,
    BorderRadius? homeActionButtonRadius,
    BorderRadius? homeCommentSheetRadius,
    BorderRadius? homeCommentSheetHandleRadius,
    TextStyle? homeMemberSinceTextStyle,
    TextStyle? homePostTimestampTextStyle,
    TextStyle? homePostBodyTextStyle,
    TextStyle? homeStatLabelTextStyle,
    TextStyle? homeActionButtonTextStyle,
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
    return AppTheme(
      authButtonColor: authButtonColor ?? this.authButtonColor,
      authButtonTextStyle: authButtonTextStyle ?? this.authButtonTextStyle,
      authErrorTextStyle: authErrorTextStyle ?? this.authErrorTextStyle,
      authButtonRadius: authButtonRadius ?? this.authButtonRadius,
      authFieldRadius: authFieldRadius ?? this.authFieldRadius,
      legacyChatBackgroundColor:
          legacyChatBackgroundColor ?? this.legacyChatBackgroundColor,
      chatWithSenderSendIconColor:
          chatWithSenderSendIconColor ?? this.chatWithSenderSendIconColor,
      chatWithSenderLabelTextStyle:
          chatWithSenderLabelTextStyle ?? this.chatWithSenderLabelTextStyle,
      chatWithSenderNameTextStyle:
          chatWithSenderNameTextStyle ?? this.chatWithSenderNameTextStyle,
      chatWithSenderMessageTextStyle:
          chatWithSenderMessageTextStyle ??
              this.chatWithSenderMessageTextStyle,
      homeScaffoldBackgroundColor:
          homeScaffoldBackgroundColor ?? this.homeScaffoldBackgroundColor,
      homeAppBarBackgroundColor:
          homeAppBarBackgroundColor ?? this.homeAppBarBackgroundColor,
      homeSectionBackgroundColor:
          homeSectionBackgroundColor ?? this.homeSectionBackgroundColor,
      homePostCardBackgroundColor:
          homePostCardBackgroundColor ?? this.homePostCardBackgroundColor,
      homeSnackBarBackgroundColor:
          homeSnackBarBackgroundColor ?? this.homeSnackBarBackgroundColor,
      homeCommentSheetBackgroundColor: homeCommentSheetBackgroundColor ??
          this.homeCommentSheetBackgroundColor,
      homeCommentSheetHandleColor:
          homeCommentSheetHandleColor ?? this.homeCommentSheetHandleColor,
      homeCommentSendIconColor:
          homeCommentSendIconColor ?? this.homeCommentSendIconColor,
      homeUserActionFollowingColor:
          homeUserActionFollowingColor ?? this.homeUserActionFollowingColor,
      homeUserActionPrimaryColor:
          homeUserActionPrimaryColor ?? this.homeUserActionPrimaryColor,
      homeUserActionIconColor:
          homeUserActionIconColor ?? this.homeUserActionIconColor,
      homeStatDividerColor:
          homeStatDividerColor ?? this.homeStatDividerColor,
      homePostCardRadius: homePostCardRadius ?? this.homePostCardRadius,
      homePostImageRadius: homePostImageRadius ?? this.homePostImageRadius,
      homeActionButtonRadius:
          homeActionButtonRadius ?? this.homeActionButtonRadius,
      homeCommentSheetRadius:
          homeCommentSheetRadius ?? this.homeCommentSheetRadius,
      homeCommentSheetHandleRadius:
          homeCommentSheetHandleRadius ?? this.homeCommentSheetHandleRadius,
      homeMemberSinceTextStyle:
          homeMemberSinceTextStyle ?? this.homeMemberSinceTextStyle,
      homePostTimestampTextStyle:
          homePostTimestampTextStyle ?? this.homePostTimestampTextStyle,
      homePostBodyTextStyle: homePostBodyTextStyle ?? this.homePostBodyTextStyle,
      homeStatLabelTextStyle:
          homeStatLabelTextStyle ?? this.homeStatLabelTextStyle,
      homeActionButtonTextStyle:
          homeActionButtonTextStyle ?? this.homeActionButtonTextStyle,
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
  AppTheme lerp(ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      authButtonColor:
          Color.lerp(authButtonColor, other.authButtonColor, t) ??
              authButtonColor,
      authButtonTextStyle: TextStyle.lerp(
            authButtonTextStyle,
            other.authButtonTextStyle,
            t,
          ) ??
          authButtonTextStyle,
      authErrorTextStyle: TextStyle.lerp(
            authErrorTextStyle,
            other.authErrorTextStyle,
            t,
          ) ??
          authErrorTextStyle,
      authButtonRadius:
          BorderRadius.lerp(authButtonRadius, other.authButtonRadius, t) ??
              authButtonRadius,
      authFieldRadius:
          BorderRadius.lerp(authFieldRadius, other.authFieldRadius, t) ??
              authFieldRadius,
      legacyChatBackgroundColor: Color.lerp(
            legacyChatBackgroundColor,
            other.legacyChatBackgroundColor,
            t,
          ) ??
          legacyChatBackgroundColor,
      chatWithSenderSendIconColor: Color.lerp(
            chatWithSenderSendIconColor,
            other.chatWithSenderSendIconColor,
            t,
          ) ??
          chatWithSenderSendIconColor,
      chatWithSenderLabelTextStyle: TextStyle.lerp(
            chatWithSenderLabelTextStyle,
            other.chatWithSenderLabelTextStyle,
            t,
          ) ??
          chatWithSenderLabelTextStyle,
      chatWithSenderNameTextStyle: TextStyle.lerp(
            chatWithSenderNameTextStyle,
            other.chatWithSenderNameTextStyle,
            t,
          ) ??
          chatWithSenderNameTextStyle,
      chatWithSenderMessageTextStyle: TextStyle.lerp(
            chatWithSenderMessageTextStyle,
            other.chatWithSenderMessageTextStyle,
            t,
          ) ??
          chatWithSenderMessageTextStyle,
      homeScaffoldBackgroundColor: Color.lerp(
            homeScaffoldBackgroundColor,
            other.homeScaffoldBackgroundColor,
            t,
          ) ??
          homeScaffoldBackgroundColor,
      homeAppBarBackgroundColor: Color.lerp(
            homeAppBarBackgroundColor,
            other.homeAppBarBackgroundColor,
            t,
          ) ??
          homeAppBarBackgroundColor,
      homeSectionBackgroundColor: Color.lerp(
            homeSectionBackgroundColor,
            other.homeSectionBackgroundColor,
            t,
          ) ??
          homeSectionBackgroundColor,
      homePostCardBackgroundColor: Color.lerp(
            homePostCardBackgroundColor,
            other.homePostCardBackgroundColor,
            t,
          ) ??
          homePostCardBackgroundColor,
      homeSnackBarBackgroundColor: Color.lerp(
            homeSnackBarBackgroundColor,
            other.homeSnackBarBackgroundColor,
            t,
          ) ??
          homeSnackBarBackgroundColor,
      homeCommentSheetBackgroundColor: Color.lerp(
            homeCommentSheetBackgroundColor,
            other.homeCommentSheetBackgroundColor,
            t,
          ) ??
          homeCommentSheetBackgroundColor,
      homeCommentSheetHandleColor: Color.lerp(
            homeCommentSheetHandleColor,
            other.homeCommentSheetHandleColor,
            t,
          ) ??
          homeCommentSheetHandleColor,
      homeCommentSendIconColor: Color.lerp(
            homeCommentSendIconColor,
            other.homeCommentSendIconColor,
            t,
          ) ??
          homeCommentSendIconColor,
      homeUserActionFollowingColor: Color.lerp(
            homeUserActionFollowingColor,
            other.homeUserActionFollowingColor,
            t,
          ) ??
          homeUserActionFollowingColor,
      homeUserActionPrimaryColor: Color.lerp(
            homeUserActionPrimaryColor,
            other.homeUserActionPrimaryColor,
            t,
          ) ??
          homeUserActionPrimaryColor,
      homeUserActionIconColor: Color.lerp(
            homeUserActionIconColor,
            other.homeUserActionIconColor,
            t,
          ) ??
          homeUserActionIconColor,
      homeStatDividerColor: Color.lerp(
            homeStatDividerColor,
            other.homeStatDividerColor,
            t,
          ) ??
          homeStatDividerColor,
      homePostCardRadius:
          BorderRadius.lerp(homePostCardRadius, other.homePostCardRadius, t) ??
              homePostCardRadius,
      homePostImageRadius:
          BorderRadius.lerp(homePostImageRadius, other.homePostImageRadius, t) ??
              homePostImageRadius,
      homeActionButtonRadius: BorderRadius.lerp(
            homeActionButtonRadius,
            other.homeActionButtonRadius,
            t,
          ) ??
          homeActionButtonRadius,
      homeCommentSheetRadius: BorderRadius.lerp(
            homeCommentSheetRadius,
            other.homeCommentSheetRadius,
            t,
          ) ??
          homeCommentSheetRadius,
      homeCommentSheetHandleRadius: BorderRadius.lerp(
            homeCommentSheetHandleRadius,
            other.homeCommentSheetHandleRadius,
            t,
          ) ??
          homeCommentSheetHandleRadius,
      homeMemberSinceTextStyle: TextStyle.lerp(
            homeMemberSinceTextStyle,
            other.homeMemberSinceTextStyle,
            t,
          ) ??
          homeMemberSinceTextStyle,
      homePostTimestampTextStyle: TextStyle.lerp(
            homePostTimestampTextStyle,
            other.homePostTimestampTextStyle,
            t,
          ) ??
          homePostTimestampTextStyle,
      homePostBodyTextStyle: TextStyle.lerp(
            homePostBodyTextStyle,
            other.homePostBodyTextStyle,
            t,
          ) ??
          homePostBodyTextStyle,
      homeStatLabelTextStyle: TextStyle.lerp(
            homeStatLabelTextStyle,
            other.homeStatLabelTextStyle,
            t,
          ) ??
          homeStatLabelTextStyle,
      homeActionButtonTextStyle: TextStyle.lerp(
            homeActionButtonTextStyle,
            other.homeActionButtonTextStyle,
            t,
          ) ??
          homeActionButtonTextStyle,
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


