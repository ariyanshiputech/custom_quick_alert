import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';

/// Helper class for managing alert animations.
class CustomQuickAlertAnimationHelper {
  CustomQuickAlertAnimationHelper._(); // Private constructor

  /// Builds the appropriate transition animation for the alert.
  static Widget buildTransition({
    required Animation<double> animation,
    required CustomQuickAlertAnimationType animationType,
    required Widget child,
  }) {
    switch (animationType) {
      case CustomQuickAlertAnimationType.scale:
        return _buildScaleTransition(animation, child);
      case CustomQuickAlertAnimationType.rotate:
        return _buildRotateTransition(animation, child);
      case CustomQuickAlertAnimationType.slideInDown:
        return _buildSlideTransition(animation, child, const Offset(0, -1));
      case CustomQuickAlertAnimationType.slideInUp:
        return _buildSlideTransition(animation, child, const Offset(0, 1));
      case CustomQuickAlertAnimationType.slideInLeft:
        return _buildSlideTransition(animation, child, const Offset(-1, 0));
      case CustomQuickAlertAnimationType.slideInRight:
        return _buildSlideTransition(animation, child, const Offset(1, 0));
      case CustomQuickAlertAnimationType.slide:
        return _buildSlideTransition(animation, child, const Offset(0, 1));
      case CustomQuickAlertAnimationType.fade:
        return _buildFadeTransition(animation, child);
      case CustomQuickAlertAnimationType.none:
        return child;
      case CustomQuickAlertAnimationType.custom:
        return _buildCustomTransition(animation, child);
    }
  }

  /// Scale transition with opacity
  static Widget _buildScaleTransition(
          Animation<double> animation, Widget child) =>
      ScaleTransition(
        scale: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        ),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );

  /// Rotate transition with opacity
  static Widget _buildRotateTransition(
          Animation<double> animation, Widget child) =>
      RotationTransition(
        turns: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        ),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );

  /// Slide transition with opacity
  static Widget _buildSlideTransition(
    Animation<double> animation,
    Widget child,
    Offset beginOffset,
  ) =>
      SlideTransition(
        position: Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        ),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );

  /// Fade transition
  static Widget _buildFadeTransition(
          Animation<double> animation, Widget child) =>
      FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );

  /// Custom transition (can be overridden for special effects)
  static Widget _buildCustomTransition(
      Animation<double> animation, Widget child) {
    // Default to scale transition for custom
    return _buildScaleTransition(animation, child);
  }

  /// Gets the recommended animation for an alert type
  static CustomQuickAlertAnimationType getRecommendedAnimation(String alertType) {
    switch (alertType.toLowerCase()) {
      case 'success':
        return CustomQuickAlertAnimationType.scale;
      case 'error':
        return CustomQuickAlertAnimationType.slideInDown;
      case 'warning':
        return CustomQuickAlertAnimationType.slideInUp;
      case 'info':
        return CustomQuickAlertAnimationType.fade;
      case 'confirm':
        return CustomQuickAlertAnimationType.scale;
      case 'loading':
        return CustomQuickAlertAnimationType.fade;
      default:
        return CustomQuickAlertAnimationType.scale;
    }
  }
}
