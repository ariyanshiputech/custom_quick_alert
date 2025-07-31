import 'dart:async';

import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:custom_quick_alert/src/custom_quick_alert_navigator.dart'
    as navigator;
import 'package:flutter/material.dart';

import 'alert_content.dart' as alert_content;

class CustomQuickAlert {
  /// Displays a success alert dialog.
  /// [title] is the title of the alert.
  /// [message] is the message displayed in the alert.
  /// [lottieAsset] is the path to the Lottie animation asset.
  /// [animType] defines the animation type for the alert.
  /// [position] defines the position of the alert on the screen.
  /// [barrierDismissible] determines if tapping outside the alert dismisses it.
  /// [showCancel] determines if a cancel button is shown.
  /// [showConfirm] determines if a confirm button is shown.
  /// [confirmText] is the text for the confirm button.
  /// [cancelText] is the text for the cancel button.
  /// [confirmTextColor] is the color of the confirm button text.
  /// [cancelTextColor] is the color of the cancel button text.
  /// [onConfirm] is the callback for when the confirm button is pressed.
  /// [onCancel] is the callback for when the cancel button is pressed.
  /// [confirmBtnColor] is the color of the confirm button.
  /// [cancelBtnColor] is the color of the cancel button.
  /// [backgroundColor] is the background color of the alert.
  /// [titleColor] is the color of the title text.
  /// [messageColor] is the color of the message text.
  /// [autoCloseDuration] is the duration after which the alert automatically closes.
  /// [borderRadius] is the radius of the alert's corners.
  /// [disableBackBtn] determines if the back button is disabled while the alert is shown
  /// [width] is the width of the alert dialog.
  /// [padding] is the padding inside the alert dialog.
  static Future<void> success({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimType? animType,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.white,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.blue,
    Color cancelBtnColor = Colors.deepOrange,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black,
    Duration? autoCloseDuration,
    double? borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
  }) {
    return show(
      type: CustomQuickAlertType.success,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
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
      width: width,
      padding: padding,
    );
  }

  static Future<void> error({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimType? animType,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.white,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.blue,
    Color cancelBtnColor = Colors.deepOrange,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black,
    Duration? autoCloseDuration,
    double? borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
  }) {
    return show(
      type: CustomQuickAlertType.error,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
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
    );
  }

  static Future<void> warning({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimType? animType,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.white,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.blue,
    Color cancelBtnColor = Colors.deepOrange,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black,
    Duration? autoCloseDuration,
    double? borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
  }) {
    return show(
      type: CustomQuickAlertType.warning,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
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
    );
  }

  static Future<void> info({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimType? animType,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.white,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.blue,
    Color cancelBtnColor = Colors.deepOrange,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black,
    Duration? autoCloseDuration,
    double? borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
  }) {
    return show(
      type: CustomQuickAlertType.info,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
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
    );
  }

  static Future<void> confirm({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimType? animType,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = true, // for confirm, cancel should default true!
    bool showConfirm = true,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.white,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.blue,
    Color cancelBtnColor = Colors.deepOrange,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black,
    Duration? autoCloseDuration,
    double? borderRadius = 16,
    bool disableBackBtn = false,
    double? width,
    EdgeInsets? padding,
  }) {
    return show(
      type: CustomQuickAlertType.confirm,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
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
    );
  }

  static Future<void> loading({
    String? lottieAsset,
    bool barrierDismissible = false,
    Color backgroundColor = Colors.white,
    double borderRadius = 26.0,
    double? width,
    EdgeInsets? padding,
  }) {
    CustomQuickAlertLoader.showLoadingDialog(
      type: CustomQuickAlertType.loading,
      lottieAsset: lottieAsset,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      width: width,
      padding: padding,
    );
    return Future<void>.value();
  }

  static Future<void> custom({
    required String title,
    required String message,
    required String lottieAsset,
  }) {
    return show(
      type: CustomQuickAlertType.custom,
      title: title,
      message: message,
      lottieAsset: lottieAsset,
    );
  }

  static Future<void> show({
    required CustomQuickAlertType type,
    String? title,
    String? message,
    String? lottieAsset,
    Widget? customContent,
    CustomQuickAlertAnimType? animType,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color confirmTextColor = Colors.white,
    Color cancelTextColor = Colors.white,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color confirmBtnColor = Colors.blue,
    Color cancelBtnColor = Colors.deepOrange,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black,
    Duration? autoCloseDuration,
    double? borderRadius,
    bool disableBackBtn = false,
    bool? lottieRepeat,
    Color? dialogBackgroundColor,
    double? width,
    EdgeInsets? padding,
  }) async {
    final String resolvedLottie = lottieAsset ?? getDefaultLottieForType(type);

    Timer? timer;
    if (autoCloseDuration != null) {
      timer = Timer(autoCloseDuration, () {
        CustomQuickAlert.dismiss();
      });
    }

    final Widget alertContent = alert_content.AlertContent(
      type: type,
      title: title,
      message: message,
      lottieAsset: resolvedLottie,
      customContent: customContent,
      showCancel: showCancel,
      showConfirm: showConfirm,
      confirmText: confirmText,
      confirmTextColor: confirmTextColor,
      cancelText: cancelText,
      cancelTextColor: cancelTextColor,
      onConfirm: onConfirm,
      confirmBtnColor: confirmBtnColor,
      onCancel: onCancel,
      cancelBtnColor: cancelBtnColor,
      titleColor: titleColor,
      messageColor: messageColor,
      borderRadius: borderRadius ?? 16,
      timer: timer,
      width: width,
      padding: padding,
      barrierDismissible: barrierDismissible,
      backgroundColor: backgroundColor,
      animType: animType,
      lottieRepeat: lottieRepeat ?? false,
      position: position,
    );

    final Widget alertWidget = PopScope(
      canPop: !disableBackBtn,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) timer?.cancel();
      },
      child: Align(
        alignment: getAlignment(position),
        child: Material(
          color: Colors.transparent,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(borderRadius?.toDouble() ?? 26.0),
            ),
            backgroundColor: backgroundColor,
            contentPadding: EdgeInsets.zero,
            content: alertContent,
          ),
        ),
      ),
    );

    await showGeneralDialog(
      context:
          navigator.customQuickAlertNavigatorKey.currentState!.overlay!.context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'CustomQuickAlert',
      transitionDuration: const Duration(milliseconds: 200),
      barrierColor: Colors.black54,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return alertWidget;
      },
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        final Map<CustomQuickAlertAnimType?,
                Widget Function(Animation<double>, Widget)>
            animations = <CustomQuickAlertAnimType?,
                Widget Function(Animation<double>, Widget)>{
          CustomQuickAlertAnimType.scale:
              (Animation<double> animation, Widget child) => Transform.scale(
                    scale: animation.value,
                    child: Opacity(opacity: animation.value, child: child),
                  ),
          CustomQuickAlertAnimType.rotate:
              (Animation<double> animation, Widget child) => Transform.rotate(
                    angle: animation.value * 6.28,
                    child: Opacity(opacity: animation.value, child: child),
                  ),
          CustomQuickAlertAnimType.slideInDown: (
            Animation<double> animation,
            Widget child,
          ) =>
              SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                        .animate(animation),
                child: Opacity(opacity: animation.value, child: child),
              ),
          CustomQuickAlertAnimType.slideInUp: (
            Animation<double> animation,
            Widget child,
          ) =>
              SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                        .animate(animation),
                child: Opacity(opacity: animation.value, child: child),
              ),
          CustomQuickAlertAnimType.slideInLeft: (
            Animation<double> animation,
            Widget child,
          ) =>
              SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                        .animate(animation),
                child: Opacity(opacity: animation.value, child: child),
              ),
          CustomQuickAlertAnimType.slideInRight: (
            Animation<double> animation,
            Widget child,
          ) =>
              SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                        .animate(animation),
                child: Opacity(opacity: animation.value, child: child),
              ),
          CustomQuickAlertAnimType.slide: (
            Animation<double> animation,
            Widget child,
          ) =>
              SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                        .animate(animation),
                child: Opacity(opacity: animation.value, child: child),
              ),
          CustomQuickAlertAnimType.fade:
              (Animation<double> animation, Widget child) => Opacity(
                    opacity: animation.value,
                    child: child,
                  ),
          CustomQuickAlertAnimType.none: (_, Widget child) => child,
          CustomQuickAlertAnimType.custom:
              (Animation<double> animation, Widget child) => Opacity(
                    opacity: animation.value,
                    child: child,
                  ),
        };

        return animations[animType ?? CustomQuickAlertAnimType.scale]
                ?.call(animation, child) ??
            Transform.scale(
              scale: animation.value,
              child: Opacity(opacity: animation.value, child: child),
            );
      },
    );
    if (timer != null && timer.isActive) {
      timer.cancel();
    }
  }

  /// Displays a custom alert dialog with your own widget.
  /// Dismisses the currently displayed CustomQuickAlert dialog.
  /// If [animated] is true, the dialog will be dismissed with an animation.
  static void dismiss({bool animated = true}) {
    if (customQuickAlertNavigatorKey.currentState?.canPop() ?? false) {
      customQuickAlertNavigatorKey.currentState?.pop();
    }
  }
}
