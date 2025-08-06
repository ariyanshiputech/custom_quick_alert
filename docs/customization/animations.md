# 🎨 Animation Types Guide

Master the art of alert animations with Custom Quick Alert's comprehensive animation system.

## 🎭 Available Animation Types

Custom Quick Alert provides 10 distinct animation types to create the perfect entrance effect for your alerts.

### 🌟 Scale Animation

The scale animation makes alerts appear by scaling from small to full size.

```dart
CustomQuickAlert.success(
  title: 'Welcome!',
  message: 'Account created successfully.',
  animationType: CustomQuickAlertAnimationType.scale,
);
```

**Characteristics:**
- ✨ **Effect:** Scales from 0% to 100%
- ⏱️ **Duration:** 300ms
- 📐 **Curve:** `Curves.elasticOut`
- 🎯 **Best For:** Success confirmations, important announcements

---

### 🔄 Rotate Animation

Creates a spinning entrance effect for playful or attention-grabbing alerts.

```dart
CustomQuickAlert.custom(
  title: 'Surprise!',
  message: 'You unlocked a new achievement!',
  animationType: CustomQuickAlertAnimationType.rotate,
);
```

**Characteristics:**
- ✨ **Effect:** Rotates 360° while appearing
- ⏱️ **Duration:** 300ms
- 📐 **Curve:** `Curves.easeOutQuart`
- 🎯 **Best For:** Achievements, celebrations, fun interactions

---

### ⬇️ Slide In Down

Alerts slide in smoothly from the top of the screen.

```dart
CustomQuickAlert.info(
  title: 'New Notification',
  message: 'You have 3 new messages.',
  animationType: CustomQuickAlertAnimationType.slideInDown,
  position: CustomQuickAlertPosition.top,
);
```

**Characteristics:**
- ✨ **Effect:** Slides from top (-100%) to position
- ⏱️ **Duration:** 300ms
- 📐 **Curve:** `Curves.easeOutCubic`
- 🎯 **Best For:** Top notifications, system messages

---

### ⬆️ Slide In Up

Alerts slide in from the bottom of the screen.

```dart
CustomQuickAlert.confirm(
  title: 'Save Changes?',
  message: 'Your document has unsaved changes.',
  animationType: CustomQuickAlertAnimationType.slideInUp,
  position: CustomQuickAlertPosition.bottom,
);
```

**Characteristics:**
- ✨ **Effect:** Slides from bottom (100%) to position
- ⏱️ **Duration:** 300ms
- 📐 **Curve:** `Curves.easeOutCubic`
- 🎯 **Best For:** Bottom confirmations, action sheets

---

### ⬅️ Slide In Left

Alerts slide in from the left side of the screen.

```dart
CustomQuickAlert.warning(
  title: 'Low Battery',
  message: 'Please charge your device.',
  animationType: CustomQuickAlertAnimationType.slideInLeft,
);
```

**Characteristics:**
- ✨ **Effect:** Slides from left (-100%) to center
- ⏱️ **Duration:** 300ms
- 📐 **Curve:** `Curves.easeOutCubic`
- 🎯 **Best For:** Side notifications, status updates

---

### ➡️ Slide In Right

Alerts slide in from the right side of the screen.

```dart
CustomQuickAlert.info(
  title: 'New Feature',
  message: 'Check out our latest update!',
  animationType: CustomQuickAlertAnimationType.slideInRight,
);
```

**Characteristics:**
- ✨ **Effect:** Slides from right (100%) to center
- ⏱️ **Duration:** 300ms
- 📐 **Curve:** `Curves.easeOutCubic`
- 🎯 **Best For:** Feature announcements, tips

---

### 📊 Generic Slide

A general-purpose slide animation (same as slideInUp).

```dart
CustomQuickAlert.error(
  title: 'Network Error',
  message: 'Please check your connection.',
  animationType: CustomQuickAlertAnimationType.slide,
);
```

**Characteristics:**
- ✨ **Effect:** Slides from bottom to center
- ⏱️ **Duration:** 300ms
- 📐 **Curve:** `Curves.easeOutCubic`
- 🎯 **Best For:** General purpose alerts

---

### 🌫️ Fade Animation

Creates a smooth fade-in effect for subtle appearances.

```dart
CustomQuickAlert.info(
  title: 'Auto-save Enabled',
  message: 'Your work is automatically saved.',
  animationType: CustomQuickAlertAnimationType.fade,
);
```

**Characteristics:**
- ✨ **Effect:** Fades from 0% to 100% opacity
- ⏱️ **Duration:** 300ms
- 📐 **Curve:** `Curves.easeInOut`
- 🎯 **Best For:** Subtle notifications, background updates

---

### ⚡ No Animation

Displays alerts instantly without any animation.

```dart
CustomQuickAlert.error(
  title: 'Critical Error',
  message: 'System failure detected.',
  animationType: CustomQuickAlertAnimationType.none,
);
```

**Characteristics:**
- ✨ **Effect:** Instant appearance
- ⏱️ **Duration:** 0ms
- 📐 **Curve:** None
- 🎯 **Best For:** Critical alerts, accessibility needs

---

### 🎨 Custom Animation

Placeholder for custom animations (currently displays without animation).

```dart
CustomQuickAlert.custom(
  title: 'Custom Alert',
  message: 'With custom animation.',
  animationType: CustomQuickAlertAnimationType.custom,
);
```

**Note:** Currently behaves the same as `none`. Future versions may support custom animation definitions.

---

## 🎯 Animation Best Practices

### Matching Animations with Positions

```dart
// ✅ Perfect Combinations
// Top notifications with slide down
CustomQuickAlert.info(
  position: CustomQuickAlertPosition.top,
  animationType: CustomQuickAlertAnimationType.slideInDown,
);

// Bottom confirmations with slide up
CustomQuickAlert.confirm(
  position: CustomQuickAlertPosition.bottom,
  animationType: CustomQuickAlertAnimationType.slideInUp,
);

// Center alerts with scale
CustomQuickAlert.success(
  position: CustomQuickAlertPosition.center,
  animationType: CustomQuickAlertAnimationType.scale,
);
```

### Animation by Alert Type

```dart
// Success - Celebration worthy
CustomQuickAlert.success(
  animationType: CustomQuickAlertAnimationType.scale, // or rotate
);

// Error - Attention grabbing but not jarring
CustomQuickAlert.error(
  animationType: CustomQuickAlertAnimationType.fade, // or scale
);

// Warning - Noticeable but not overwhelming
CustomQuickAlert.warning(
  animationType: CustomQuickAlertAnimationType.slideInDown,
);

// Info - Subtle and informative
CustomQuickAlert.info(
  animationType: CustomQuickAlertAnimationType.fade,
);

// Confirm - Clear and focused
CustomQuickAlert.confirm(
  animationType: CustomQuickAlertAnimationType.scale,
);

// Loading - Smooth and non-disruptive
CustomQuickAlert.loading(
  animationType: CustomQuickAlertAnimationType.fade,
);
```

### Performance Considerations

```dart
// ✅ Good: Use fade for frequent alerts
for (int i = 0; i < items.length; i++) {
  if (items[i].hasError) {
    CustomQuickAlert.error(
      title: 'Error in item $i',
      animationType: CustomQuickAlertAnimationType.fade, // Lightweight
      autoCloseDuration: Duration(seconds: 1),
    );
  }
}

// ❌ Avoid: Heavy animations for frequent alerts
// CustomQuickAlert.error(
//   animationType: CustomQuickAlertAnimationType.rotate, // Too heavy
// );
```

---

## 🎬 Animation Combinations

### Sequential Animations

```dart
Future<void> showWelcomeSequence() async {
  // Welcome message
  await CustomQuickAlert.success(
    title: 'Welcome!',
    message: 'Setting up your account...',
    animationType: CustomQuickAlertAnimationType.scale,
    autoCloseDuration: Duration(seconds: 2),
  );
  
  // Setup complete
  await CustomQuickAlert.info(
    title: 'Setup Complete',
    message: 'You\'re ready to get started!',
    animationType: CustomQuickAlertAnimationType.fade,
  );
}
```

### Position-based Animation Flow

```dart
Future<void> showNotificationFlow() async {
  // Top notification
  CustomQuickAlert.info(
    title: 'New Message',
    position: CustomQuickAlertPosition.top,
    animationType: CustomQuickAlertAnimationType.slideInDown,
    autoCloseDuration: Duration(seconds: 3),
  );
  
  await Future.delayed(Duration(seconds: 1));
  
  // Center confirmation
  await CustomQuickAlert.confirm(
    title: 'Mark as Read?',
    position: CustomQuickAlertPosition.center,
    animationType: CustomQuickAlertAnimationType.scale,
  );
  
  // Bottom success
  CustomQuickAlert.success(
    title: 'Marked as Read',
    position: CustomQuickAlertPosition.bottom,
    animationType: CustomQuickAlertAnimationType.slideInUp,
    autoCloseDuration: Duration(seconds: 2),
  );
}
```

---

## 🛠️ Advanced Animation Techniques

### Context-Aware Animations

```dart
void showContextualAlert(String context, String message) {
  CustomQuickAlertAnimationType animation;
  CustomQuickAlertPosition position;
  
  switch (context) {
    case 'notification':
      animation = CustomQuickAlertAnimationType.slideInDown;
      position = CustomQuickAlertPosition.top;
      break;
    case 'confirmation':
      animation = CustomQuickAlertAnimationType.scale;
      position = CustomQuickAlertPosition.center;
      break;
    case 'status':
      animation = CustomQuickAlertAnimationType.slideInUp;
      position = CustomQuickAlertPosition.bottom;
      break;
    default:
      animation = CustomQuickAlertAnimationType.fade;
      position = CustomQuickAlertPosition.center;
  }
  
  CustomQuickAlert.info(
    title: 'Contextual Alert',
    message: message,
    animationType: animation,
    position: position,
  );
}
```

### Accessibility-Conscious Animations

```dart
void showAccessibleAlert(String title, String message, {bool reduceMotion = false}) {
  CustomQuickAlert.info(
    title: title,
    message: message,
    animationType: reduceMotion 
      ? CustomQuickAlertAnimationType.none 
      : CustomQuickAlertAnimationType.fade,
  );
}

// Usage
bool userPrefersReducedMotion = getUserMotionPreference();
showAccessibleAlert(
  'Update Available',
  'A new version is available.',
  reduceMotion: userPrefersReducedMotion,
);
```

---

## 📊 Animation Performance Metrics

| Animation Type | CPU Usage | GPU Usage | Battery Impact | Recommended Frequency |
|----------------|-----------|-----------|----------------|----------------------|
| `scale` | Medium | Low | Low | High |
| `rotate` | High | Medium | Medium | Low |
| `slideInDown` | Low | Low | Low | High |
| `slideInUp` | Low | Low | Low | High |
| `slideInLeft` | Low | Low | Low | High |
| `slideInRight` | Low | Low | Low | High |
| `slide` | Low | Low | Low | High |
| `fade` | Low | Low | Low | Very High |
| `none` | None | None | None | Very High |

---

## 🔗 Related Documentation

- [Position Options](positions.md)
- [Styling Guide](styling.md)
- [Performance Optimization](../advanced/performance.md)
- [Enums Reference](../api/enums.md)
