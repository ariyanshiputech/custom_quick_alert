# 📚 Migration Guide - v2.1.0

Complete guide for migrating to Custom Quick Alert v2.1.0 with the new context-free API.

## 🔄 Upgrading from v1.x to v2.1.0

### 🚨 Breaking Changes

Version 2.1.0 introduces a completely new context-free API that eliminates the need for `BuildContext` parameters.

### 📋 Migration Steps

#### 1. Update Dependencies

**Update your `pubspec.yaml`:**
```yaml
dependencies:
  custom_quick_alert: ^2.1.0  # Update to latest version
```

**Run package update:**
```bash
flutter pub get
```

#### 2. Setup Global Navigator Key

This is the most important step for the new context-free API:

**Add to your `main.dart`:**
```dart
import 'package:flutter/material.dart';
import 'package:custom_quick_alert/custom_quick_alert.dart';

// 1. Create global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
  // 2. Initialize CustomQuickAlert with the navigator key
  CustomQuickAlert.initialize(navigatorKey);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // 3. Assign navigator key to MaterialApp
      title: 'Your App',
      home: const HomePage(),
    );
  }
}
```

#### 3. Update API Calls

**Migration Table:**

| v1.x API | v2.1.0 API |
|----------|------------|
| `CustomQuickAlert.show(context: context, type: QuickAlertType.success, ...)` | `CustomQuickAlert.success(...)` |
| `CustomQuickAlert.show(context: context, type: QuickAlertType.error, ...)` | `CustomQuickAlert.error(...)` |
| `CustomQuickAlert.show(context: context, type: QuickAlertType.warning, ...)` | `CustomQuickAlert.warning(...)` |
| `CustomQuickAlert.show(context: context, type: QuickAlertType.info, ...)` | `CustomQuickAlert.info(...)` |
| `CustomQuickAlert.show(context: context, type: QuickAlertType.confirm, ...)` | `CustomQuickAlert.confirm(...)` |
| `CustomQuickAlert.show(context: context, type: QuickAlertType.loading, ...)` | `CustomQuickAlert.loading(...)` |
| `CustomQuickAlert.show(context: context, type: QuickAlertType.custom, ...)` | `CustomQuickAlert.custom(...)` |

#### 4. Parameter Changes

**Key Parameter Updates:**

| v1.x Parameter | v2.1.0 Parameter | Notes |
|----------------|------------------|-------|
| `text` | `message` | Renamed for clarity |
| `context` | *(removed)* | No longer needed with global navigator |
| `confirmBtnText` | `confirmText` | Simplified name |
| `cancelBtnText` | `cancelText` | Simplified name |
| `showCancelBtn` | `showCancel` | Simplified name |
| `onConfirmBtnTap` | `onConfirm` | Simplified callback |
| `onCancelBtnTap` | `onCancel` | Simplified callback |

## 🔄 Code Migration Examples

### Success Alert Migration

**Before (v1.x):**
```dart
void showSuccessAlert(BuildContext context) {
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    title: 'Success!',
    text: 'Operation completed successfully.',
    confirmBtnText: 'Continue',
    onConfirmBtnTap: () {
      Navigator.of(context).pop();
      // Additional logic
    },
  );
}
```

**After (v2.1.0):**
```dart
void showSuccessAlert() {
  CustomQuickAlert.success(
    title: 'Success!',
    message: 'Operation completed successfully.',
    confirmText: 'Continue',
    onConfirm: () {
      // Additional logic (no need to pop manually)
    },
  );
}
```

### Error Alert Migration

**Before (v1.x):**
```dart
void showErrorAlert(BuildContext context, String error) {
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Error Occurred',
    text: error,
    confirmBtnText: 'Try Again',
    onConfirmBtnTap: () {
      Navigator.of(context).pop();
      retryOperation();
    },
  );
}
```

**After (v2.1.0):**
```dart
void showErrorAlert(String error) {
  CustomQuickAlert.error(
    title: 'Error Occurred',
    message: error,
    confirmText: 'Try Again',
    onConfirm: () => retryOperation(),
  );
}
```

### Confirmation Dialog Migration

**Before (v1.x):**
```dart
void showConfirmDialog(BuildContext context) {
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.confirm,
    title: 'Are you sure?',
    text: 'This action cannot be undone.',
    confirmBtnText: 'Yes, Delete',
    cancelBtnText: 'Cancel',
    showCancelBtn: true,
    onConfirmBtnTap: () {
      Navigator.of(context).pop();
      performDeletion();
    },
    onCancelBtnTap: () {
      Navigator.of(context).pop();
    },
  );
}
```

**After (v2.1.0):**
```dart
void showConfirmDialog() {
  CustomQuickAlert.confirm(
    title: 'Are you sure?',
    message: 'This action cannot be undone.',
    confirmText: 'Yes, Delete',
    cancelText: 'Cancel',
    showCancel: true,
    onConfirm: () => performDeletion(),
    onCancel: () {
      // Optional: handle cancellation
    },
  );
}
```

### Loading Alert Migration

**Before (v1.x):**
```dart
void showLoadingAlert(BuildContext context) {
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.loading,
    title: 'Loading...',
    text: 'Please wait while we process your request.',
    barrierDismissible: false,
  );

  // Dismiss manually
  Future.delayed(Duration(seconds: 3), () {
    Navigator.of(context).pop();
  });
}
```

**After (v2.1.0):**
```dart
void showLoadingAlert() {
  CustomQuickAlert.loading(
    title: 'Loading...',
    message: 'Please wait while we process your request.',
    barrierDismissible: false,
  );

  // Dismiss using the new method
  Future.delayed(Duration(seconds: 3), () {
    CustomQuickAlert.dismiss();
  });
}
```

### Custom Alert Migration

**Before (v1.x):**
```dart
void showCustomAlert(BuildContext context) {
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.custom,
    title: 'Custom Alert',
    text: 'This is a custom alert.',
    customAsset: 'assets/animations/custom.json',
    backgroundColor: Colors.purple.shade50,
    titleColor: Colors.purple.shade800,
    textColor: Colors.purple.shade600,
  );
}
```

**After (v2.1.0):**
```dart
void showCustomAlert() {
  CustomQuickAlert.custom(
    title: 'Custom Alert',
    message: 'This is a custom alert.',
    lottieAsset: 'assets/animations/custom.json',
    backgroundColor: Colors.purple.shade50,
    titleColor: Colors.purple.shade800,
    messageColor: Colors.purple.shade600,
  );
}
```

## 🛠️ Advanced Migration Scenarios

### Class-Based Alert Managers

**Before (v1.x):**
```dart
class AlertManager {
  static void showSuccess(BuildContext context, String message) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Success',
      text: message,
    );
  }
}
```

**After (v2.1.0):**
```dart
class AlertManager {
  static void showSuccess(String message) {
    CustomQuickAlert.success(
      title: 'Success',
      message: message,
    );
  }
}
```

### State Management Integration

**Before (v1.x with Bloc):**
```dart
class MyBloc extends Bloc<MyEvent, MyState> {
  final BuildContext context;
  
  MyBloc(this.context) : super(MyInitial());

  void showAlert(String message) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: 'Info',
      text: message,
    );
  }
}
```

**After (v2.1.0 with Bloc):**
```dart
class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc() : super(MyInitial()); // No context needed!

  void showAlert(String message) {
    CustomQuickAlert.info(
      title: 'Info',
      message: message,
    );
  }
}
```

## 🔧 Troubleshooting Migration

### Common Issues

#### Issue: "Navigator key not set"
**Solution:**
```dart
// Ensure you call initialize after runApp
void main() {
  runApp(const MyApp());
  CustomQuickAlert.initialize(navigatorKey); // Add this line
}
```

#### Issue: "Alerts not showing"
**Solution:**
```dart
// Make sure navigator key is assigned to MaterialApp
MaterialApp(
  navigatorKey: navigatorKey, // Don't forget this!
  home: HomePage(),
)
```

#### Issue: "Build context errors"
**Solution:**
Remove all BuildContext parameters from your alert calls:
```dart
// ❌ Old way
showAlert(BuildContext context) { ... }

// ✅ New way  
showAlert() { ... }
```

### Testing Migration

**Create a test file to verify migration:**
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_quick_alert/custom_quick_alert.dart';

void main() {
  group('Migration Tests', () {
    testWidgets('Success alert works without context', (tester) async {
      // Setup your app with navigator key
      
      // Test that alerts work
      CustomQuickAlert.success(
        title: 'Test',
        message: 'Migration successful!',
      );
      
      // Verify alert is shown
      expect(find.text('Test'), findsOneWidget);
    });
  });
}
```

## 📈 Benefits of Migration

### ✅ Advantages of v2.1.0

1. **Context-Free**: No more passing BuildContext around
2. **Cleaner Code**: Simplified API calls
3. **Better Architecture**: Alerts can be called from anywhere
4. **Improved Testing**: Easier to unit test
5. **Performance**: Better memory management
6. **Maintainability**: Reduced boilerplate code

### 🎯 Before vs After Comparison

**Lines of Code Reduction:**
```dart
// Before: 8 lines
void showAlert(BuildContext context) {
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    title: 'Success',
    text: 'Done!',
  );
}

// After: 4 lines  
void showAlert() {
  CustomQuickAlert.success(
    title: 'Success',
    message: 'Done!',
  );
}
```

## 🎉 Migration Complete!

Once you've completed these steps:

1. ✅ Updated dependencies to v2.1.0
2. ✅ Set up global navigator key
3. ✅ Updated all API calls
4. ✅ Updated parameter names
5. ✅ Tested your app

Your app is now using the latest Custom Quick Alert with improved performance and cleaner code!

## 📞 Need Help?

If you encounter issues during migration:

1. Check our [Troubleshooting Guide](../troubleshooting/common-issues.md)
2. Review [Common Issues](../troubleshooting/common-issues.md)
3. Create an issue on [GitHub](https://github.com/ariyanshiputech/custom_quick_alert/issues)

---

**Next:** [Platform Support →](../platform-support.md)
