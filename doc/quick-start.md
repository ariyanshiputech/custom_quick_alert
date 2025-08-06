# 🚀 Quick Start Tutorial

Get up and running with Custom Quick Alert in just a few minutes! This tutorial covers the basics to help you display your first alert.

## 📱 Your First Alert

Let's create a simple success alert:

```dart
import 'package:flutter/material.dart';
import 'package:custom_quick_alert/custom_quick_alert.dart';

void showSuccessAlert() {
  CustomQuickAlert.success(
    title: 'Success!',
    message: 'Your action was completed successfully.',
  );
}
```

## 🎯 Basic Alert Types

Custom Quick Alert provides 7 built-in alert types:

### 1. Success Alert
```dart
CustomQuickAlert.success(
  title: 'Success!',
  message: 'Operation completed successfully.',
);
```

### 2. Error Alert
```dart
CustomQuickAlert.error(
  title: 'Error Occurred',
  message: 'Please try again later.',
);
```

### 3. Warning Alert
```dart
CustomQuickAlert.warning(
  title: 'Warning',
  message: 'Please review your input.',
);
```

### 4. Info Alert
```dart
CustomQuickAlert.info(
  title: 'Information',
  message: 'Here is some important information.',
);
```

### 5. Confirm Alert
```dart
CustomQuickAlert.confirm(
  title: 'Are you sure?',
  message: 'This action cannot be undone.',
  confirmText: 'Yes, Delete',
  cancelText: 'Cancel',
  showCancel: true,
  onConfirm: () {
    // Handle confirmation
  },
  onCancel: () {
    // Handle cancellation
  },
);
```

### 6. Loading Alert
```dart
CustomQuickAlert.loading(
  title: 'Loading...',
  message: 'Please wait while we process your request.',
);

// Dismiss after operation completes
Future.delayed(Duration(seconds: 3), () {
  CustomQuickAlert.dismiss();
});
```

### 7. Custom Alert
```dart
CustomQuickAlert.custom(
  title: 'Custom Alert',
  message: 'This is a custom alert with your own styling.',
  lottieAsset: 'assets/animations/custom.json',
  backgroundColor: Colors.blue.shade50,
  titleColor: Colors.blue.shade800,
  messageColor: Colors.blue.shade600,
);
```

## 🎨 Basic Customization

### Positioning
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.success,
  title: 'Success!',
  text: 'Alert positioned at the top.',
  position: QuickAlertAnimationType.slideInUp,
);
```

### Colors and Styling
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.info,
  title: 'Custom Styling',
  text: 'This alert has custom colors.',
  backgroundColor: Colors.purple.shade50,
  titleColor: Colors.purple.shade800,
  textColor: Colors.purple.shade600,
  confirmBtnColor: Colors.purple,
);
```

### Auto Close
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.success,
  title: 'Auto Close',
  text: 'This alert will close automatically.',
  autoCloseDuration: Duration(seconds: 3),
);
```

## 🏗️ Complete Example App

Here's a complete example app demonstrating all alert types:

```dart
import 'package:flutter/material.dart';
import 'package:custom_quick_alert/custom_quick_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Quick Alert Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AlertDemoPage(),
    );
  }
}

class AlertDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Quick Alert Demo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAlertButton(
              context,
              'Success Alert',
              Colors.green,
              () => _showSuccessAlert(context),
            ),
            SizedBox(height: 12),
            _buildAlertButton(
              context,
              'Error Alert',
              Colors.red,
              () => _showErrorAlert(context),
            ),
            SizedBox(height: 12),
            _buildAlertButton(
              context,
              'Warning Alert',
              Colors.orange,
              () => _showWarningAlert(context),
            ),
            SizedBox(height: 12),
            _buildAlertButton(
              context,
              'Info Alert',
              Colors.blue,
              () => _showInfoAlert(context),
            ),
            SizedBox(height: 12),
            _buildAlertButton(
              context,
              'Confirm Alert',
              Colors.purple,
              () => _showConfirmAlert(context),
            ),
            SizedBox(height: 12),
            _buildAlertButton(
              context,
              'Loading Alert',
              Colors.cyan,
              () => _showLoadingAlert(context),
            ),
            SizedBox(height: 12),
            _buildAlertButton(
              context,
              'Custom Alert',
              Colors.teal,
              () => _showCustomAlert(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertButton(
    BuildContext context,
    String text,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  void _showSuccessAlert(BuildContext context) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Success!',
      text: 'Your operation was completed successfully.',
    );
  }

  void _showErrorAlert(BuildContext context) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Error!',
      text: 'Something went wrong. Please try again.',
    );
  }

  void _showWarningAlert(BuildContext context) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      title: 'Warning!',
      text: 'Please check your input and try again.',
    );
  }

  void _showInfoAlert(BuildContext context) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: 'Information',
      text: 'Here is some important information for you.',
    );
  }

  void _showConfirmAlert(BuildContext context) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: 'Are you sure?',
      text: 'This action cannot be undone.',
      confirmBtnText: 'Yes, Delete',
      cancelBtnText: 'Cancel',
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        _showSuccessAlert(context);
      },
    );
  }

  void _showLoadingAlert(BuildContext context) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Loading...',
      text: 'Please wait while we process your request.',
    );

    // Auto close after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop();
      _showSuccessAlert(context);
    });
  }

  void _showCustomAlert(BuildContext context) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.custom,
      title: 'Custom Alert',
      text: 'This is a custom alert with custom styling.',
      backgroundColor: Colors.teal.shade50,
      titleColor: Colors.teal.shade800,
      textColor: Colors.teal.shade600,
      confirmBtnColor: Colors.teal,
    );
  }
}
```

## 🎓 Next Steps

Now that you have the basics down, explore these advanced topics:

1. **[API Reference](api/alert-types.md)** - Complete parameter documentation
2. **[Customization Guide](customization/styling.md)** - Advanced styling options
3. **[Real-World Examples](examples/real-world.md)** - Practical use cases
4. **[Performance Tips](advanced/performance.md)** - Optimization strategies

## 💡 Pro Tips

### 1. Context Management
Always ensure you have a valid `BuildContext` when showing alerts:

```dart
// ✅ Good
void showAlert() {
  if (mounted) {
    CustomQuickAlert.show(context: context, ...);
  }
}

// ❌ Avoid
void showAlert() {
  // Context might be null or invalid
  CustomQuickAlert.show(context: context, ...);
}
```

### 2. Memory Management
For loading alerts, always ensure proper cleanup:

```dart
Timer? _loadingTimer;

void showLoadingWithTimeout() {
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.loading,
    title: 'Loading...',
  );

  _loadingTimer = Timer(Duration(seconds: 10), () {
    if (mounted) {
      Navigator.of(context).pop();
      // Show timeout error
    }
  });
}

@override
void dispose() {
  _loadingTimer?.cancel();
  super.dispose();
}
```

### 3. Accessibility
Add semantic labels for better accessibility:

```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.success,
  title: 'Success!',
  text: 'Operation completed',
  // Add semantic information
  barrierDismissible: false, // For important alerts
);
```

---

**Next:** [Basic Usage Examples →](basic-usage.md)
