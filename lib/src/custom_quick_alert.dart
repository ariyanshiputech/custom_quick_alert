import 'dart:async';
import 'package:flutter/material.dart';

import 'alert_content.dart';
import 'enums/custom_quick_alert_type.dart';
import 'enums/custom_quick_alert_anim_type.dart';
import 'enums/custom_quick_alert_position.dart';
import 'utils/alignment_helper.dart';
import 'utils/default_lottie_helper.dart';

final GlobalKey<NavigatorState> customQuickAlertNavigatorKey =
    GlobalKey<NavigatorState>();

class CustomQuickAlert {
  static Future<void> success({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = true,
    bool showCancel = false,
    bool showConfirm = true,
    String confirmText = 'Okay',
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
    double borderRadius = 16,
    double? width,
    bool disableBackBtn = false,
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
      disableBackBtn: disableBackBtn,
    );
  }

  static Future<void> error({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = true,
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
    double borderRadius = 16,
    double? width,
    bool disableBackBtn = false,
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
      width: width,
      disableBackBtn: disableBackBtn,
    );
  }

  static Future<void> warning({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = true,
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
    double borderRadius = 16,
    double? width,
    bool disableBackBtn = false,
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
      width: width,
      disableBackBtn: disableBackBtn,
    );
  }

  static Future<void> info({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = true,
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
    double borderRadius = 16,
    double? width,
    bool disableBackBtn = false,
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
      width: width,
      disableBackBtn: disableBackBtn,
    );
  }

  static Future<void> confirm({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = true,
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
    double borderRadius = 16,
    double? width,
    bool disableBackBtn = false,
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
      width: width,
      disableBackBtn: disableBackBtn,
    );
  }
  static Future<void> loading({
    String? lottieAsset,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = false,
    bool disableBackBtn = true,
    Color backgroundColor = Colors.white,
    double borderRadius = 16.0,
    double? width,
  }) {
    return show(
      type: CustomQuickAlertType.loading,
      lottieAsset: lottieAsset,
      animType: animType,
      position: position,
      barrierDismissible: barrierDismissible,
      showCancel: false,
      showConfirm: false,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      width: width,
      disableBackBtn: disableBackBtn,
    );
  }

  static Future<void> show({
    required CustomQuickAlertType type,
    String? title,
    String? message,
    String? lottieAsset,
    Widget? customContent,
    CustomQuickAlertAnimType animType = CustomQuickAlertAnimType.scale,
    CustomQuickAlertPosition position = CustomQuickAlertPosition.center,
    bool barrierDismissible = true,
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
    double borderRadius = 16,
    double? width,
    bool disableBackBtn = false,
  }) async {
    final navigator = customQuickAlertNavigatorKey.currentState;
    if (navigator == null) {
      debugPrint('[CustomQuickAlert] navigatorKey is null!');
      return;
    }

    final resolvedLottie = lottieAsset ?? getDefaultLottieForType(type);

    Timer? timer;
    if (autoCloseDuration != null) {
      timer = Timer(autoCloseDuration, () {
        if (navigator.canPop()) navigator.pop();
      });
    }

    final Widget alertContent = AlertContent(
      type: type,
      title: title,
      message: message,
      lottieAsset: resolvedLottie,
      customContent: customContent,
      showCancel: showCancel || type == CustomQuickAlertType.confirm,
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
      borderRadius: borderRadius,
      width: width,
      timer: timer,
    );

final Widget alert = PopScope(
      canPop: !disableBackBtn,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) timer?.cancel();
      },
      child: Align(
        alignment: getAlignment(position),
        child: Material(
          color: Colors.transparent,
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
    );

    await showGeneralDialog(
      context: navigator.context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'CustomQuickAlert',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (_, anim, __, ___) {
        switch (animType) {
          case CustomQuickAlertAnimType.scale:
            return Transform.scale(
              scale: anim.value,
              child: Opacity(opacity: anim.value, child: alert),
            );
          case CustomQuickAlertAnimType.rotate:
            return Transform.rotate(
              angle: anim.value * 6.28,
              child: Opacity(opacity: anim.value, child: alert),
            );
          case CustomQuickAlertAnimType.slideInDown:
            final curved = Curves.easeInOutBack.transform(anim.value) - 1.0;
            return Transform.translate(
              offset: Offset(0, curved * 200),
              child: Opacity(opacity: anim.value, child: alert),
            );
          case CustomQuickAlertAnimType.slideInUp:
            final curved = Curves.easeInOutBack.transform(anim.value) - 1.0;
            return Transform.translate(
              offset: Offset(0, curved * -200),
              child: Opacity(opacity: anim.value, child: alert),
            );
          case CustomQuickAlertAnimType.slideInLeft:
            final curved = Curves.easeInOutBack.transform(anim.value) - 1.0;
            return Transform.translate(
              offset: Offset(curved * 200, 0),
              child: Opacity(opacity: anim.value, child: alert),
            );
          case CustomQuickAlertAnimType.slideInRight:
            final curved = Curves.easeInOutBack.transform(anim.value) - 1.0;
            return Transform.translate(
              offset: Offset(curved * -200, 0),
              child: Opacity(opacity: anim.value, child: alert),
            );
          default:
            return alert;
        }
      },
    );
  }
}
