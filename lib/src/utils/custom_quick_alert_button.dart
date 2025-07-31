import 'package:flutter/material.dart';

/// A reusable button widget for the CustomQuickAlert.
///
/// Can be either a filled [ElevatedButton] or an [OutlinedButton].
class CustomQuickAlertButton extends StatelessWidget {
  /// The text to display on the button.
  final String text;

  /// The callback to execute when the button is tapped.
  final VoidCallback onTap;

  /// Determines if the button is filled or outlined.
  final bool isFilled;

  /// The background color of the button.
  final Color? buttonColor;

  /// The text color of the button.
  final Color? textColor;

  const CustomQuickAlertButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isFilled = true,
    this.buttonColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: isFilled
          ? ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor ?? Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          : OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: buttonColor ?? Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor ?? buttonColor ?? Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
    );
  }
}
