import 'dart:async';

import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomQuickAlert {
  CustomQuickAlert._(); // Private constructor to prevent instantiation

  /// Global navigator key used for displaying alerts
  static GlobalKey<NavigatorState>? _navigatorKey;

  static void initialize(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  /// Get the current context from the navigator key
  static BuildContext? get _context => _navigatorKey?.currentState?.context;

  /// Check if CustomQuickAlert has been properly initialized
  static bool get isInitialized => _navigatorKey != null;

  /// Get the current navigator state (for advanced usage)
  static NavigatorState? get navigatorState => _navigatorKey?.currentState;

  /// Get appropriate fallback icon for alert type
  static IconData _getIconForType(CustomQuickAlertType type) {
    switch (type) {
      case CustomQuickAlertType.success:
        return Icons.check_circle;
      case CustomQuickAlertType.error:
        return Icons.error;
      case CustomQuickAlertType.warning:
        return Icons.warning;
      case CustomQuickAlertType.info:
        return Icons.info;
      case CustomQuickAlertType.confirm:
        return Icons.help;
      case CustomQuickAlertType.loading:
        return Icons.hourglass_empty;
      case CustomQuickAlertType.custom:
        return Icons.star;
    }
  }

  /// Displays a professional success alert with a green theme and check animation.
  static Future<void> success({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimationType? animationType,
    CustomQuickAlertPosition? position,
    Duration? autoCloseDuration,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    Color? confirmBtnColor,
    Color? cancelBtnColor,
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    Color? confirmTextColor,
    Color? cancelTextColor,
    double? borderRadius,
    double? width,
    EdgeInsets? padding,
    bool disableBackButton = false,
    // Enhanced customization parameters
    bool useGradientButtons = true,
    List<BoxShadow>? customShadows,
    Widget? customContent,
    bool? repeatAnimation,
  }) =>
      _showAlert(
        type: CustomQuickAlertType.success,
        title: title ?? 'Success!',
        message: message,
        lottieAsset: lottieAsset,
        animationType: animationType,
        position: position,
        autoCloseDuration: autoCloseDuration,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmText: confirmText,
        cancelText: cancelText,
        barrierDismissible: barrierDismissible,
        showCancel: showCancel,
        showConfirm: showConfirm,
        confirmBtnColor: confirmBtnColor ?? const Color(0xFF4CAF50),
        cancelBtnColor: cancelBtnColor ?? const Color(0xFF757575),
        backgroundColor: backgroundColor ?? Colors.white,
        titleColor: titleColor ?? const Color(0xFF2E7D32),
        messageColor: messageColor ?? const Color(0xFF424242),
        confirmTextColor: confirmTextColor ?? Colors.white,
        cancelTextColor: cancelTextColor ?? Colors.white,
        borderRadius: borderRadius ?? 16.0,
        width: width,
        padding: padding,
        disableBackButton: disableBackButton,
        useGradientButtons: useGradientButtons,
        customShadows: customShadows,
        customContent: customContent,
        repeatAnimation: repeatAnimation,
      );

  /// Displays an error alert with a red theme and error animation.
  static Future<void> error({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimationType? animationType,
    CustomQuickAlertPosition? position,
    Duration? autoCloseDuration,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    Color? confirmBtnColor,
    Color? cancelBtnColor,
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    Color? confirmTextColor,
    Color? cancelTextColor,
    double? borderRadius,
    double? width,
    EdgeInsets? padding,
    bool disableBackButton = false,
    // Enhanced customization parameters
    bool useGradientButtons = true,
    List<BoxShadow>? customShadows,
    Widget? customContent,
    bool? repeatAnimation,
  }) =>
      _showAlert(
        type: CustomQuickAlertType.error,
        title: title ?? 'Error!',
        message: message,
        lottieAsset: lottieAsset,
        animationType: animationType,
        position: position,
        autoCloseDuration: autoCloseDuration,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmText: confirmText,
        cancelText: cancelText,
        barrierDismissible: barrierDismissible,
        showCancel: showCancel,
        showConfirm: showConfirm,
        confirmBtnColor: confirmBtnColor ?? const Color(0xFFF44336),
        cancelBtnColor: cancelBtnColor ?? const Color(0xFF757575),
        backgroundColor: backgroundColor ?? Colors.white,
        titleColor: titleColor ?? const Color(0xFFD32F2F),
        messageColor: messageColor ?? const Color(0xFF424242),
        confirmTextColor: confirmTextColor ?? Colors.white,
        cancelTextColor: cancelTextColor ?? Colors.white,
        borderRadius: borderRadius ?? 16.0,
        width: width,
        padding: padding,
        disableBackButton: disableBackButton,
        useGradientButtons: useGradientButtons,
        customShadows: customShadows,
        customContent: customContent,
        repeatAnimation: repeatAnimation,
      );

  /// Displays a warning alert with an orange theme and warning animation.
  static Future<void> warning({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimationType? animationType,
    CustomQuickAlertPosition? position,
    Duration? autoCloseDuration,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    Color? confirmBtnColor,
    Color? cancelBtnColor,
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    Color? confirmTextColor,
    Color? cancelTextColor,
    double? borderRadius,
    double? width,
    EdgeInsets? padding,
    bool disableBackButton = false,
    // Enhanced customization parameters
    bool useGradientButtons = true,
    List<BoxShadow>? customShadows,
    Widget? customContent,
    bool? repeatAnimation,
  }) =>
      _showAlert(
        type: CustomQuickAlertType.warning,
        title: title ?? 'Warning!',
        message: message,
        lottieAsset: lottieAsset,
        animationType: animationType,
        position: position,
        autoCloseDuration: autoCloseDuration,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmText: confirmText,
        cancelText: cancelText,
        barrierDismissible: barrierDismissible,
        showCancel: showCancel,
        showConfirm: showConfirm,
        confirmBtnColor: confirmBtnColor ?? const Color(0xFFFF9800),
        cancelBtnColor: cancelBtnColor ?? const Color(0xFF757575),
        backgroundColor: backgroundColor ?? Colors.white,
        titleColor: titleColor ?? const Color(0xFFE65100),
        messageColor: messageColor ?? const Color(0xFF424242),
        confirmTextColor: confirmTextColor ?? Colors.white,
        cancelTextColor: cancelTextColor ?? Colors.white,
        borderRadius: borderRadius ?? 16.0,
        width: width,
        padding: padding,
        disableBackButton: disableBackButton,
        useGradientButtons: useGradientButtons,
        customShadows: customShadows,
        customContent: customContent,
        repeatAnimation: repeatAnimation,
      );

  /// Displays an info alert with a blue theme and info animation.
  static Future<void> info({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimationType? animationType,
    CustomQuickAlertPosition? position,
    Duration? autoCloseDuration,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    Color? confirmBtnColor,
    Color? cancelBtnColor,
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    Color? confirmTextColor,
    Color? cancelTextColor,
    double? borderRadius,
    double? width,
    EdgeInsets? padding,
    bool disableBackButton = false,
    // Enhanced customization parameters
    bool useGradientButtons = true,
    bool showAnimationContainer = true,
    Color? animationContainerColor,
    List<BoxShadow>? customShadows,
    Widget? customContent,
    bool? repeatAnimation,
  }) =>
      _showAlert(
        type: CustomQuickAlertType.info,
        title: title ?? 'Info',
        message: message,
        lottieAsset: lottieAsset,
        animationType: animationType,
        position: position,
        autoCloseDuration: autoCloseDuration,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmText: confirmText,
        cancelText: cancelText,
        barrierDismissible: barrierDismissible,
        showCancel: showCancel,
        showConfirm: showConfirm,
        confirmBtnColor: confirmBtnColor ?? const Color(0xFF2196F3),
        cancelBtnColor: cancelBtnColor ?? const Color(0xFF757575),
        backgroundColor: backgroundColor ?? Colors.white,
        titleColor: titleColor ?? const Color(0xFF1976D2),
        messageColor: messageColor ?? const Color(0xFF424242),
        confirmTextColor: confirmTextColor ?? Colors.white,
        cancelTextColor: cancelTextColor ?? Colors.white,
        borderRadius: borderRadius ?? 16.0,
        width: width,
        padding: padding,
        disableBackButton: disableBackButton,
        useGradientButtons: useGradientButtons,
        customShadows: customShadows,
        customContent: customContent,
        repeatAnimation: repeatAnimation,
      );

  /// Displays a confirmation dialog with both cancel and confirm buttons.
  static Future<void> confirm({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimationType? animationType,
    CustomQuickAlertPosition? position,
    Duration? autoCloseDuration,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String confirmText = 'Yes',
    String cancelText = 'No',
    bool barrierDismissible = false,
    bool showCancel = true, // Default true for confirm dialogs
    bool showConfirm = true,
    Color? confirmBtnColor,
    Color? cancelBtnColor,
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    Color? confirmTextColor,
    Color? cancelTextColor,
    double? borderRadius,
    double? width,
    EdgeInsets? padding,
    bool disableBackButton = false,
    // Enhanced customization parameters
    bool useGradientButtons = true,
    bool showAnimationContainer = true,
    Color? animationContainerColor,
    List<BoxShadow>? customShadows,
    Widget? customContent,
    bool? repeatAnimation,
  }) =>
      _showAlert(
        type: CustomQuickAlertType.confirm,
        title: title,
        message: message,
        lottieAsset: lottieAsset,
        animationType: animationType,
        position: position,
        autoCloseDuration: autoCloseDuration,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmText: confirmText,
        cancelText: cancelText,
        barrierDismissible: barrierDismissible,
        showCancel: showCancel,
        showConfirm: showConfirm,
        confirmBtnColor: confirmBtnColor ?? const Color(0xFF3F51B5),
        cancelBtnColor: cancelBtnColor ?? const Color(0xFF757575),
        backgroundColor: backgroundColor ?? Colors.white,
        titleColor: titleColor ?? const Color(0xFF303F9F),
        messageColor: messageColor ?? const Color(0xFF424242),
        confirmTextColor: confirmTextColor ?? Colors.white,
        cancelTextColor: cancelTextColor ?? Colors.white,
        borderRadius: borderRadius ?? 16.0,
        width: width,
        padding: padding,
        disableBackButton: disableBackButton,
        customContent: customContent,
        repeatAnimation: repeatAnimation,
        useGradientButtons: useGradientButtons,
      );

  /// Displays a loading dialog with a spinner and optional message.
  static Future<void> loading({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimationType? animationType,
    CustomQuickAlertPosition? position,
    Color? backgroundColor,
    double? borderRadius,
    double width = 150.0,
    EdgeInsets? padding = const EdgeInsets.all(20),
    bool barrierDismissible = false,
    bool? repeatAnimation = true,
  }) =>
      _showAlert(
        type: CustomQuickAlertType.loading,
        title: title,
        message: message,
        lottieAsset: lottieAsset,
        position: position,
        backgroundColor: backgroundColor ?? Colors.white,
        titleColor: const Color(0xFF455A64),
        messageColor: const Color(0xFF424242),
        confirmBtnColor: const Color(0xFF607D8B),
        cancelBtnColor: const Color(0xFF757575),
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.white,
        borderRadius: borderRadius ?? 16.0,
        width: width,
        padding: padding,
        barrierDismissible: barrierDismissible,
        disableBackButton: true,
        animationType: animationType ?? CustomQuickAlertAnimationType.scale,
        useGradientButtons: false,
        repeatAnimation: true,
      );

  /// Displays a fully customizable alert.
  static Future<void> custom({
    String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimationType? animationType,
    CustomQuickAlertPosition? position,
    Duration? autoCloseDuration,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = true,
    Color? confirmBtnColor,
    Color? cancelBtnColor,
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    Color? confirmTextColor,
    Color? cancelTextColor,
    double? borderRadius,
    double? width,
    EdgeInsets? padding,
    bool disableBackButton = false,
    // Enhanced customization parameters
    bool useGradientButtons = true,
    bool showAnimationContainer = true,
    Color? animationContainerColor,
    List<BoxShadow>? customShadows,
    Widget? customContent,
    bool? repeatAnimation,
  }) =>
      _showAlert(
        type: CustomQuickAlertType.custom,
        title: title,
        message: message,
        lottieAsset: lottieAsset,
        animationType: animationType,
        position: position,
        autoCloseDuration: autoCloseDuration,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmText: confirmText,
        cancelText: cancelText,
        barrierDismissible: barrierDismissible,
        showCancel: showCancel,
        showConfirm: showConfirm,
        confirmBtnColor: confirmBtnColor ?? const Color(0xFF9C27B0),
        cancelBtnColor: cancelBtnColor ?? const Color(0xFF757575),
        backgroundColor: backgroundColor ?? Colors.white,
        titleColor: titleColor ?? const Color(0xFF7B1FA2),
        messageColor: messageColor ?? const Color(0xFF424242),
        confirmTextColor: confirmTextColor ?? Colors.white,
        cancelTextColor: cancelTextColor ?? Colors.white,
        borderRadius: borderRadius ?? 16.0,
        width: width,
        padding: padding,
        disableBackButton: disableBackButton,
        useGradientButtons: useGradientButtons,
        customShadows: customShadows,
        customContent: customContent,
        repeatAnimation: repeatAnimation,
      );

  /// Dismisses the currently displayed alert dialog.
  static bool dismiss() {
    if (!isInitialized) {
      return false;
    }

    if (_navigatorKey?.currentState?.canPop() ?? false) {
      _navigatorKey!.currentState!.pop();
      return true;
    }
    return false;
  }

  // ============================================
  // WIDGET VERSIONS - Return widgets for use in build methods
  // ============================================

  /// Returns a success alert widget that can be used in widget tree
  static Widget pageAlert({
    required CustomQuickAlertType type,
   String? title,
    String? message,
    String? lottieAsset,
    CustomQuickAlertAnimationType? animationType,
    CustomQuickAlertPosition? position,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    bool? showCancel = false,
    bool? showConfirm = true,
    Color? confirmBtnColor,
    Color? cancelBtnColor,
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    Color? confirmTextColor,
    Color? cancelTextColor,
    double? borderRadius,
    double? width,
    EdgeInsets? padding,
    // Enhanced customization parameters
    bool useGradientButtons = true,
    bool showAnimationContainer = true,
    Color? animationContainerColor,
    List<BoxShadow>? customShadows,
    Widget? customContent,
    bool? repeatAnimation,
  }) {
    return CustomQuickAlertPageWidget(
      type: type,
        title: title,
        message: message,
        lottieAsset: lottieAsset,
        animationType: animationType,
        position: position,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmText: confirmText,
        cancelText: cancelText,
        showCancel: showCancel,
        showConfirm: showConfirm,
        confirmBtnColor: confirmBtnColor ?? _getColorsForType(type),
        cancelBtnColor: cancelBtnColor ?? _getColorsForType(type),
        backgroundColor: backgroundColor ?? Colors.white,
        titleColor: titleColor ??   _getColorsForType(type),
        messageColor: messageColor ?? Colors.black87,
        confirmTextColor: confirmTextColor ?? Colors.white,
        cancelTextColor: cancelTextColor ?? Colors.white,
        borderRadius: borderRadius ?? 16.0,
        width: width,
        padding: padding,
        customContent: customContent,
        useGradientButtons: useGradientButtons,
        repeatAnimation: repeatAnimation,
        customShadows: customShadows,
        );
  
  }

  static EdgeInsets _getMarginForPosition(CustomQuickAlertPosition? position) {
    switch (position ?? CustomQuickAlertPosition.center) {
      case CustomQuickAlertPosition.top:
        return const EdgeInsets.only(top: 100, left: 20, right: 20);
      case CustomQuickAlertPosition.bottom:
        return const EdgeInsets.only(bottom: 100, left: 20, right: 20);
      case CustomQuickAlertPosition.center:
        return const EdgeInsets.symmetric(horizontal: 20);
    }
  }

  static MaterialColor _getColorsForType(CustomQuickAlertType type) {
    switch (type) {
      case CustomQuickAlertType.success:
        return Colors.green;
      case CustomQuickAlertType.error:
        return Colors.red;
      case CustomQuickAlertType.warning:
        return Colors.orange;
      case CustomQuickAlertType.info:
        return Colors.blue;
      case CustomQuickAlertType.confirm:
        return Colors.purple;
      case CustomQuickAlertType.loading:
        return Colors.grey;
      case CustomQuickAlertType.custom:
        return Colors.pink;
    }
  }

  /// Creates the appropriate animation for the dialog based on animation type
  static Widget _buildAnimatedDialog({
    required Widget child,
    required Animation<double> animation,
    required CustomQuickAlertAnimationType? animationType,
  }) {
    // Create a properly clamped animation to prevent values outside [0.0, 1.0]
    final clampedAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: Curves
          .linear, // Use linear for the base animation to avoid curve conflicts
    ));

    switch (animationType ?? CustomQuickAlertAnimationType.scale) {
      case CustomQuickAlertAnimationType.scale:
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(CurvedAnimation(
            parent: clampedAnimation,
            curve: Curves.elasticOut,
          )),
          child: child,
        );
      case CustomQuickAlertAnimationType.fade:
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(CurvedAnimation(
            parent: clampedAnimation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );
      case CustomQuickAlertAnimationType.slideInDown:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: clampedAnimation,
            curve: Curves.easeOutCubic,
          )),
          child: child,
        );
      case CustomQuickAlertAnimationType.slideInUp:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: clampedAnimation,
            curve: Curves.easeOutCubic,
          )),
          child: child,
        );
      case CustomQuickAlertAnimationType.slideInLeft:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: clampedAnimation,
            curve: Curves.easeOutCubic,
          )),
          child: child,
        );
      case CustomQuickAlertAnimationType.slideInRight:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: clampedAnimation,
            curve: Curves.easeOutCubic,
          )),
          child: child,
        );
      case CustomQuickAlertAnimationType.rotate:
        return RotationTransition(
          turns: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(CurvedAnimation(
            parent: clampedAnimation,
            curve: Curves.easeOutQuart,
          )),
          child: child,
        );
      case CustomQuickAlertAnimationType.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: clampedAnimation,
            curve: Curves.easeOutCubic,
          )),
          child: child,
        );
      case CustomQuickAlertAnimationType.none:
        return child; // No animation, just return the child directly
      case CustomQuickAlertAnimationType.custom:
        return child; // No animation, just return the child directly
    }
  }

  /// Internal method to show the alert with enhanced dialog functionality.
  ///
  /// This method handles all the complex styling, positioning, and animation
  /// logic while maintaining a clean public API.
  static Future<void> _showAlert({
    required CustomQuickAlertType type,
   Color? confirmBtnColor,
   Color? cancelBtnColor,
   Color? backgroundColor,
   Color? titleColor,
   Color? messageColor,
   Color? confirmTextColor,
   Color? cancelTextColor,
   double? borderRadius,
   String? title,
   String? message,
   String? lottieAsset,
    CustomQuickAlertAnimationType? animationType,
    CustomQuickAlertPosition? position,
    Duration? autoCloseDuration,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    bool barrierDismissible = false,
    bool showCancel = false,
    bool showConfirm = false,
    double? width,
    EdgeInsets? padding,
    bool disableBackButton = false,
    // Enhanced customization parameters
    bool useGradientButtons = true,
    List<BoxShadow>? customShadows,
    Widget? customContent, 
    bool? repeatAnimation,
  }) async {
    final BuildContext? context = _context;
    if (context == null) {
      throw StateError(
        'CustomQuickAlert not initialized. Call CustomQuickAlert.initialize(navigatorKey) first. '
        'Make sure to:\n'
        '1. Create a GlobalKey<NavigatorState>\n'
        '2. Call CustomQuickAlert.initialize(navigatorKey)\n'
        '3. Set navigatorKey in your MaterialApp',
      );
    }

    // Validate parameters
    if (borderRadius! < 0) {
      throw ArgumentError.value(
          borderRadius, 'borderRadius', 'Must be non-negative');
    }
    if (width != null && width <= 0) {
      throw ArgumentError.value(width, 'width', 'Must be positive');
    }

    // Use default asset if none provided and validate custom assets
    final String assetPath =
        lottieAsset ?? CustomQuickAlertAssetHelper.getDefaultAsset(type);

    // Validate custom asset path if provided
    if (lottieAsset != null &&
        !CustomQuickAlertAssetHelper.isValidAssetPath(lottieAsset)) {
      throw ArgumentError.value(lottieAsset, 'lottieAsset',
          'Invalid asset path. Must end with .json or .zip');
    }

    // Auto-close timer with proper cleanup
    Timer? timer;
    if (autoCloseDuration != null && autoCloseDuration.inMilliseconds > 0) {
      timer = Timer(autoCloseDuration, () {
        if (_navigatorKey?.currentState?.canPop() ?? false) {
          _navigatorKey!.currentState!.pop();
        }
      });
    }

    // Position-based alignment
    final Alignment dialogAlignment;
    switch (position) {
      case CustomQuickAlertPosition.top:
        dialogAlignment = Alignment.topCenter;
      case CustomQuickAlertPosition.bottom:
        dialogAlignment = Alignment.bottomCenter;
      case CustomQuickAlertPosition.center:
        dialogAlignment = Alignment.center;
      case null:
        dialogAlignment = Alignment.center;
    }

    // Build the dialog content
    final Widget dialogContent = PopScope(
      canPop: !disableBackButton,
      child: Align(
        alignment: dialogAlignment,
        child: Container(
          margin: _getMarginForPosition(position),
          child: Material(
            type: MaterialType.transparency,
            child: type != CustomQuickAlertType.loading ||
                    title != null ||
                    message != null
                ? Container(
                    width: (width ?? MediaQuery.of(context).size.width * 0.85)
                        .clamp(280.0, MediaQuery.of(context).size.width - 40),
                    constraints: const BoxConstraints(
                      maxWidth: 400, // Professional max width
                      minWidth: 280, // Minimum usable width
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(borderRadius),
                      boxShadow: customShadows ??
                          <BoxShadow>[
                            // Primary shadow for depth
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                            // Secondary shadow for ambient lighting
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 40,
                              offset: const Offset(0, 20),
                            ),
                            // Top highlight for glass effect
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.05),
                              blurRadius: 1,
                              offset: const Offset(0, -1),
                            ),
                          ],
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.12),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius),
                      child: Container(
                        padding: padding ?? const EdgeInsets.all(28),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Professional Lottie Animation with error handling
                            if (assetPath.isNotEmpty)
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Lottie.asset(
                                  assetPath,
                                  repeat: repeatAnimation ?? true,
                                  animate: true,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.contain,
                                  errorBuilder: (BuildContext context,
                                      Object error, StackTrace? stackTrace) {
                                    // Fallback to a simple icon if Lottie fails
                                    return Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color:
                                            titleColor!.withValues(alpha: 0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        _getIconForType(type),
                                        size: 60,
                                        color: titleColor,
                                      ),
                                    );
                                  },
                                ),
                              ),

                            // Title with enhanced typography
                            if (title != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: titleColor,
                                    letterSpacing: -0.5,
                                    height: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                            // Message with enhanced typography
                            if (message != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 28),
                                child: Text(
                                  message,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: messageColor,
                                    height: 1.5,
                                    letterSpacing: 0.1,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            // Custom content widget if provided
                            if (customContent != null)
                              customContent
                            else
                              const SizedBox.shrink(),
                            // Professional Enhanced Buttons with modern design
                            if (showCancel || showConfirm)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: <Widget>[
                                    if (showCancel)
                                      Expanded(
                                        child: Container(
                                          height: 52,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            border: Border.all(
                                              color: cancelBtnColor!.withValues(
                                                  alpha: 0.3),
                                              width: 1.5,
                                            ),
                                            color: Colors.transparent,
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              onTap: () {
                                                timer?.cancel();
                                                onCancel?.call();
                                                Navigator.of(context).pop();
                                              },
                                              splashColor: cancelBtnColor
                                                  .withValues(alpha: 0.1),
                                              highlightColor: cancelBtnColor
                                                  .withValues(alpha: 0.05),
                                              child: Center(
                                                child: Text(
                                                  cancelText,
                                                  style: TextStyle(
                                                    color: cancelBtnColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (showCancel && showConfirm)
                                      const SizedBox(width: 16),
                                    if (showConfirm)
                                      Expanded(
                                        child: Container(
                                          height: 52,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            gradient: useGradientButtons
                                                ? LinearGradient(
                                                    colors: <Color>[
                                                      confirmBtnColor!,
                                                      confirmBtnColor.withValues(
                                                          alpha: 0.85),
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  )
                                                : null,
                                            color: useGradientButtons
                                                ? null
                                                : confirmBtnColor,
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: confirmBtnColor!.withValues(alpha: 0.4),
                                                blurRadius: 12,
                                                offset: const Offset(0, 4),
                                              ),
                                              BoxShadow(
                                                color: confirmBtnColor.withValues(alpha: 0.2),
                                                blurRadius: 8,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              onTap: () {
                                                timer?.cancel();
                                                onConfirm?.call();
                                                Navigator.of(context).pop();
                                              },
                                              splashColor: Colors.white
                                                  .withValues(alpha: 0.2),
                                              highlightColor: Colors.white
                                                  .withValues(alpha: 0.1),
                                              child: Center(
                                                child: Text(
                                                  confirmText,
                                                  style: TextStyle(
                                                    color: confirmTextColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(borderRadius),
                      boxShadow: customShadows ?? [],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      child: Lottie.asset(
                        assetPath,
                        repeat: type == CustomQuickAlertType.loading,
                        animate: true,
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          // Fallback to a simple icon if Lottie fails
                          return Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: titleColor!.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _getIconForType(type),
                              size: 60,
                              color: titleColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );

    await showGeneralDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      barrierLabel: 'CustomQuickAlert',
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return _buildAnimatedDialog(
          child: child,
          animation: animation,
          animationType: animationType,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return dialogContent;
      },
    );
    // Clean up the timer if it was created

    timer?.cancel();
  }
}

/// Widget version of CustomQuickAlert that can be used in build methods
class CustomQuickAlertPageWidget extends StatefulWidget {
  const CustomQuickAlertPageWidget({
    required this.type, super.key,
    this.title,
    this.message,
    this.lottieAsset,
    this.animationType,
    this.position,
    this.onConfirm,
    this.confirmText,
    this.showConfirm,
    this.confirmBtnColor = const Color(0xFF4CAF50),
    this.backgroundColor = Colors.white,
    this.titleColor = const Color(0xFF2E7D32),
    this.messageColor = const Color(0xFF424242),
    this.confirmTextColor = Colors.white,
    this.width,
    this.padding,
    this.useGradientButtons = true,
    this.customShadows,
    this.customContent,
    this.onCancel,
    this.cancelText,
    this.showCancel,
    this.cancelBtnColor,
    this.repeatAnimation,
    this.cancelTextColor = Colors.white,
    this.borderRadius = 16.0,
  });

  final CustomQuickAlertType type;
  final String? title;
  final String? message;
  final String? lottieAsset;
  final CustomQuickAlertAnimationType? animationType;
  final CustomQuickAlertPosition? position;
  final VoidCallback? onConfirm;
  final String? confirmText;
  final bool? showConfirm;
  final Color? confirmBtnColor;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? messageColor;
  final Color? confirmTextColor;
  final double? width;
  final EdgeInsets? padding;
  final bool useGradientButtons;
  final List<BoxShadow>? customShadows;
  final Widget? customContent;
  final VoidCallback? onCancel;
  final String? cancelText;
  final bool? showCancel;
  final Color? cancelBtnColor;
  final bool? repeatAnimation;
  final Color? cancelTextColor;
  final double? borderRadius;
  

  @override
  State<CustomQuickAlertPageWidget> createState() =>
      CustomQuickAlertPageWidgetState();
}

class CustomQuickAlertPageWidgetState extends State<CustomQuickAlertPageWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late CustomQuickAlertType type;

  @override
  void initState() {
    super.initState();

    // Initialize animation with a safer curve
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic, // Use a curve that stays within bounds
    );

    // Start animation
    _animationController.forward();
    // Auto-close timer if needed
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get asset path
    final String assetPath = widget.lottieAsset ?? CustomQuickAlertAssetHelper.getDefaultAsset(widget.type);

    // Build the animated dialog content
    final Widget dialogContent = Container(
                    width: widget.width ?? MediaQuery.of(context).size.width * 0.85,
                    color: widget.backgroundColor ?? Colors.white,
                    padding: widget.padding ?? const EdgeInsets.all(28),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Professional Lottie Animation with error handling
                          if (assetPath.isNotEmpty)
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: Lottie.asset(
                                assetPath,
                                repeat: widget.repeatAnimation ?? true,
                                animate: true,
                                width: 120,
                                height: 120,
                                fit: BoxFit.contain,
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  // Fallback to a simple icon if Lottie fails
                                  return Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color:
                                          widget.titleColor!.withValues(alpha: 0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      CustomQuickAlert._getIconForType(
                                          widget.type),
                                      size: 60,
                                      color: widget.titleColor,
                                    ),
                                  );
                                },
                              ),
                            ),
        
                          // Title with enhanced typography
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              widget.title!,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: widget.titleColor,
                                letterSpacing: -0.5,
                                height: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
        
                          // Message with enhanced typography
                          Padding(
                            padding: const EdgeInsets.only(bottom: 28),
                            child: Text(
                              widget.message!,
                              style: TextStyle(
                                fontSize: 16,
                                color: widget.messageColor,
                                height: 1.5,
                                letterSpacing: 0.1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // Custom content widget if provided
                          if (widget.customContent != null)
                            widget.customContent!
                          else
                            const SizedBox.shrink(),
                          // Professional Enhanced Buttons with modern design
                          if ((widget.showCancel ?? false) || (widget.showConfirm ?? false))
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: <Widget>[
                                  if (widget.showCancel ?? false)
                                    Expanded(
                                      child: Container(
                                        height: 52,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          border: Border.all(
                                            color: widget.cancelBtnColor!.withValues(
                                                alpha: 0.3),
                                            width: 1.5,
                                          ),
                                          color: Colors.transparent,
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            onTap: () {
                                              
                                            },
                                            splashColor: widget.cancelBtnColor!
                                                .withValues(alpha: 0.1),
                                            highlightColor: widget.cancelBtnColor!
                                                .withValues(alpha: 0.05),
                                            child: Center(
                                              child: Text(
                                                widget.cancelText!,
                                                style: TextStyle(
                                                  color: widget.cancelBtnColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((widget.showCancel ?? false) && (widget.showConfirm ?? false))
                                    const SizedBox(width: 16),
                                  if (widget.showConfirm ?? false)
                                    Expanded(
                                      child: Container(
                                        height: 52,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          gradient: widget.useGradientButtons
                                              ? LinearGradient(
                                                  colors: <Color>[
                                                    widget.confirmBtnColor!,
                                                    widget.confirmBtnColor!
                                                        .withValues(
                                                            alpha: 0.85),
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                )
                                              : null,
                                          color: widget.useGradientButtons
                                              ? null
                                              : widget.confirmBtnColor,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: widget.confirmBtnColor!
                                                  .withValues(alpha: 0.4),
                                              blurRadius: 12,
                                              offset: const Offset(0, 4),
                                            ),
                                            BoxShadow(
                                              color: widget.confirmBtnColor!
                                                  .withValues(alpha: 0.2),
                                              blurRadius: 8,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            onTap: () {
                                              widget.onConfirm?.call();
                                            },
                                            splashColor: Colors.white
                                                .withValues(alpha: 0.2),
                                            highlightColor: Colors.white
                                                .withValues(alpha: 0.1),
                                            child: Center(
                                              child: Text(
                                                widget.confirmText!,
                                                style: TextStyle(
                                                  color: widget.confirmTextColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    );

    // Apply animation based on type
    return CustomQuickAlert._buildAnimatedDialog(
      child: dialogContent,
      animation: _animation,
      animationType: widget.animationType,
    );
  }
}

/// Extension on Color to allow for easier manipulation of alpha values.
extension ColorAlphaExtension on Color {
  /// Creates a new Color with the given alpha value.
  Color withValues({double? alpha}) {
    if (alpha == null) {
      return this;
    }
    return Color.fromRGBO(
      (r * 255.0).round() & 0xff,
      (g * 255.0).round() & 0xff,
      (b * 255.0).round() & 0xff,
      alpha.clamp(0.0, 1.0),
    );
  }
}
