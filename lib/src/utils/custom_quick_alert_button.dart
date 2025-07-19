import 'package:flutter/material.dart';

/// Provides pre-styled Elevated and Text buttons for Custom Quick Alert.
abstract class CustomQuickAlertButton {
  /// Private constructor.
  const CustomQuickAlertButton._();

  /// Creates a pre-styled ElevatedButton.
  static Widget elevated({
    required VoidCallback onPressed,
    required Widget child,
    bool disabled = false, required ButtonStyle style,
  }) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF272727),
        disabledForegroundColor: Colors.white,
        disabledBackgroundColor: const Color(0xFF524E4E),
        side: const BorderSide(color: Colors.grey),
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: child,
    );
  }

  /// Creates a pre-styled TextButton.
  static Widget text({
    required VoidCallback onPressed,
    required Widget child,
    bool disabled = false,
    bool dark = false,
  }) {
    return TextButton(
      onPressed: disabled ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: dark ? Colors.white : Colors.black,
        backgroundColor: Colors.transparent,
        disabledForegroundColor: Colors.grey,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: child,
    );
  }
}
