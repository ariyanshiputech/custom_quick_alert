/// Defines the position where quick alerts can be displayed on screen.
enum CustomQuickAlertPosition {
  /// Display alert at the top of the screen
  /// Recommended for: Notifications, non-intrusive messages
  top,
  /// Display alert at the center of the screen (default)
  /// Recommended for: Important messages, confirmations, errors
  center,
  /// Display alert at the bottom of the screen
  /// Recommended for: Action confirmations, quick messages
  bottom,
}
