import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';

/// Configuration class for CustomQuickAlert.
///
/// This class contains all the configuration options for displaying
/// a quick alert. It provides sensible defaults while allowing full customization.
@immutable
class CustomQuickAlertConfig {
  /// Creates a QuickAlertConfig with the specified options.
  const CustomQuickAlertConfig({
    required this.type,
    this.title,
    this.message,
    this.lottieAsset,
    this.customContent,
    this.animationType,
    this.position = CustomQuickAlertPosition.center,
    this.barrierDismissible = false,
    this.showCancel = false,
    this.showConfirm = true,
    this.confirmText = 'OK',
    this.cancelText = 'Cancel',
    this.confirmTextColor = Colors.white,
    this.cancelTextColor = Colors.white,
    this.onConfirm,
    this.onCancel,
    this.confirmBtnColor = Colors.blue,
    this.cancelBtnColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black87,
    this.messageColor = Colors.black54,
    this.autoCloseDuration,
    this.borderRadius = 16.0,
    this.disableBackButton = false,
    this.lottieRepeat = true,
    this.width,
    this.padding,
  });

  /// The type of alert to display
  final CustomQuickAlertType type;

  /// The title text of the alert
  final String? title;

  /// The message text of the alert
  final String? message;

  /// Path to a custom Lottie animation asset
  final String? lottieAsset;

  /// Custom widget content (for fully custom alerts)
  final Widget? customContent;

  /// The animation type for the alert entrance
  final CustomQuickAlertAnimationType? animationType;

  /// The position of the alert on screen
  final CustomQuickAlertPosition position;

  /// Whether tapping outside the alert dismisses it
  final bool barrierDismissible;

  /// Whether to show the cancel button
  final bool showCancel;

  /// Whether to show the confirm button
  final bool showConfirm;

  /// Text for the confirm button
  final String confirmText;

  /// Text for the cancel button
  final String cancelText;

  /// Color of the confirm button text
  final Color confirmTextColor;

  /// Color of the cancel button text
  final Color cancelTextColor;

  /// Callback when confirm button is pressed
  final VoidCallback? onConfirm;

  /// Callback when cancel button is pressed
  final VoidCallback? onCancel;

  /// Background color of the confirm button
  final Color confirmBtnColor;

  /// Background color of the cancel button
  final Color cancelBtnColor;

  /// Background color of the alert dialog
  final Color backgroundColor;

  /// Color of the title text
  final Color titleColor;

  /// Color of the message text
  final Color messageColor;

  /// Duration after which the alert auto-closes (optional)
  final Duration? autoCloseDuration;

  /// Border radius of the alert dialog
  final double borderRadius;

  /// Whether to disable the back button while alert is shown
  final bool disableBackButton;

  /// Whether the Lottie animation should repeat
  final bool lottieRepeat;

  /// Custom width for the alert dialog
  final double? width;

  /// Custom padding for the alert content
  final EdgeInsets? padding;

  /// Creates a copy of this config with the given fields replaced
  CustomQuickAlertConfig copyWith({
    CustomQuickAlertType? type,
    String? title,
    String? message,
    String? lottieAsset,
    Widget? customContent,
    CustomQuickAlertAnimationType? animationType,
    CustomQuickAlertPosition? position,
    bool? barrierDismissible,
    bool? showCancel,
    bool? showConfirm,
    String? confirmText,
    String? cancelText,
    Color? confirmTextColor,
    Color? cancelTextColor,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color? confirmBtnColor,
    Color? cancelBtnColor,
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    Duration? autoCloseDuration,
    double? borderRadius,
    bool? disableBackButton,
    bool? lottieRepeat,
    double? width,
    EdgeInsets? padding,
  }) =>
      CustomQuickAlertConfig(
        type: type ?? this.type,
        title: title ?? this.title,
        message: message ?? this.message,
        lottieAsset: lottieAsset ?? this.lottieAsset,
        customContent: customContent ?? this.customContent,
        animationType: animationType ?? this.animationType,
        position: position ?? this.position,
        barrierDismissible: barrierDismissible ?? this.barrierDismissible,
        showCancel: showCancel ?? this.showCancel,
        showConfirm: showConfirm ?? this.showConfirm,
        confirmText: confirmText ?? this.confirmText,
        cancelText: cancelText ?? this.cancelText,
        confirmTextColor: confirmTextColor ?? this.confirmTextColor,
        cancelTextColor: cancelTextColor ?? this.cancelTextColor,
        onConfirm: onConfirm ?? this.onConfirm,
        onCancel: onCancel ?? this.onCancel,
        confirmBtnColor: confirmBtnColor ?? this.confirmBtnColor,
        cancelBtnColor: cancelBtnColor ?? this.cancelBtnColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        titleColor: titleColor ?? this.titleColor,
        messageColor: messageColor ?? this.messageColor,
        autoCloseDuration: autoCloseDuration ?? this.autoCloseDuration,
        borderRadius: borderRadius ?? this.borderRadius,
        disableBackButton: disableBackButton ?? this.disableBackButton,
        lottieRepeat: lottieRepeat ?? this.lottieRepeat,
        width: width ?? this.width,
        padding: padding ?? this.padding,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is CustomQuickAlertConfig &&
        other.type == type &&
        other.title == title &&
        other.message == message &&
        other.lottieAsset == lottieAsset &&
        other.customContent == customContent &&
        other.animationType == animationType &&
        other.position == position &&
        other.barrierDismissible == barrierDismissible &&
        other.showCancel == showCancel &&
        other.showConfirm == showConfirm &&
        other.confirmText == confirmText &&
        other.cancelText == cancelText &&
        other.confirmTextColor == confirmTextColor &&
        other.cancelTextColor == cancelTextColor &&
        other.onConfirm == onConfirm &&
        other.onCancel == onCancel &&
        other.confirmBtnColor == confirmBtnColor &&
        other.cancelBtnColor == cancelBtnColor &&
        other.backgroundColor == backgroundColor &&
        other.titleColor == titleColor &&
        other.messageColor == messageColor &&
        other.autoCloseDuration == autoCloseDuration &&
        other.borderRadius == borderRadius &&
        other.disableBackButton == disableBackButton &&
        other.lottieRepeat == lottieRepeat &&
        other.width == width &&
        other.padding == padding;
  }

  @override
  int get hashCode => Object.hashAll(<Object?>[
        type,
        title,
        message,
        lottieAsset,
        customContent,
        animationType,
        position,
        barrierDismissible,
        showCancel,
        showConfirm,
        confirmText,
        cancelText,
        confirmTextColor,
        cancelTextColor,
        onConfirm,
        onCancel,
        confirmBtnColor,
        cancelBtnColor,
        backgroundColor,
        titleColor,
        messageColor,
        autoCloseDuration,
        borderRadius,
        disableBackButton,
        lottieRepeat,
        width,
        padding,
      ]);
}
