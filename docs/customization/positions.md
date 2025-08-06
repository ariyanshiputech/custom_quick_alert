# 📍 Position Options Guide

Master alert positioning with Custom Quick Alert's flexible positioning system that allows you to place alerts exactly where they make the most sense for your user experience.

## 🎯 Available Positions

Custom Quick Alert supports three strategic positions optimized for different use cases and user interaction patterns.

### 🔝 Top Position

Display alerts at the top of the screen for non-intrusive notifications.

```dart
CustomQuickAlert.info(
  title: 'New Message',
  message: 'You have 3 new notifications.',
  position: CustomQuickAlertPosition.top,
  animationType: CustomQuickAlertAnimationType.slideInDown,
);
```

**Characteristics:**
- 📐 **Margins:** Top: 100px, Left/Right: 20px
- 🎯 **Best For:** Notifications, status updates, non-critical messages
- 👤 **UX Impact:** Minimal interruption, allows continued interaction
- 📱 **Mobile-Friendly:** Thumb-accessible area

**Visual Layout:**
```
┌─────────────────────────┐
│     🔔 Alert Here       │ ← Top Position
├─────────────────────────┤
│                         │
│     Main Content        │
│                         │
│                         │
└─────────────────────────┘
```

---

### 🎯 Center Position (Default)

Display alerts in the center of the screen for important messages requiring immediate attention.

```dart
CustomQuickAlert.error(
  title: 'Payment Failed',
  message: 'Please check your payment method.',
  position: CustomQuickAlertPosition.center, // Can be omitted (default)
  animationType: CustomQuickAlertAnimationType.scale,
);
```

**Characteristics:**
- 📐 **Margins:** Left/Right: 20px, vertically centered
- 🎯 **Best For:** Errors, confirmations, important announcements
- 👤 **UX Impact:** High attention, blocks interaction until dismissed
- 📱 **Mobile-Friendly:** Central focus area

**Visual Layout:**
```
┌─────────────────────────┐
│                         │
│     🎯 Alert Here       │ ← Center Position
│                         │
│                         │
└─────────────────────────┘
```

---

### 🔽 Bottom Position

Display alerts at the bottom of the screen for quick confirmations and status updates.

```dart
CustomQuickAlert.success(
  title: 'Item Added',
  message: 'Product added to your cart.',
  position: CustomQuickAlertPosition.bottom,
  animationType: CustomQuickAlertAnimationType.slideInUp,
  autoCloseDuration: Duration(seconds: 3),
);
```

**Characteristics:**
- 📐 **Margins:** Bottom: 100px, Left/Right: 20px
- 🎯 **Best For:** Action confirmations, quick feedback, undo actions
- 👤 **UX Impact:** Low interruption, quick acknowledgment
- 📱 **Mobile-Friendly:** Easy thumb dismissal

**Visual Layout:**
```
┌─────────────────────────┐
│                         │
│     Main Content        │
│                         │
├─────────────────────────┤
│     🔽 Alert Here       │ ← Bottom Position
└─────────────────────────┘
```

---

## 🎨 Position-Specific Styling

### Top Position Customization

```dart
CustomQuickAlert.info(
  title: 'System Update',
  message: 'A new system update is available.',
  position: CustomQuickAlertPosition.top,
  animationType: CustomQuickAlertAnimationType.slideInDown,
  backgroundColor: Colors.blue[50],
  titleColor: Colors.blue[800],
  borderRadius: 12.0,
  autoCloseDuration: Duration(seconds: 5),
);
```

### Center Position Customization

```dart
CustomQuickAlert.confirm(
  title: 'Delete Account',
  message: 'This action cannot be undone. Are you sure?',
  position: CustomQuickAlertPosition.center,
  animationType: CustomQuickAlertAnimationType.scale,
  backgroundColor: Colors.red[50],
  titleColor: Colors.red[800],
  confirmBtnColor: Colors.red,
  cancelBtnColor: Colors.grey,
  showCancel: true,
);
```

### Bottom Position Customization

```dart
CustomQuickAlert.success(
  title: 'Changes Saved',
  message: 'Your preferences have been updated.',
  position: CustomQuickAlertPosition.bottom,
  animationType: CustomQuickAlertAnimationType.slideInUp,
  backgroundColor: Colors.green[50],
  titleColor: Colors.green[800],
  width: 300,
  autoCloseDuration: Duration(seconds: 2),
);
```

---

## 📱 Position Best Practices

### By Use Case

#### 🔔 Notifications & Updates

```dart
// ✅ Perfect: Top position for notifications
CustomQuickAlert.info(
  title: 'New Message',
  message: 'John sent you a message',
  position: CustomQuickAlertPosition.top,
  animationType: CustomQuickAlertAnimationType.slideInDown,
  autoCloseDuration: Duration(seconds: 4),
);
```

#### ⚠️ Critical Errors & Confirmations

```dart
// ✅ Perfect: Center position for important actions
CustomQuickAlert.confirm(
  title: 'Delete All Data',
  message: 'This will permanently delete all your data',
  position: CustomQuickAlertPosition.center,
  animationType: CustomQuickAlertAnimationType.scale,
  showCancel: true,
);
```

#### ✅ Quick Feedback & Status

```dart
// ✅ Perfect: Bottom position for quick feedback
CustomQuickAlert.success(
  title: 'Uploaded Successfully',
  message: 'Your file has been uploaded',
  position: CustomQuickAlertPosition.bottom,
  animationType: CustomQuickAlertAnimationType.slideInUp,
  autoCloseDuration: Duration(seconds: 2),
);
```

### By Screen Size

#### Mobile Phones

```dart
// Prefer bottom and top for better thumb accessibility
CustomQuickAlert.success(
  title: 'Action Complete',
  position: CustomQuickAlertPosition.bottom, // Thumb-friendly
  width: MediaQuery.of(context).size.width * 0.9,
);
```

#### Tablets

```dart
// Center works well on larger screens
CustomQuickAlert.info(
  title: 'Information',
  position: CustomQuickAlertPosition.center,
  width: 400, // Fixed width on tablets
);
```

#### Desktop

```dart
// Top notifications work great on desktop
CustomQuickAlert.info(
  title: 'Desktop Notification',
  position: CustomQuickAlertPosition.top,
  width: 350, // Comfortable desktop width
);
```

---

## 🎭 Position + Animation Combinations

### Recommended Combinations

```dart
// 🔝 Top Position
CustomQuickAlert.info(
  position: CustomQuickAlertPosition.top,
  animationType: CustomQuickAlertAnimationType.slideInDown, // Natural flow
);

// 🎯 Center Position
CustomQuickAlert.error(
  position: CustomQuickAlertPosition.center,
  animationType: CustomQuickAlertAnimationType.scale, // Attention-grabbing
);

// 🔽 Bottom Position
CustomQuickAlert.success(
  position: CustomQuickAlertPosition.bottom,
  animationType: CustomQuickAlertAnimationType.slideInUp, // Natural flow
);
```

### Creative Combinations

```dart
// Side slide animations with center position
CustomQuickAlert.warning(
  title: 'Side Notification',
  position: CustomQuickAlertPosition.center,
  animationType: CustomQuickAlertAnimationType.slideInLeft,
);

// Fade animations work with any position
CustomQuickAlert.info(
  title: 'Subtle Update',
  position: CustomQuickAlertPosition.top,
  animationType: CustomQuickAlertAnimationType.fade,
);
```

### What to Avoid

```dart
// ❌ Conflicting animations and positions
CustomQuickAlert.info(
  position: CustomQuickAlertPosition.top,
  animationType: CustomQuickAlertAnimationType.slideInUp, // Confusing direction
);

// ❌ Wrong position for critical alerts
CustomQuickAlert.error(
  title: 'Critical System Error',
  position: CustomQuickAlertPosition.bottom, // Too easy to miss
);
```

---

## 🏗️ Advanced Position Techniques

### Conditional Positioning

```dart
void showContextualAlert(String context, String message) {
  CustomQuickAlertPosition position;
  
  switch (context) {
    case 'notification':
      position = CustomQuickAlertPosition.top;
      break;
    case 'confirmation':
      position = CustomQuickAlertPosition.center;
      break;
    case 'feedback':
      position = CustomQuickAlertPosition.bottom;
      break;
    default:
      position = CustomQuickAlertPosition.center;
  }
  
  CustomQuickAlert.info(
    title: 'Contextual Alert',
    message: message,
    position: position,
  );
}
```

### Screen Size Responsive Positioning

```dart
void showResponsiveAlert(BuildContext context, String title, String message) {
  final screenHeight = MediaQuery.of(context).size.height;
  CustomQuickAlertPosition position;
  
  if (screenHeight < 600) {
    // Small screens: prefer bottom for accessibility
    position = CustomQuickAlertPosition.bottom;
  } else if (screenHeight > 900) {
    // Large screens: top notifications work well
    position = CustomQuickAlertPosition.top;
  } else {
    // Medium screens: center is safe
    position = CustomQuickAlertPosition.center;
  }
  
  CustomQuickAlert.info(
    title: title,
    message: message,
    position: position,
  );
}
```

### Multi-Alert Positioning Strategy

```dart
class AlertQueue {
  static final List<CustomQuickAlertPosition> _usedPositions = [];
  
  static CustomQuickAlertPosition getAvailablePosition() {
    final positions = CustomQuickAlertPosition.values;
    
    for (final position in positions) {
      if (!_usedPositions.contains(position)) {
        _usedPositions.add(position);
        return position;
      }
    }
    
    // If all positions used, use center as fallback
    return CustomQuickAlertPosition.center;
  }
  
  static void releasePosition(CustomQuickAlertPosition position) {
    _usedPositions.remove(position);
  }
}

// Usage
void showMultipleAlerts() {
  final position1 = AlertQueue.getAvailablePosition();
  CustomQuickAlert.info(
    title: 'First Alert',
    position: position1,
    onConfirm: () => AlertQueue.releasePosition(position1),
  );
  
  final position2 = AlertQueue.getAvailablePosition();
  CustomQuickAlert.warning(
    title: 'Second Alert',
    position: position2,
    onConfirm: () => AlertQueue.releasePosition(position2),
  );
}
```

---

## 📊 Position Usage Analytics

### When to Use Each Position

| Position | Frequency | Use Cases | Auto-Dismiss | User Action Required |
|----------|-----------|-----------|--------------|---------------------|
| **Top** | High | Notifications, updates, non-critical info | Usually (3-5s) | Optional |
| **Center** | Medium | Errors, confirmations, important dialogs | Rarely | Usually Required |
| **Bottom** | High | Feedback, status, quick confirmations | Usually (2-3s) | Optional |

### Position Performance

| Position | Attention Level | Interruption | Accessibility | Mobile UX |
|----------|----------------|--------------|---------------|-----------|
| **Top** | Medium | Low | Good | Excellent |
| **Center** | High | High | Excellent | Good |
| **Bottom** | Medium | Low | Good | Excellent |

---

## 📚 Position Workflow Examples

### E-commerce Flow

```dart
// 1. Add to cart (bottom feedback)
CustomQuickAlert.success(
  title: 'Added to Cart',
  message: 'Item added successfully',
  position: CustomQuickAlertPosition.bottom,
  autoCloseDuration: Duration(seconds: 2),
);

// 2. Checkout confirmation (center)
CustomQuickAlert.confirm(
  title: 'Proceed to Checkout?',
  message: 'Ready to complete your purchase?',
  position: CustomQuickAlertPosition.center,
  showCancel: true,
);

// 3. Payment notification (top)
CustomQuickAlert.info(
  title: 'Processing Payment',
  message: 'Please wait...',
  position: CustomQuickAlertPosition.top,
);
```

### Social Media Flow

```dart
// 1. New message notification (top)
CustomQuickAlert.info(
  title: 'New Message',
  message: 'Sarah sent you a message',
  position: CustomQuickAlertPosition.top,
  autoCloseDuration: Duration(seconds: 4),
);

// 2. Post creation feedback (bottom)
CustomQuickAlert.success(
  title: 'Post Published',
  message: 'Your post is now live',
  position: CustomQuickAlertPosition.bottom,
  autoCloseDuration: Duration(seconds: 3),
);

// 3. Account deletion confirmation (center)
CustomQuickAlert.confirm(
  title: 'Delete Account',
  message: 'This action cannot be undone',
  position: CustomQuickAlertPosition.center,
  showCancel: true,
);
```

---

## 🔗 Related Documentation

- [Animation Types](animations.md)
- [Styling Guide](styling.md)
- [API Enums Reference](../api/enums.md)
- [UX Best Practices](../advanced/ux-patterns.md)
