import 'dart:async';
import 'package:flutter/material.dart';
import 'enums/custom_quick_alert_type.dart';
import 'utils/custom_quick_alert_assets.dart';

class AlertContent extends StatelessWidget {
  final CustomQuickAlertType type;
  final String? title;
  final String? message;
  final String? lottieAsset;
  final Widget? customContent;
  final bool showCancel;
  final bool showConfirm;
  final String confirmText;
  final String cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Color confirmTextColor;
  final Color cancelTextColor;
  final Color confirmBtnColor;
  final Color cancelBtnColor;
  final Color titleColor;
  final Color messageColor;
  final double borderRadius;
  final double? width;
  final Timer? timer;

  const AlertContent({
    super.key, 
    required this.type,
    this.title,
    this.message,
    this.lottieAsset,
    this.customContent,
    required this.showCancel,
    required this.showConfirm,
    required this.confirmText,
    required this.confirmTextColor,
    required this.cancelText,
    required this.cancelTextColor,
    this.onConfirm,
    this.onCancel,
    required this.confirmBtnColor,
    required this.cancelBtnColor,
    required this.titleColor,
    required this.messageColor,
    required this.borderRadius,
    this.width,
    this.timer,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (lottieAsset != null)
            CustomQuickAlertAssets.lottie(
              lottieAsset!,
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
          if (title != null)
          const SizedBox(height: 20),
            Text(
              title!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
              textAlign: TextAlign.center,
            ),
          if (message != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                message!,
                style: TextStyle(color: messageColor),
                textAlign: TextAlign.center,
              ),
            ),
          if (customContent != null) customContent!,
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showCancel)
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: cancelBtnColor,
                  ),
                  onPressed: () {
                    timer?.cancel();
                    onCancel?.call();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Text(
                    cancelText,
                    style: TextStyle(color: cancelTextColor),
                  ),
                ),
              if (showCancel && showConfirm) const SizedBox(width: 10),
              if (showConfirm)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: confirmBtnColor,
                  ),
                  onPressed: () {
                    timer?.cancel();
                    onConfirm?.call();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Text(
                    confirmText,
                    style: TextStyle(color: confirmTextColor),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
