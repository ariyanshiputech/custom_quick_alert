/// Defines the animation types available for quick alerts.
///
/// These animations control how the alert appears on screen.
enum CustomQuickAlertAnimationType {
  /// Scale animation - alert scales from small to normal size
  /// Recommended for: Success, Error, Info alerts
  scale,

  /// Rotate animation - alert rotates while appearing
  /// Recommended for: Playful or attention-grabbing alerts
  rotate,

  /// Slide in from top animation
  /// Recommended for: Top-positioned alerts, notifications
  slideInDown,

  /// Slide in from bottom animation
  /// Recommended for: Bottom-positioned alerts, confirmations
  slideInUp,

  /// Slide in from left animation
  /// Recommended for: Side notifications
  slideInLeft,

  /// Slide in from right animation
  /// Recommended for: Side notifications
  slideInRight,

  /// Generic slide animation (same as slideInUp)
  /// Recommended for: General use
  slide,

  /// Fade animation - alert fades in
  /// Recommended for: Subtle alerts, loading states
  fade,

  /// No animation - alert appears instantly
  /// Recommended for: Performance-critical scenarios
  none,

  /// Custom animation - allows for custom implementation
  /// Recommended for: Special use cases with custom animations
  custom,
}
