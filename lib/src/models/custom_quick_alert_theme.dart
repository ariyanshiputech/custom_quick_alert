import 'package:custom_quick_alert/src/enums/custom_quick_alert_types.dart';
import 'package:flutter/material.dart';

/// Theme configuration for different alert types.
///
/// This class defines the default appearance for each alert type,
/// including colors, text styles, and default animations.
@immutable
class CustomQuickAlertTheme {
  /// Creates a QuickAlertTheme with the specified options.
  const CustomQuickAlertTheme({
    required this.primaryColor,
    required this.backgroundColor,
    required this.titleColor,
    required this.messageColor,
    required this.confirmButtonColor,
    required this.cancelButtonColor,
    required this.confirmTextColor,
    required this.cancelTextColor,
    this.titleTextStyle,
    this.messageTextStyle,
    this.buttonTextStyle,
    this.borderRadius = 16.0,
    this.elevation = 8.0,
  });

  /// Primary color used for the alert (e.g., icon color)
  final Color primaryColor;

  /// Background color of the alert dialog
  final Color backgroundColor;

  /// Color of the title text
  final Color titleColor;

  /// Color of the message text
  final Color messageColor;

  /// Background color of the confirm button
  final Color confirmButtonColor;

  /// Background color of the cancel button
  final Color cancelButtonColor;

  /// Text color of the confirm button
  final Color confirmTextColor;

  /// Text color of the cancel button
  final Color cancelTextColor;

  /// Text style for the title
  final TextStyle? titleTextStyle;

  /// Text style for the message
  final TextStyle? messageTextStyle;

  /// Text style for buttons
  final TextStyle? buttonTextStyle;

  /// Border radius of the alert dialog
  final double borderRadius;

  /// Elevation of the alert dialog
  final double elevation;

  /// Default theme for success alerts
  static const CustomQuickAlertTheme success = CustomQuickAlertTheme(
    primaryColor: Color(0xFF4CAF50),
    backgroundColor: Colors.white,
    titleColor: Color(0xFF2E7D32),
    messageColor: Color(0xFF424242),
    confirmButtonColor: Color(0xFF4CAF50),
    cancelButtonColor: Color(0xFF757575),
    confirmTextColor: Colors.white,
    cancelTextColor: Colors.white,
  );

  /// Default theme for error alerts
  static const CustomQuickAlertTheme error = CustomQuickAlertTheme(
    primaryColor: Color(0xFFF44336),
    backgroundColor: Colors.white,
    titleColor: Color(0xFFD32F2F),
    messageColor: Color(0xFF424242),
    confirmButtonColor: Color(0xFFF44336),
    cancelButtonColor: Color(0xFF757575),
    confirmTextColor: Colors.white,
    cancelTextColor: Colors.white,
  );

  /// Default theme for warning alerts
  static const CustomQuickAlertTheme warning = CustomQuickAlertTheme(
    primaryColor: Color(0xFFFF9800),
    backgroundColor: Colors.white,
    titleColor: Color(0xFFE65100),
    messageColor: Color(0xFF424242),
    confirmButtonColor: Color(0xFFFF9800),
    cancelButtonColor: Color(0xFF757575),
    confirmTextColor: Colors.white,
    cancelTextColor: Colors.white,
  );

  /// Default theme for info alerts
  static const CustomQuickAlertTheme info = CustomQuickAlertTheme(
    primaryColor: Color(0xFF2196F3),
    backgroundColor: Colors.white,
    titleColor: Color(0xFF1976D2),
    messageColor: Color(0xFF424242),
    confirmButtonColor: Color(0xFF2196F3),
    cancelButtonColor: Color(0xFF757575),
    confirmTextColor: Colors.white,
    cancelTextColor: Colors.white,
  );

  /// Default theme for confirm alerts
  static const CustomQuickAlertTheme confirm = CustomQuickAlertTheme(
    primaryColor: Color(0xFF3F51B5),
    backgroundColor: Colors.white,
    titleColor: Color(0xFF303F9F),
    messageColor: Color(0xFF424242),
    confirmButtonColor: Color(0xFF3F51B5),
    cancelButtonColor: Color(0xFF757575),
    confirmTextColor: Colors.white,
    cancelTextColor: Colors.white,
  );

  /// Default theme for loading alerts
  static const CustomQuickAlertTheme loading = CustomQuickAlertTheme(
    primaryColor: Color(0xFF607D8B),
    backgroundColor: Colors.white,
    titleColor: Color(0xFF455A64),
    messageColor: Color(0xFF424242),
    confirmButtonColor: Color(0xFF607D8B),
    cancelButtonColor: Color(0xFF757575),
    confirmTextColor: Colors.white,
    cancelTextColor: Colors.white,
  );

  /// Default theme for custom alerts
  static const CustomQuickAlertTheme custom = CustomQuickAlertTheme(
    primaryColor: Color(0xFF9C27B0),
    backgroundColor: Colors.white,
    titleColor: Color(0xFF7B1FA2),
    messageColor: Color(0xFF424242),
    confirmButtonColor: Color(0xFF9C27B0),
    cancelButtonColor: Color(0xFF757575),
    confirmTextColor: Colors.white,
    cancelTextColor: Colors.white,
  );

  /// Gets the default theme for the specified alert type
  static CustomQuickAlertTheme getThemeForType(CustomQuickAlertType type) {
    switch (type) {
      case CustomQuickAlertType.success:
        return success;
      case CustomQuickAlertType.error:
        return error;
      case CustomQuickAlertType.warning:
        return warning;
      case CustomQuickAlertType.info:
        return info;
      case CustomQuickAlertType.confirm:
        return confirm;
      case CustomQuickAlertType.loading:
        return loading;
      case CustomQuickAlertType.custom:
        return custom;
    }
  }

  /// Creates a copy of this theme with the given fields replaced
  CustomQuickAlertTheme copyWith({
    Color? primaryColor,
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    Color? confirmButtonColor,
    Color? cancelButtonColor,
    Color? confirmTextColor,
    Color? cancelTextColor,
    TextStyle? titleTextStyle,
    TextStyle? messageTextStyle,
    TextStyle? buttonTextStyle,
    double? borderRadius,
    double? elevation,
  }) =>
      CustomQuickAlertTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        titleColor: titleColor ?? this.titleColor,
        messageColor: messageColor ?? this.messageColor,
        confirmButtonColor: confirmButtonColor ?? this.confirmButtonColor,
        cancelButtonColor: cancelButtonColor ?? this.cancelButtonColor,
        confirmTextColor: confirmTextColor ?? this.confirmTextColor,
        cancelTextColor: cancelTextColor ?? this.cancelTextColor,
        titleTextStyle: titleTextStyle ?? this.titleTextStyle,
        messageTextStyle: messageTextStyle ?? this.messageTextStyle,
        buttonTextStyle: buttonTextStyle ?? this.buttonTextStyle,
        borderRadius: borderRadius ?? this.borderRadius,
        elevation: elevation ?? this.elevation,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is CustomQuickAlertTheme &&
        other.primaryColor == primaryColor &&
        other.backgroundColor == backgroundColor &&
        other.titleColor == titleColor &&
        other.messageColor == messageColor &&
        other.confirmButtonColor == confirmButtonColor &&
        other.cancelButtonColor == cancelButtonColor &&
        other.confirmTextColor == confirmTextColor &&
        other.cancelTextColor == cancelTextColor &&
        other.titleTextStyle == titleTextStyle &&
        other.messageTextStyle == messageTextStyle &&
        other.buttonTextStyle == buttonTextStyle &&
        other.borderRadius == borderRadius &&
        other.elevation == elevation;
  }

  @override
  int get hashCode => Object.hash(
        primaryColor,
        backgroundColor,
        titleColor,
        messageColor,
        confirmButtonColor,
        cancelButtonColor,
        confirmTextColor,
        cancelTextColor,
        titleTextStyle,
        messageTextStyle,
        buttonTextStyle,
        borderRadius,
        elevation,
      );
}
