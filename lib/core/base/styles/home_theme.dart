import 'package:flutter/material.dart';

@immutable
class HomeTheme extends ThemeExtension<HomeTheme> {
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

  const HomeTheme({
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
  });

  @override
  HomeTheme copyWith({
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
  }) {
    return HomeTheme(
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
      homePostBodyTextStyle:
          homePostBodyTextStyle ?? this.homePostBodyTextStyle,
      homeStatLabelTextStyle:
          homeStatLabelTextStyle ?? this.homeStatLabelTextStyle,
      homeActionButtonTextStyle:
          homeActionButtonTextStyle ?? this.homeActionButtonTextStyle,
    );
  }

  @override
  HomeTheme lerp(ThemeExtension<HomeTheme>? other, double t) {
    if (other is! HomeTheme) {
      return this;
    }
    return HomeTheme(
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
    );
  }
}
