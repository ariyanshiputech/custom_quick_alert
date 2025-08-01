import 'package:custom_quick_alert/src/custom_quick_alert_navigator.dart';
import 'package:custom_quick_alert/src/enums/custom_quick_alert_type.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A utility class for showing and hiding a loading dialog.
///
/// This provides a simple way to display a full-screen loading indicator.
class CustomQuickAlertLoader {
  static BuildContext? _dialogContext;

  /// Displays the loading dialog.
  ///
  /// It uses the [customQuickAlertNavigatorKey] to show the dialog without a [BuildContext].
  static void showLoadingDialog({
    CustomQuickAlertType type = CustomQuickAlertType.loading,
    String? lottieAsset,
    Color? backgroundColor,
    double? borderRadius,
    double? width,
    double? height,
    EdgeInsets? padding,
  }) {
    if (customQuickAlertNavigatorKey.currentState == null) {
      debugPrint(
        '[CustomQuickAlert] navigatorKey is null. Make sure you have assigned customQuickAlertNavigatorKey to your MaterialApp\'s navigatorKey.',
      );
      return;
    }

    showDialog(
      context: customQuickAlertNavigatorKey.currentState!.overlay!.context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        _dialogContext = dialogContext;
        return PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            content: Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Lottie.asset(
                    'packages/custom_quick_alert/assets/animations/loading.json',
                    repeat: true,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Hides the currently displayed loading dialog.
  static void hideLoadingDialog() {
    if (_dialogContext != null) {
      Navigator.of(_dialogContext!, rootNavigator: true).pop();
      _dialogContext = null;
    }
  }
}
