import 'dart:async';
import 'package:flutter/material.dart';
import '../custom_quick_alert.dart';
import 'alert_content.dart' as alert_content;

/// A professional, advanced alert page builder for static alert widgets.
///
/// This class provides factory methods to create alert widgets that can be
/// embedded directly in your UI without showing as dialogs. Perfect for
/// screenshots, testing, or embedding alerts within other widgets.
class CustomQuickAlertPage {
  CustomQuickAlertPage._();

  /// Builds a success alert page widget.
  ///
  /// Creates a success-themed alert with customizable appearance and behavior.
  /// This widget can be embedded anywhere in your widget tree.
  ///
  /// Example:
  /// ```dart
  /// CustomQuickAlertPage.successAlert(
  ///   title: 'Success!',
  ///   message: 'Operation completed successfully.',
  ///   onConfirm: () => print('Success confirmed'),
  /// )
  /// ```
  static Widget successAlert({
    String? title,
    String? message,
    String? lottieAsset,
    bool lottieRepeat = false,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.black,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.green,
    Color cancelBtnColor = Colors.grey,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black87,
    Duration? autoCloseDuration,
    double borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
    Widget? customContent,
  }) {
    return _buildAlertPage(
      type: CustomQuickAlertType.success,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
      lottieRepeat: lottieRepeat,
      animType: animType,
      position: position,
      barrierDismissible: barrierDismissible,
      showCancel: showCancel,
      showConfirm: showConfirm,
      confirmText: confirmText,
      cancelText: cancelText,
      confirmTextColor: confirmTextColor,
      cancelTextColor: cancelTextColor,
      onConfirm: onConfirm,
      onCancel: onCancel,
      confirmBtnColor: confirmBtnColor,
      cancelBtnColor: cancelBtnColor,
      backgroundColor: backgroundColor,
      titleColor: titleColor,
      messageColor: messageColor,
      autoCloseDuration: autoCloseDuration,
      borderRadius: borderRadius,
      disableBackBtn: disableBackBtn,
      width: width,
      padding: padding,
      customContent: customContent,
    );
  }

  /// Builds an error alert page widget.
  ///
  /// Creates an error-themed alert with red accent colors and error iconography.
  /// Ideal for displaying error messages and validation failures.
  static Widget errorAlert({
    String? title,
    String? message,
    String? lottieAsset,
    bool lottieRepeat = false,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.black,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.red,
    Color cancelBtnColor = Colors.grey,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black87,
    Duration? autoCloseDuration,
    double borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
    Widget? customContent,
  }) {
    return _buildAlertPage(
      type: CustomQuickAlertType.error,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
      lottieRepeat: lottieRepeat,
      animType: animType,
      position: position,
      barrierDismissible: barrierDismissible,
      showCancel: showCancel,
      showConfirm: showConfirm,
      confirmText: confirmText,
      cancelText: cancelText,
      confirmTextColor: confirmTextColor,
      cancelTextColor: cancelTextColor,
      onConfirm: onConfirm,
      onCancel: onCancel,
      confirmBtnColor: confirmBtnColor,
      cancelBtnColor: cancelBtnColor,
      backgroundColor: backgroundColor,
      titleColor: titleColor,
      messageColor: messageColor,
      autoCloseDuration: autoCloseDuration,
      borderRadius: borderRadius,
      disableBackBtn: disableBackBtn,
      width: width,
      padding: padding,
      customContent: customContent,
    );
  }

  /// Builds a warning alert page widget.
  ///
  /// Creates a warning-themed alert with amber/orange colors to grab attention.
  /// Perfect for displaying caution messages and important notices.
  static Widget warningAlert({
    String? title,
    String? message,
    String? lottieAsset,
    bool lottieRepeat = false,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.black,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.orange,
    Color cancelBtnColor = Colors.grey,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black87,
    Duration? autoCloseDuration,
    double borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
    Widget? customContent,
  }) {
    return _buildAlertPage(
      type: CustomQuickAlertType.warning,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
      lottieRepeat: lottieRepeat,
      animType: animType,
      position: position,
      barrierDismissible: barrierDismissible,
      showCancel: showCancel,
      showConfirm: showConfirm,
      confirmText: confirmText,
      cancelText: cancelText,
      confirmTextColor: confirmTextColor,
      cancelTextColor: cancelTextColor,
      onConfirm: onConfirm,
      onCancel: onCancel,
      confirmBtnColor: confirmBtnColor,
      cancelBtnColor: cancelBtnColor,
      backgroundColor: backgroundColor,
      titleColor: titleColor,
      messageColor: messageColor,
      autoCloseDuration: autoCloseDuration,
      borderRadius: borderRadius,
      disableBackBtn: disableBackBtn,
      width: width,
      padding: padding,
      customContent: customContent,
    );
  }

  /// Builds an informational alert page widget.
  ///
  /// Creates an info-themed alert with blue colors for neutral information.
  /// Best used for helpful tips, instructions, or general information.
  static Widget infoAlert({
    String? title,
    String? message,
    String? lottieAsset,
    bool lottieRepeat = false,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.black,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.blue,
    Color cancelBtnColor = Colors.grey,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black87,
    Duration? autoCloseDuration,
    double borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
    Widget? customContent,
  }) {
    return _buildAlertPage(
      type: CustomQuickAlertType.info,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
      lottieRepeat: lottieRepeat,
      animType: animType,
      position: position,
      barrierDismissible: barrierDismissible,
      showCancel: showCancel,
      showConfirm: showConfirm,
      confirmText: confirmText,
      cancelText: cancelText,
      confirmTextColor: confirmTextColor,
      cancelTextColor: cancelTextColor,
      onConfirm: onConfirm,
      onCancel: onCancel,
      confirmBtnColor: confirmBtnColor,
      cancelBtnColor: cancelBtnColor,
      backgroundColor: backgroundColor,
      titleColor: titleColor,
      messageColor: messageColor,
      autoCloseDuration: autoCloseDuration,
      borderRadius: borderRadius,
      disableBackBtn: disableBackBtn,
      width: width,
      padding: padding,
      customContent: customContent,
    );
  }

  /// Builds a confirmation alert page widget.
  ///
  /// Creates a confirm-themed alert with both confirm and cancel buttons.
  /// Ideal for asking user confirmation before destructive or important actions.
  static Widget confirmAlert({
    String? title,
    String? message,
    String? lottieAsset,
    bool lottieRepeat = false,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = true,
    bool showConfirm = true,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.black,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.green,
    Color cancelBtnColor = Colors.grey,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black87,
    Duration? autoCloseDuration,
    double borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
    Widget? customContent,
  }) {
    return _buildAlertPage(
      type: CustomQuickAlertType.confirm,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
      lottieRepeat: lottieRepeat,
      animType: animType,
      position: position,
      barrierDismissible: barrierDismissible,
      showCancel: showCancel,
      showConfirm: showConfirm,
      confirmText: confirmText,
      cancelText: cancelText,
      confirmTextColor: confirmTextColor,
      cancelTextColor: cancelTextColor,
      onConfirm: onConfirm,
      onCancel: onCancel,
      confirmBtnColor: confirmBtnColor,
      cancelBtnColor: cancelBtnColor,
      backgroundColor: backgroundColor,
      titleColor: titleColor,
      messageColor: messageColor,
      autoCloseDuration: autoCloseDuration,
      borderRadius: borderRadius,
      disableBackBtn: disableBackBtn,
      width: width,
      padding: padding,
      customContent: customContent,
    );
  }

  /// Builds a custom alert page widget.
  ///
  /// Creates a fully customizable alert with your own styling and content.
  /// Use this when you need complete control over the alert's appearance.
  static Widget customAlert({
    String? title,
    String? message,
    String? lottieAsset,
    bool lottieRepeat = false,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.black,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.blue,
    Color cancelBtnColor = Colors.grey,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black87,
    Duration? autoCloseDuration,
    double borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
    Widget? customContent,
  }) {
    return _buildAlertPage(
      type: CustomQuickAlertType.custom,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
      lottieRepeat: lottieRepeat,
      animType: animType,
      position: position,
      barrierDismissible: barrierDismissible,
      showCancel: showCancel,
      showConfirm: showConfirm,
      confirmText: confirmText,
      cancelText: cancelText,
      confirmTextColor: confirmTextColor,
      cancelTextColor: cancelTextColor,
      onConfirm: onConfirm,
      onCancel: onCancel,
      confirmBtnColor: confirmBtnColor,
      cancelBtnColor: cancelBtnColor,
      backgroundColor: backgroundColor,
      titleColor: titleColor,
      messageColor: messageColor,
      autoCloseDuration: autoCloseDuration,
      borderRadius: borderRadius,
      disableBackBtn: disableBackBtn,
      width: width,
      padding: padding,
      customContent: customContent,
    );
  }

  /// Builds a loading alert page widget.
  ///
  /// Creates a loading-themed alert with spinner animation.
  /// Perfect for showing progress during async operations.
  /// Note: This is a static widget and won't auto-dismiss like the dialog version.
  static Widget loadingAlert({
    String? title,
    String? message,
    String? lottieAsset,
    bool lottieRepeat = true,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = false,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.black,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.blue,
    Color cancelBtnColor = Colors.grey,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black87,
    Duration? autoCloseDuration,
    double borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
    Widget? customContent,
  }) {
    return _buildAlertPage(
      type: CustomQuickAlertType.loading,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
      lottieRepeat: lottieRepeat,
      animType: animType,
      position: position,
      barrierDismissible: barrierDismissible,
      showCancel: showCancel,
      showConfirm: showConfirm,
      confirmText: confirmText,
      cancelText: cancelText,
      confirmTextColor: confirmTextColor,
      cancelTextColor: cancelTextColor,
      onConfirm: onConfirm,
      onCancel: onCancel,
      confirmBtnColor: confirmBtnColor,
      cancelBtnColor: cancelBtnColor,
      backgroundColor: backgroundColor,
      titleColor: titleColor,
      messageColor: messageColor,
      autoCloseDuration: autoCloseDuration,
      borderRadius: borderRadius,
      disableBackBtn: disableBackBtn,
      width: width,
      padding: padding,
      customContent: customContent,
    );
  }

  /// Internal method to build alert page widgets.
  ///
  /// This is the core builder method that creates the alert widget structure.
  /// It handles all the common logic for creating alert pages with proper
  /// styling, animations, and user interactions.
  static Widget _buildAlertPage({
    required CustomQuickAlertType type,
    String? title,
    String? message,
    String? lottieAsset,
    bool lottieRepeat = false,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.black,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.blue,
    Color cancelBtnColor = Colors.grey,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black87,
    Duration? autoCloseDuration,
    double borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
    Widget? customContent,
  }) {
    // Resolve Lottie asset if not provided
    final String resolvedLottie = lottieAsset ?? getDefaultLottieForType(type);

    // Set up auto-close timer if specified
    Timer? timer;
    if (autoCloseDuration != null) {
      timer = Timer(autoCloseDuration, () {
        // Note: For page widgets, auto-dismiss won't work as there's no dialog to close
        // This is just for consistency with the dialog API
      });
    }

    // Create the alert content widget
    final Widget alertContent = alert_content.AlertContent(
      type: type,
      title: title,
      message: message,
      lottieAsset: resolvedLottie,
      customContent: customContent,
      showCancel: showCancel,
      showConfirm: showConfirm,
      confirmText: confirmText,
      cancelText: cancelText,
      confirmTextColor: confirmTextColor,
      cancelTextColor: cancelTextColor,
      onConfirm: onConfirm,
      onCancel: onCancel,
      confirmBtnColor: confirmBtnColor,
      cancelBtnColor: cancelBtnColor,
      titleColor: titleColor,
      messageColor: messageColor,
      borderRadius: borderRadius,
      width: width,
      timer: timer,
      padding: padding,
      barrierDismissible: barrierDismissible,
    );

    // Return the complete alert page widget
    return RepaintBoundary(
      child: PopScope(
        canPop: !disableBackBtn,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if (didPop) {
            timer?.cancel();
          }
        },
        child: Align(
          alignment: getAlignment(position),
          child: Material(
            color: Colors.transparent,
            elevation: 8.0,
            shadowColor: Colors.black26,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: width ?? 400,
                minWidth: 280,
              ),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                backgroundColor: backgroundColor,
                contentPadding: EdgeInsets.zero,
                content: alertContent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
