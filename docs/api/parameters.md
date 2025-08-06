# 📱 API Parameters Reference

Complete reference for all parameters available in Custom Quick Alert v2.1.0.

## 🎯 Alert Methods

### Available Methods

```dart
// Available alert types with their use cases
CustomQuickAlert.success()   // ✅ Success notifications & confirmations
CustomQuickAlert.error()     // ❌ Error messages & exceptions
CustomQuickAlert.warning()   // ⚠️ Warning alerts & cautions
CustomQuickAlert.info()      // ℹ️ Information dialogs & tips
CustomQuickAlert.confirm()   // 🤔 Confirmation dialogs & decisions
CustomQuickAlert.loading()   // ⏳ Loading indicators & progress
CustomQuickAlert.custom()    // 🎨 Fully customizable alerts
```

### ⚡ Quick Methods

```dart
// 🚫 Dismiss current alert
CustomQuickAlert.dismiss();

// 🎯 Check if alert is showing
bool isShowing = CustomQuickAlert.isShowing();
```

## 📊 Core Parameters

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `title` | `String?` | Alert title | `null` |
| `message` | `String?` | Alert message | `null` |
| `useGradientButtons` | `bool` | Enable gradient styling | `true` |
| `animationType` | `QuickAlertAnimationType` | Entrance animation | `scale` |
| `position` | `QuickAlertPosition` | Screen position | `center` |
| `autoCloseDuration` | `Duration?` | Auto-dismiss timer | `null` |
| `barrierDismissible` | `bool` | Tap outside to dismiss | `true` |
| `customShadows` | `List<BoxShadow>?` | Custom shadow effects | `null` |
| `confirmText` | `String` | Confirm button text | `'OK'` |
| `cancelText` | `String` | Cancel button text | `'Cancel'` |
| `showCancel` | `bool` | Show cancel button | `false` |
| `showConfirm` | `bool` | Show confirm button | `true` |

## 🎨 Styling Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `backgroundColor` | `Color?` | Dialog background color |
| `titleColor` | `Color?` | Title text color |
| `messageColor` | `Color?` | Message text color |
| `confirmBtnColor` | `Color?` | Confirm button color |
| `cancelBtnColor` | `Color?` | Cancel button color |
| `confirmTextColor` | `Color?` | Confirm button text color |
| `cancelTextColor` | `Color?` | Cancel button text color |
| `borderRadius` | `double?` | Dialog border radius |
| `width` | `double?` | Dialog width |
| `padding` | `EdgeInsets?` | Dialog content padding |

## 🎭 Animation Types

### QuickAlertAnimationType Enum

```dart
enum QuickAlertAnimationType {
  scale,        // Default scale animation
  slideInDown,  // Slide from top
  slideInUp,    // Slide from bottom
  slideInLeft,  // Slide from left
  slideInRight, // Slide from right
  fade,         // Fade in/out
}
```

### Usage Examples

```dart
// Scale animation (default)
CustomQuickAlert.success(
  animationType: QuickAlertAnimationType.scale,
);

// Slide animations
CustomQuickAlert.info(
  animationType: QuickAlertAnimationType.slideInDown,
);

CustomQuickAlert.warning(
  animationType: QuickAlertAnimationType.slideInUp,
);

CustomQuickAlert.error(
  animationType: QuickAlertAnimationType.slideInLeft,
);

// Fade animation
CustomQuickAlert.custom(
  animationType: QuickAlertAnimationType.fade,
  lottieAsset: 'assets/animations/custom.json',
);
```

## 📍 Position Options

### QuickAlertPosition Enum

```dart
enum QuickAlertPosition {
  top,     // Top of screen
  center,  // Center of screen (default)
  bottom,  // Bottom of screen
}
```

### Usage Examples

```dart
// Top positioned - Perfect for notifications
CustomQuickAlert.info(
  title: 'New Update Available',
  message: 'Version 2.0 is ready to install.',
  position: QuickAlertPosition.top,
);

// Center positioned (default) - Best for important dialogs
CustomQuickAlert.success(
  title: 'Payment Successful',
  message: 'Your transaction has been completed.',
  position: QuickAlertPosition.center,
);

// Bottom positioned - Great for confirmations
CustomQuickAlert.warning(
  title: 'Delete Item?',
  message: 'This action cannot be undone.',
  position: QuickAlertPosition.bottom,
  showCancel: true,
);
```

## 🎨 Custom Styling Examples

### Professional Success Alert

```dart
CustomQuickAlert.success(
  title: 'Payment Successful',
  message: 'Your transaction has been processed securely.',
  useGradientButtons: true,
  customShadows: [
    BoxShadow(
      color: Colors.green.withValues(alpha: 0.2),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: Colors.green.withValues(alpha: 0.1),
      blurRadius: 40,
      offset: const Offset(0, 20),
    ),
  ],
  backgroundColor: Colors.green.shade50,
  titleColor: Colors.green.shade800,
  messageColor: Colors.green.shade600,
  confirmBtnColor: Colors.green.shade600,
  borderRadius: 16.0,
);
```

### Custom Error Alert

```dart
CustomQuickAlert.error(
  title: 'Connection Failed',
  message: 'Please check your internet connection and try again.',
  confirmBtnColor: const Color(0xFFE53E3E),
  backgroundColor: const Color(0xFFFFF5F5),
  titleColor: const Color(0xFFE53E3E),
  messageColor: const Color(0xFF742A2A),
  borderRadius: 16.0,
  customShadows: [
    BoxShadow(
      color: Colors.red.withValues(alpha: 0.1),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ],
);
```

## 🔄 Callback Functions

### onConfirm and onCancel

```dart
CustomQuickAlert.confirm(
  title: 'Delete Account',
  message: 'Are you sure you want to delete your account?',
  confirmText: 'Delete',
  cancelText: 'Cancel',
  showCancel: true,
  onConfirm: () {
    // Handle confirmation action
    print('Account deletion confirmed');
    // Add your deletion logic here
  },
  onCancel: () {
    // Handle cancellation action
    print('Account deletion cancelled');
    // Add your cancellation logic here
  },
);
```

## 🎨 Custom Lottie Assets

### Using Custom Animations

```dart
CustomQuickAlert.custom(
  title: 'Custom Animation',
  message: 'This alert uses a custom Lottie animation.',
  lottieAsset: 'assets/animations/my_custom_animation.json',
  confirmText: 'Awesome!',
  backgroundColor: Colors.purple.shade50,
  titleColor: Colors.purple.shade800,
  confirmBtnColor: Colors.purple.shade600,
);
```

## 🔧 Advanced Configuration

### Auto-Close Timer

```dart
CustomQuickAlert.success(
  title: 'Success!',
  message: 'This alert will close automatically.',
  autoCloseDuration: Duration(seconds: 3),
);
```

### Custom Shadows

```dart
CustomQuickAlert.info(
  title: 'Custom Shadows',
  message: 'This alert has custom shadow effects.',
  customShadows: [
    BoxShadow(
      color: Colors.blue.withValues(alpha: 0.3),
      blurRadius: 15,
      offset: Offset(0, 5),
    ),
    BoxShadow(
      color: Colors.blue.withValues(alpha: 0.1),
      blurRadius: 30,
      offset: Offset(0, 10),
    ),
  ],
);
```

### Barrier Dismissible

```dart
CustomQuickAlert.loading(
  title: 'Processing...',
  message: 'Please wait, this cannot be cancelled.',
  barrierDismissible: false, // Prevents dismissing by tapping outside
);
```

---

**Next:** [Customization Guide →](../customization/styling.md)
