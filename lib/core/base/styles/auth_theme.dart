import 'package:flutter/material.dart';

@immutable
class AuthTheme extends ThemeExtension<AuthTheme> {
  final Color authButtonColor;
  final TextStyle authButtonTextStyle;
  final TextStyle authErrorTextStyle;
  final BorderRadius authButtonRadius;
  final BorderRadius authFieldRadius;

  const AuthTheme({
    required this.authButtonColor,
    required this.authButtonTextStyle,
    required this.authErrorTextStyle,
    required this.authButtonRadius,
    required this.authFieldRadius,
  });

  @override
  AuthTheme copyWith({
    Color? authButtonColor,
    TextStyle? authButtonTextStyle,
    TextStyle? authErrorTextStyle,
    BorderRadius? authButtonRadius,
    BorderRadius? authFieldRadius,
  }) {
    return AuthTheme(
      authButtonColor: authButtonColor ?? this.authButtonColor,
      authButtonTextStyle: authButtonTextStyle ?? this.authButtonTextStyle,
      authErrorTextStyle: authErrorTextStyle ?? this.authErrorTextStyle,
      authButtonRadius: authButtonRadius ?? this.authButtonRadius,
      authFieldRadius: authFieldRadius ?? this.authFieldRadius,
    );
  }

  @override
  AuthTheme lerp(ThemeExtension<AuthTheme>? other, double t) {
    if (other is! AuthTheme) {
      return this;
    }
    return AuthTheme(
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
    );
  }
}
