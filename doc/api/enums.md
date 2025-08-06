# 📐 Enums Reference

Complete reference for all enums available in Custom Quick Alert v2.1.1.

## 🎯 CustomQuickAlertType

Defines the type of alert to display, which affects styling, colors, and default animations.

```dart
enum CustomQuickAlertType {
  success,
  error,
  warning,
  info,
  confirm,
  loading,
  custom,
}
```

### Enum Values

| Value | Description | Default Color | Use Cases |
|-------|-------------|---------------|-----------|
| `success` | ✅ Success operations | Green (#4CAF50) | Form submissions, saves, completions |
| `error` | ❌ Error states | Red (#F44336) | Failures, exceptions, critical issues |
| `warning` | ⚠️ Warning messages | Orange (#FF9800) | Cautions, potential issues, confirmations |
| `info` | ℹ️ Information | Blue (#2196F3) | Notifications, tips, announcements |
| `confirm` | 🤔 Confirmation dialogs | Purple (#3F51B5) | Yes/No questions, confirmations |
| `loading` | ⏳ Loading states | Grey (#607D8B) | Progress indicators, async operations |
| `custom` | 🎨 Custom alerts | Pink (#9C27B0) | Fully customized styling |

### Usage Examples

```dart
// Using enum values
CustomQuickAlert.success(); // Uses CustomQuickAlertType.success
CustomQuickAlert.error();   // Uses CustomQuickAlertType.error

// Using with pageAlert widget
CustomQuickAlert.pageAlert(
  type: CustomQuickAlertType.warning,
  title: 'Warning Message',
);
```

---

## 🎭 CustomQuickAlertAnimationType

Defines how the alert appears on screen with various entrance animations.

```dart
enum CustomQuickAlertAnimationType {
  scale,
  rotate,
  slideInDown,
  slideInUp,
  slideInLeft,
  slideInRight,
  slide,
  fade,
  none,
  custom,
}
```

### Animation Details

| Animation | Description | Best Used For | Duration |
|-----------|-------------|---------------|----------|
| `scale` | Alert scales from small to normal size | Success, Error, Info alerts | 300ms |
| `rotate` | Alert rotates while appearing | Playful or attention-grabbing alerts | 300ms |
| `slideInDown` | Slides in from top | Top-positioned alerts, notifications | 300ms |
| `slideInUp` | Slides in from bottom | Bottom-positioned alerts, confirmations | 300ms |
| `slideInLeft` | Slides in from left | Side notifications | 300ms |
| `slideInRight` | Slides in from right | Side notifications | 300ms |
| `slide` | Generic slide (same as slideInUp) | General use | 300ms |
| `fade` | Fade in effect | Subtle appearances | 300ms |
| `none` | No animation | Instant display | 0ms |
| `custom` | Custom animation | Advanced use cases | Variable |

### Usage Examples

```dart
// Scale animation (default)
CustomQuickAlert.success(
  title: 'Success!',
  animationType: CustomQuickAlertAnimationType.scale,
);

// Slide in from top
CustomQuickAlert.info(
  title: 'Notification',
  animationType: CustomQuickAlertAnimationType.slideInDown,
  position: CustomQuickAlertPosition.top,
);

// Fade animation for subtle alerts
CustomQuickAlert.warning(
  title: 'Warning',
  animationType: CustomQuickAlertAnimationType.fade,
);

// No animation for instant display
CustomQuickAlert.error(
  title: 'Error',
  animationType: CustomQuickAlertAnimationType.none,
);
```

### Animation Curves

Each animation type uses optimized curves for the best user experience:

```dart
// Internal curve mappings (for reference)
switch (animationType) {
  case CustomQuickAlertAnimationType.scale:
    curve = Curves.elasticOut;
  case CustomQuickAlertAnimationType.fade:
    curve = Curves.easeInOut;
  case CustomQuickAlertAnimationType.slideInDown:
  case CustomQuickAlertAnimationType.slideInUp:
  case CustomQuickAlertAnimationType.slideInLeft:
  case CustomQuickAlertAnimationType.slideInRight:
  case CustomQuickAlertAnimationType.slide:
    curve = Curves.easeOutCubic;
  case CustomQuickAlertAnimationType.rotate:
    curve = Curves.easeOutQuart;
}
```

---

## 📍 CustomQuickAlertPosition

Defines where on the screen the alert appears.

```dart
enum CustomQuickAlertPosition {
  top,
  center,
  bottom,
}
```

### Position Details

| Position | Description | Margins | Best Used For |
|----------|-------------|---------|---------------|
| `top` | Top of screen | Top: 100px, Sides: 20px | Notifications, non-intrusive messages |
| `center` | Center of screen (default) | Sides: 20px | Important messages, confirmations, errors |
| `bottom` | Bottom of screen | Bottom: 100px, Sides: 20px | Action confirmations, quick messages |

### Usage Examples

```dart
// Top position for notifications
CustomQuickAlert.info(
  title: 'New Message',
  message: 'You have a new notification',
  position: CustomQuickAlertPosition.top,
  animationType: CustomQuickAlertAnimationType.slideInDown,
);

// Center position for important alerts (default)
CustomQuickAlert.error(
  title: 'Error',
  message: 'Something went wrong',
  position: CustomQuickAlertPosition.center, // Can be omitted
);

// Bottom position for confirmations
CustomQuickAlert.confirm(
  title: 'Save Changes?',
  message: 'Do you want to save your changes?',
  position: CustomQuickAlertPosition.bottom,
  animationType: CustomQuickAlertAnimationType.slideInUp,
);
```

### Position with Animation Combinations

Recommended animation + position combinations:

```dart
// Top notifications
CustomQuickAlert.info(
  position: CustomQuickAlertPosition.top,
  animationType: CustomQuickAlertAnimationType.slideInDown,
);

// Bottom confirmations  
CustomQuickAlert.confirm(
  position: CustomQuickAlertPosition.bottom,
  animationType: CustomQuickAlertAnimationType.slideInUp,
);

// Center alerts with scale
CustomQuickAlert.success(
  position: CustomQuickAlertPosition.center,
  animationType: CustomQuickAlertAnimationType.scale,
);

// Side notifications
CustomQuickAlert.warning(
  position: CustomQuickAlertPosition.center,
  animationType: CustomQuickAlertAnimationType.slideInLeft,
);
```

---

## 🔄 Enum Conversion Utilities

### String to Enum Conversion

```dart
// Helper function for converting strings to enums
CustomQuickAlertType stringToAlertType(String type) {
  switch (type.toLowerCase()) {
    case 'success':
      return CustomQuickAlertType.success;
    case 'error':
      return CustomQuickAlertType.error;
    case 'warning':
      return CustomQuickAlertType.warning;
    case 'info':
      return CustomQuickAlertType.info;
    case 'confirm':
      return CustomQuickAlertType.confirm;
    case 'loading':
      return CustomQuickAlertType.loading;
    case 'custom':
      return CustomQuickAlertType.custom;
    default:
      return CustomQuickAlertType.info;
  }
}

// Usage
final alertType = stringToAlertType('success');
CustomQuickAlert.pageAlert(type: alertType, title: 'Dynamic Alert');
```

### Enum to String Conversion

```dart
// Helper function for converting enums to strings
String alertTypeToString(CustomQuickAlertType type) {
  return type.toString().split('.').last;
}

// Usage
final typeString = alertTypeToString(CustomQuickAlertType.success); // 'success'
```

---

## 🎯 Best Practices

### Animation Selection

```dart
// ✅ Good: Matching animation with position
CustomQuickAlert.info(
  position: CustomQuickAlertPosition.top,
  animationType: CustomQuickAlertAnimationType.slideInDown,
);

// ❌ Avoid: Conflicting animation and position
CustomQuickAlert.info(
  position: CustomQuickAlertPosition.top,
  animationType: CustomQuickAlertAnimationType.slideInUp, // Confusing
);
```

### Alert Type Selection

```dart
// ✅ Good: Appropriate type for context
if (formValid) {
  CustomQuickAlert.success(title: 'Form Submitted');
} else {
  CustomQuickAlert.error(title: 'Validation Failed');
}

// ❌ Avoid: Wrong type for context
CustomQuickAlert.success(title: 'Error Occurred'); // Misleading
```

### Position Guidelines

```dart
// ✅ Good: Non-intrusive notifications at top
CustomQuickAlert.info(
  title: 'New message received',
  position: CustomQuickAlertPosition.top,
  autoCloseDuration: Duration(seconds: 3),
);

// ✅ Good: Important confirmations in center
CustomQuickAlert.confirm(
  title: 'Delete Account',
  message: 'This action cannot be undone',
  position: CustomQuickAlertPosition.center,
);

// ✅ Good: Quick actions at bottom
CustomQuickAlert.success(
  title: 'Item added to cart',
  position: CustomQuickAlertPosition.bottom,
  autoCloseDuration: Duration(seconds: 2),
);
```

---

## 🔗 Related Documentation

- [Alert Types Reference](alert-types.md)
- [Methods Reference](methods.md)
- [Parameters Reference](parameters.md)
- [Animation Customization](../customization/animations.md)
- [Position Customization](../customization/positions.md)
