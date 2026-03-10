import 'package:flutter/material.dart';

@immutable
class GlobalUsersTheme extends ThemeExtension<GlobalUsersTheme> {
  final Color chatWithSenderSendIconColor;
  final TextStyle chatWithSenderLabelTextStyle;
  final TextStyle chatWithSenderNameTextStyle;
  final TextStyle chatWithSenderMessageTextStyle;

  const GlobalUsersTheme({
    required this.chatWithSenderSendIconColor,
    required this.chatWithSenderLabelTextStyle,
    required this.chatWithSenderNameTextStyle,
    required this.chatWithSenderMessageTextStyle,
  });

  @override
  GlobalUsersTheme copyWith({
    Color? chatWithSenderSendIconColor,
    TextStyle? chatWithSenderLabelTextStyle,
    TextStyle? chatWithSenderNameTextStyle,
    TextStyle? chatWithSenderMessageTextStyle,
  }) {
    return GlobalUsersTheme(
      chatWithSenderSendIconColor:
          chatWithSenderSendIconColor ?? this.chatWithSenderSendIconColor,
      chatWithSenderLabelTextStyle:
          chatWithSenderLabelTextStyle ?? this.chatWithSenderLabelTextStyle,
      chatWithSenderNameTextStyle:
          chatWithSenderNameTextStyle ?? this.chatWithSenderNameTextStyle,
      chatWithSenderMessageTextStyle:
          chatWithSenderMessageTextStyle ?? this.chatWithSenderMessageTextStyle,
    );
  }

  @override
  GlobalUsersTheme lerp(ThemeExtension<GlobalUsersTheme>? other, double t) {
    if (other is! GlobalUsersTheme) {
      return this;
    }
    return GlobalUsersTheme(
      chatWithSenderSendIconColor:
          Color.lerp(chatWithSenderSendIconColor, other.chatWithSenderSendIconColor, t) ??
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
    );
  }
}
