# 🔧 Methods Reference

Complete reference for all methods available in Custom Quick Alert v2.1.1.

## 🎯 Core Alert Methods

### Static Alert Methods

All alert methods are static and can be called without context after initialization.

#### Success Alert

```dart
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
  bool useGradientButtons = true,
  List<BoxShadow>? customShadows,
  Widget? customContent,
})
```

**Purpose:** Display success notifications and confirmations  
**Default Colors:** Green theme (#4CAF50)  
**Animation:** Success Lottie animation

---

#### Error Alert

```dart
static Future<void> error({
  // Same parameters as success()
  // with different default styling
})
```

**Purpose:** Display error messages and exceptions  
**Default Colors:** Red theme (#F44336)  
**Animation:** Error Lottie animation

---

#### Warning Alert

```dart
static Future<void> warning({
  // Same parameters as success()
  // with different default styling
})
```

**Purpose:** Display warning messages and cautions  
**Default Colors:** Orange theme (#FF9800)  
**Animation:** Warning Lottie animation

---

#### Info Alert

```dart
static Future<void> info({
  // Same parameters as success()
  // with additional:
  bool showAnimationContainer = true,
  Color? animationContainerColor,
})
```

**Purpose:** Display information dialogs and tips  
**Default Colors:** Blue theme (#2196F3)  
**Animation:** Info Lottie animation

---

#### Confirm Alert

```dart
static Future<void> confirm({
  // Same parameters as success()
  // with different defaults:
  String confirmText = 'Yes',
  String cancelText = 'No',
  bool showCancel = true, // Default true for confirm dialogs
  bool showAnimationContainer = true,
  Color? animationContainerColor,
})
```

**Purpose:** Display confirmation dialogs and decisions  
**Default Colors:** Purple theme (#3F51B5)  
**Animation:** Confirm Lottie animation

---

#### Loading Alert

```dart
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
})
```

**Purpose:** Display loading indicators and progress  
**Default Colors:** Grey theme (#607D8B)  
**Animation:** Loading Lottie animation (repeating)  
**Special:** No buttons, typically dismissed programmatically

---

#### Custom Alert

```dart
static Future<void> custom({
  // All parameters from success()
  // with additional customization options:
  bool showAnimationContainer = true,
  Color? animationContainerColor,
})
```

**Purpose:** Fully customizable alerts  
**Default Colors:** Pink theme (#9C27B0)  
**Animation:** Custom Lottie animation

---

## 🛠️ Utility Methods

### Initialize

```dart
static void initialize(GlobalKey<NavigatorState> navigatorKey)
```

**Purpose:** Initialize CustomQuickAlert with navigator key  
**Required:** Must be called before using any alert methods  
**Usage:**
```dart
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
  CustomQuickAlert.initialize(navigatorKey);
}
```

---

### Dismiss

```dart
static bool dismiss()
```

**Purpose:** Dismiss the currently displayed alert  
**Returns:** `true` if alert was dismissed, `false` if no alert was showing  
**Usage:**
```dart
CustomQuickAlert.loading(title: 'Processing...');

// Later...
bool dismissed = CustomQuickAlert.dismiss();
```

---

### Check Initialization

```dart
static bool get isInitialized
```

**Purpose:** Check if CustomQuickAlert has been properly initialized  
**Returns:** `true` if initialized, `false` otherwise  
**Usage:**
```dart
if (CustomQuickAlert.isInitialized) {
  CustomQuickAlert.success(title: 'Ready!');
} else {
  print('CustomQuickAlert not initialized');
}
```

---

### Get Navigator State

```dart
static NavigatorState? get navigatorState
```

**Purpose:** Get the current navigator state (for advanced usage)  
**Returns:** `NavigatorState?` - the current navigator state or null  
**Usage:**
```dart
final navigator = CustomQuickAlert.navigatorState;
if (navigator != null && navigator.canPop()) {
  // Custom navigation logic
}
```

---

## 🎨 Widget Methods

### Page Alert Widget

```dart
static Widget pageAlert({
  required CustomQuickAlertType type,
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
  bool useGradientButtons = true,
  List<BoxShadow>? customShadows,
  Widget? customContent,
})
```

**Purpose:** Returns a widget for use in build methods instead of showing as dialog  
**Usage:**
```dart
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('My App'),
          CustomQuickAlert.pageAlert(
            type: CustomQuickAlertType.success,
            title: 'Embedded Alert',
            message: 'This alert is part of the page layout.',
          ),
        ],
      ),
    );
  }
}
```

---

## 🔄 Method Chaining Pattern

While CustomQuickAlert methods don't support traditional chaining, you can use async/await for sequential alerts:

```dart
// Sequential alerts
Future<void> showSequentialAlerts() async {
  await CustomQuickAlert.info(
    title: 'Step 1',
    message: 'First alert',
  );
  
  await CustomQuickAlert.warning(
    title: 'Step 2', 
    message: 'Second alert',
  );
  
  await CustomQuickAlert.success(
    title: 'Complete!',
    message: 'All steps finished',
  );
}
```

## 🚀 Advanced Usage Patterns

### Conditional Method Calls

```dart
void showAlertBasedOnStatus(String status) {
  switch (status) {
    case 'success':
      CustomQuickAlert.success(title: 'Success!');
      break;
    case 'error':
      CustomQuickAlert.error(title: 'Error occurred');
      break;
    case 'warning':
      CustomQuickAlert.warning(title: 'Warning');
      break;
    default:
      CustomQuickAlert.info(title: 'Unknown status');
  }
}
```

### Method with Progress Tracking

```dart
Future<void> processWithProgress() async {
  CustomQuickAlert.loading(
    title: 'Processing...',
    message: 'Step 1 of 3',
  );
  
  await Future.delayed(Duration(seconds: 2));
  CustomQuickAlert.dismiss();
  
  CustomQuickAlert.loading(
    title: 'Processing...',
    message: 'Step 2 of 3',
  );
  
  await Future.delayed(Duration(seconds: 2));
  CustomQuickAlert.dismiss();
  
  CustomQuickAlert.success(
    title: 'Complete!',
    message: 'Processing finished successfully.',
  );
}
```

## 🔗 Related Documentation

- [Alert Types Reference](alert-types.md)
- [Parameters Reference](parameters.md)
- [Enums Reference](enums.md)
- [Styling Guide](../customization/styling.md)
