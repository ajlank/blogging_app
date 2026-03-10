import 'package:flutter/material.dart';

@immutable
class ChatTheme extends ThemeExtension<ChatTheme> {
  final Color legacyChatBackgroundColor;

  const ChatTheme({
    required this.legacyChatBackgroundColor,
  });

  @override
  ChatTheme copyWith({
    Color? legacyChatBackgroundColor,
  }) {
    return ChatTheme(
      legacyChatBackgroundColor:
          legacyChatBackgroundColor ?? this.legacyChatBackgroundColor,
    );
  }

  @override
  ChatTheme lerp(ThemeExtension<ChatTheme>? other, double t) {
    if (other is! ChatTheme) {
      return this;
    }
    return ChatTheme(
      legacyChatBackgroundColor:
          Color.lerp(legacyChatBackgroundColor, other.legacyChatBackgroundColor, t) ??
              legacyChatBackgroundColor,
    );
  }
}
