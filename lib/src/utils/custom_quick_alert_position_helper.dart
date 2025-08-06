import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';

/// Helper class for positioning alerts on screen
class CustomQuickAlertPositionHelper {
  CustomQuickAlertPositionHelper._(); // Private constructor

  /// Get alignment based on alert position
  static Alignment getAlignment(CustomQuickAlertPosition position) {
    switch (position) {
      case CustomQuickAlertPosition.top:
        return Alignment.topCenter;
      case CustomQuickAlertPosition.bottom:
        return Alignment.bottomCenter;
      case CustomQuickAlertPosition.center:
        return Alignment.center;
    }
  }

  /// Get margin based on alert position
  static EdgeInsets getMargin(CustomQuickAlertPosition position) {
    switch (position) {
      case CustomQuickAlertPosition.top:
        return const EdgeInsets.only(top: 50);
      case CustomQuickAlertPosition.bottom:
        return const EdgeInsets.only(bottom: 50);
      case CustomQuickAlertPosition.center:
        return EdgeInsets.zero;
    }
  }
}
