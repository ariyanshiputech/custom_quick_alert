import 'package:flutter/material.dart';

/// A custom button widget for alert dialogs.
class CustomQuickAlertButton extends StatelessWidget {
  /// Creates a CustomQuickAlertButton.
  const CustomQuickAlertButton({
    required this.text, required this.color, required this.textColor, required this.onPressed, super.key,
    this.isOutlined = false,
  });

  /// The text to display on the button
  final String text;

  /// The background color of the button
  final Color color;

  /// The text color of the button
  final Color textColor;

  /// Callback when the button is pressed
  final VoidCallback onPressed;

  /// Whether this button should be outlined instead of filled
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color, width: 1.5),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}
