import 'dart:async';
import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';

class AlertContent extends StatelessWidget
{
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
        this.timer, EdgeInsets? padding,
        bool? barrierDismissible,
        Color? backgroundColor,
        CustomQuickAlertAnimType? animType,
        bool? lottieRepeat,
        CustomQuickAlertPosition? position,
        Color? dialogBackgroundColor,
    });

    @override
    Widget build(BuildContext context)
    {
        final bool shouldRepeat = type == CustomQuickAlertType.loading;

        return Container(
            width: width ?? MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    if (lottieAsset != null)
                    CustomQuickAlertAssets.lottie(
                        // Display Lottie animation if provided
                        // Lottie animation for visual appeal
                        lottieAsset!,
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                        repeat: shouldRepeat,
                    ),
                    const SizedBox(height: 10),
                    if (title != null) // Display title if provided
                    Text(
                        // Title of the alert
                        title!,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: titleColor,
                        ),
                        textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    if (message != null) ...<Widget>[
                        // Display message if provided
                        Text(
                            // Message content of the alert
                            message!,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: messageColor),
                        ),
                    ],
                    if (customContent != null)
                    Padding(
                        // Display custom content if provided
                        padding: const EdgeInsets.only(top: 10.0),
                        child: customContent!, // Custom content if provided
                    ),
                    const SizedBox(height: 20),
                    Row(
                        // Buttons for actions
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            if (showCancel)
                            Expanded(
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        minimumSize: const Size(120, 45),
                                        foregroundColor: cancelBtnColor,
                                        side: BorderSide(color: cancelBtnColor),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                        ),
                                    ),
                                    onPressed: ()
                                    {
                                        timer?.cancel(); // Cancel auto-close timer
                                        onCancel?.call(); // Execute cancel callback
                                        Navigator.of(
                                            context,
                                            rootNavigator: true,
                                        ).pop(); // Dismiss the alert
                                    },
                                    child: Text(
                                        cancelText,
                                        style: TextStyle(color: cancelBtnColor, fontSize: 16),
                                    ),
                                ),
                            ),
                            if (showCancel && showConfirm) const SizedBox(width: 10),
                            if (showConfirm)
                            Expanded(
                                child: FilledButton(
                                    style: FilledButton.styleFrom(
                                        minimumSize: const Size(120, 45),
                                        backgroundColor: confirmBtnColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                        ),
                                        elevation: 2,
                                    ),
                                    onPressed: ()
                                    {
                                        timer?.cancel(); // Cancel auto-close timer
                                        onConfirm?.call(); // Execute confirm callback
                                        Navigator.of(
                                            context,
                                            rootNavigator: true,
                                        ).pop(); // Dismiss the alert
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                            confirmText,
                                            style: TextStyle(color: confirmTextColor, fontSize: 16),
                                        ),
                                    ),
                                ),
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}
