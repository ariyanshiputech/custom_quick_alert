# Custom Quick Alert - Examples & Usage Guide

This document provides comprehensive examples of how to use the Custom Quick Alert library in your Flutter applications.

## 📋 Table of Contents

- [Quick Start](#-quick-start)
- [Basic Usage](#-basic-usage)
- [Alert Types](#-alert-types)
- [Advanced Customization](#-advanced-customization)
- [Animation Options](#-animation-options)
- [Position & Layout](#-position--layout)
- [Auto-dismiss & Callbacks](#-auto-dismiss--callbacks)
- [Configuration Objects](#-configuration-objects)
- [Real-world Examples](#-real-world-examples)

## 🚀 Quick Start

### 1. Initialize the Library

First, initialize CustomQuickAlert in your main.dart file:

```dart
import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
  
  // Initialize CustomQuickAlert with the navigator key
  CustomQuickAlert.initialize(navigatorKey);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // Don't forget this!
      home: MyHomePage(),
    );
  }
}
```

### 2. Use Anywhere in Your App

Once initialized, you can use CustomQuickAlert anywhere without needing a BuildContext:

```dart
// Simple success alert
CustomQuickAlert.success(
  title: 'Success!',
  message: 'Your operation was completed successfully.',
);
```

## 📱 Basic Usage

### Import the Package

```dart
import 'package:custom_quick_alert/custom_quick_alert.dart';
```

### Simple Alerts

```dart
// Success Alert
CustomQuickAlert.success(
  title: 'Success!',
  message: 'Transaction completed successfully!',
);

// Error Alert
CustomQuickAlert.error(
  title: 'Error!',
  message: 'Something went wrong. Please try again.',
);

// Warning Alert
CustomQuickAlert.warning(
  title: 'Warning!',
  message: 'This action cannot be undone.',
);

// Info Alert
CustomQuickAlert.info(
  title: 'Information',
  message: 'Here is some useful information for you.',
);
```

## 🎯 Alert Types

### 1. Success Alert

```dart
CustomQuickAlert.success(
  title: 'Payment Successful',
  message: 'Your payment of \$99.99 has been processed successfully.',
  confirmText: 'Great!',
  onConfirm: () {
    // Navigate to receipt page
    print('Success confirmed');
  },
);
```

### 2. Error Alert

```dart
CustomQuickAlert.error(
  title: 'Connection Failed',
  message: 'Unable to connect to server. Check your internet connection.',
  confirmText: 'Retry',
  showCancel: true,
  cancelText: 'Cancel',
  onConfirm: () {
    // Retry logic
    print('Retrying connection...');
  },
  onCancel: () {
    // Cancel logic
    print('User cancelled retry');
  },
);
```

### 3. Warning Alert

```dart
CustomQuickAlert.warning(
  title: 'Delete Account',
  message: 'This will permanently delete your account and all associated data.',
  confirmText: 'Delete',
  cancelText: 'Keep Account',
  showCancel: true,
  confirmBtnColor: Colors.red,
  onConfirm: () {
    // Delete account logic
    print('Account deleted');
  },
);
```

### 4. Info Alert

```dart
CustomQuickAlert.info(
  title: 'App Update Available',
  message: 'Version 2.0 is now available with exciting new features!',
  confirmText: 'Update Now',
  showCancel: true,
  cancelText: 'Later',
  onConfirm: () {
    // Open app store
    print('Redirecting to app store...');
  },
);
```

### 5. Confirmation Dialog

```dart
CustomQuickAlert.confirm(
  title: 'Logout Confirmation',
  message: 'Are you sure you want to logout?',
  confirmText: 'Yes, Logout',
  cancelText: 'Cancel',
  onConfirm: () {
    // Logout logic
    print('User logged out');
  },
  onCancel: () {
    // Stay logged in
    print('User cancelled logout');
  },
);
```

### 6. Loading Alert

```dart
// Show loading
CustomQuickAlert.loading(
  title: 'Processing...',
  message: 'Please wait while we process your request.',
);

// Simulate async operation
Future.delayed(Duration(seconds: 3), () {
  CustomQuickAlert.dismiss(); // Dismiss loading
  
  CustomQuickAlert.success(
    title: 'Complete!',
    message: 'Your request has been processed.',
  );
});
```

### 7. Custom Alert

```dart
CustomQuickAlert.custom(
  title: 'Welcome!',
  message: 'Thank you for joining our premium membership.',
  backgroundColor: Colors.deepPurple,
  titleColor: Colors.white,
  messageColor: Colors.white70,
  confirmText: 'Get Started',
  confirmBtnColor: Colors.amber,
  borderRadius: 20.0,
  width: 300,
  customContent: Column(
    children: [
      Icon(Icons.star, color: Colors.amber, size: 50),
      SizedBox(height: 10),
      Text('Premium Features Unlocked!', 
           style: TextStyle(color: Colors.white)),
    ],
  ),
);
```

## 🎨 Advanced Customization

### Color Customization

```dart
CustomQuickAlert.success(
  title: 'Custom Colors',
  message: 'This alert uses custom colors.',
  backgroundColor: Color(0xFF1E1E1E),
  titleColor: Colors.green,
  messageColor: Colors.white70,
  confirmBtnColor: Colors.green,
  confirmTextColor: Colors.white,
  borderRadius: 25.0,
);
```

### Button Customization

```dart
CustomQuickAlert.confirm(
  title: 'Custom Buttons',
  message: 'Do you want to proceed?',
  confirmText: '✓ Yes, Continue',
  cancelText: '✗ No, Cancel',
  confirmBtnColor: Colors.indigo,
  cancelBtnColor: Colors.redAccent,
  confirmTextColor: Colors.white,
  cancelTextColor: Colors.white,
  useGradientButtons: true, // Enable gradient buttons
);
```

### Size and Padding

```dart
CustomQuickAlert.info(
  title: 'Custom Layout',
  message: 'This alert has custom sizing and padding.',
  width: 350, // Custom width
  padding: EdgeInsets.all(20), // Custom padding
  borderRadius: 30.0, // Custom border radius
);
```

## 🎬 Animation Options

### Animation Types

```dart
// Scale animation (default)
CustomQuickAlert.success(
  title: 'Scale Animation',
  message: 'This alert scales in.',
  animationType: QuickAlertAnimationType.scale,
);

// Fade animation
CustomQuickAlert.info(
  title: 'Fade Animation',
  message: 'This alert fades in.',
  animationType: QuickAlertAnimationType.fade,
);

// Slide animations
CustomQuickAlert.warning(
  title: 'Slide Animation',
  message: 'This alert slides in from top.',
  animationType: QuickAlertAnimationType.slideInDown,
);

// Other slide options:
// QuickAlertAnimationType.slideInUp
// QuickAlertAnimationType.slideInLeft
// QuickAlertAnimationType.slideInRight
```

### Custom Lottie Animations

```dart
CustomQuickAlert.custom(
  title: 'Custom Animation',
  message: 'This alert uses a custom Lottie animation.',
  lottieAsset: 'assets/animations/celebration.json',
  animationType: QuickAlertAnimationType.scale,
);
```

## 📍 Position & Layout

### Alert Positions

```dart
// Top position
CustomQuickAlert.success(
  title: 'Top Alert',
  message: 'This alert appears at the top.',
  position: QuickAlertPosition.top,
  autoCloseDuration: Duration(seconds: 3),
);

// Center position (default)
CustomQuickAlert.info(
  title: 'Center Alert',
  message: 'This alert appears in the center.',
  position: QuickAlertPosition.center,
);

// Bottom position
CustomQuickAlert.warning(
  title: 'Bottom Alert',
  message: 'This alert appears at the bottom.',
  position: QuickAlertPosition.bottom,
);
```

### Barrier Dismissible

```dart
CustomQuickAlert.info(
  title: 'Dismissible Alert',
  message: 'Tap outside to dismiss this alert.',
  barrierDismissible: true, // Allow tap outside to dismiss
);
```

## ⏰ Auto-dismiss & Callbacks

### Auto-dismiss Functionality

```dart
CustomQuickAlert.success(
  title: 'Auto-dismiss',
  message: 'This alert will close automatically in 3 seconds.',
  autoCloseDuration: Duration(seconds: 3),
  showConfirm: false, // Hide confirm button for auto-dismiss
);
```

### Callback Functions

```dart
CustomQuickAlert.confirm(
  title: 'Save Changes?',
  message: 'You have unsaved changes. Do you want to save them?',
  onConfirm: () {
    print('Changes saved!');
    // Save logic here
  },
  onCancel: () {
    print('Changes discarded!');
    // Discard logic here
  },
);
```

### Advanced Callbacks with Navigation

```dart
CustomQuickAlert.success(
  title: 'Registration Complete',
  message: 'Welcome to our app! Let\'s get you started.',
  onConfirm: () {
    // Navigate to home screen
    Navigator.of(navigatorKey.currentContext!).pushReplacementNamed('/home');
  },
);
```

## ⚙️ Configuration Objects

### Using QuickAlertConfig

```dart
import 'package:custom_quick_alert/custom_quick_alert.dart';

// Create reusable configurations
final successConfig = QuickAlertConfig(
  type: QuickAlertType.success,
  title: 'Operation Successful',
  backgroundColor: Colors.green.shade50,
  titleColor: Colors.green.shade800,
  confirmBtnColor: Colors.green,
  borderRadius: 15.0,
  position: QuickAlertPosition.top,
  autoCloseDuration: Duration(seconds: 2),
);

// Use configuration
CustomQuickAlert.show(config: successConfig);
```

### Theme-based Configuration

```dart
class AppAlertThemes {
  static final successTheme = QuickAlertConfig(
    type: QuickAlertType.success,
    backgroundColor: Color(0xFFE8F5E8),
    titleColor: Color(0xFF2E7D32),
    messageColor: Color(0xFF424242),
    confirmBtnColor: Color(0xFF4CAF50),
    borderRadius: 20.0,
  );
  
  static final errorTheme = QuickAlertConfig(
    type: QuickAlertType.error,
    backgroundColor: Color(0xFFFFEBEE),
    titleColor: Color(0xFFC62828),
    messageColor: Color(0xFF424242),
    confirmBtnColor: Color(0xFFE53935),
    borderRadius: 20.0,
  );
}

// Usage
CustomQuickAlert.show(config: AppAlertThemes.successTheme.copyWith(
  title: 'Profile Updated',
  message: 'Your profile has been updated successfully.',
));
```

## 🌟 Real-world Examples

### 1. Login Flow

```dart
class LoginService {
  static Future<void> login(String email, String password) async {
    // Show loading
    CustomQuickAlert.loading(
      title: 'Signing In...',
      message: 'Please wait while we authenticate you.',
    );
    
    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));
      
      // Dismiss loading
      CustomQuickAlert.dismiss();
      
      if (email == 'user@example.com' && password == 'password') {
        // Success
        CustomQuickAlert.success(
          title: 'Welcome Back!',
          message: 'You have been successfully signed in.',
          onConfirm: () {
            Navigator.pushReplacementNamed(
              navigatorKey.currentContext!, 
              '/dashboard'
            );
          },
        );
      } else {
        // Error
        CustomQuickAlert.error(
          title: 'Login Failed',
          message: 'Invalid email or password. Please try again.',
          confirmText: 'Try Again',
        );
      }
    } catch (e) {
      CustomQuickAlert.dismiss();
      CustomQuickAlert.error(
        title: 'Connection Error',
        message: 'Unable to connect to server. Please check your internet connection.',
        confirmText: 'Retry',
        showCancel: true,
        onConfirm: () => login(email, password), // Retry
      );
    }
  }
}
```

### 2. File Upload with Progress

```dart
class FileUploadService {
  static Future<void> uploadFile() async {
    // Show loading with custom message
    CustomQuickAlert.loading(
      title: 'Uploading File...',
      message: 'Your file is being uploaded. Please don\'t close the app.',
    );
    
    try {
      // Simulate file upload progress
      await Future.delayed(Duration(seconds: 3));
      
      CustomQuickAlert.dismiss();
      
      CustomQuickAlert.success(
        title: 'Upload Complete!',
        message: 'Your file has been uploaded successfully.',
        confirmText: 'View File',
        showCancel: true,
        cancelText: 'Close',
        onConfirm: () {
          // Navigate to file viewer
          print('Opening file viewer...');
        },
      );
    } catch (e) {
      CustomQuickAlert.dismiss();
      
      CustomQuickAlert.error(
        title: 'Upload Failed',
        message: 'Failed to upload file. Would you like to try again?',
        confirmText: 'Retry',
        showCancel: true,
        cancelText: 'Cancel',
        onConfirm: () => uploadFile(), // Retry upload
      );
    }
  }
}
```

### 3. Data Deletion Confirmation

```dart
class DataService {
  static void confirmDelete(String itemName, VoidCallback onDelete) {
    CustomQuickAlert.warning(
      title: 'Delete $itemName?',
      message: 'This action cannot be undone. The item will be permanently deleted.',
      confirmText: 'Delete',
      cancelText: 'Cancel',
      showCancel: true,
      confirmBtnColor: Colors.red,
      onConfirm: () {
        // Show loading during deletion
        CustomQuickAlert.loading(
          title: 'Deleting...',
          message: 'Please wait while we delete the item.',
        );
        
        Future.delayed(Duration(seconds: 1), () {
          CustomQuickAlert.dismiss();
          
          // Perform deletion
          onDelete();
          
          CustomQuickAlert.success(
            title: 'Deleted Successfully',
            message: '$itemName has been deleted.',
            autoCloseDuration: Duration(seconds: 2),
            showConfirm: false,
          );
        });
      },
    );
  }
}

// Usage
DataService.confirmDelete('My Document', () {
  print('Document deleted from database');
});
```

### 4. Network Status Handler

```dart
class NetworkStatusHandler {
  static void showNetworkError() {
    CustomQuickAlert.error(
      title: 'No Internet Connection',
      message: 'Please check your internet connection and try again.',
      confirmText: 'Retry',
      showCancel: true,
      cancelText: 'Offline Mode',
      position: QuickAlertPosition.top,
      onConfirm: () {
        // Retry network operation
        checkConnection();
      },
      onCancel: () {
        // Switch to offline mode
        enableOfflineMode();
      },
    );
  }
  
  static void showConnectionRestored() {
    CustomQuickAlert.success(
      title: 'Connection Restored',
      message: 'You\'re back online! Syncing your data...',
      position: QuickAlertPosition.top,
      autoCloseDuration: Duration(seconds: 3),
      showConfirm: false,
    );
  }
  
  static void checkConnection() {
    // Network check logic
  }
  
  static void enableOfflineMode() {
    // Offline mode logic
  }
}
```

### 5. Form Validation

```dart
class FormValidator {
  static void validateAndSubmit(Map<String, dynamic> formData) {
    List<String> errors = [];
    
    if (formData['name']?.isEmpty ?? true) {
      errors.add('Name is required');
    }
    if (formData['email']?.isEmpty ?? true) {
      errors.add('Email is required');
    }
    
    if (errors.isNotEmpty) {
      CustomQuickAlert.warning(
        title: 'Form Validation Error',
        message: 'Please fix the following errors:\n\n${errors.join('\n')}',
        confirmText: 'Fix Errors',
      );
      return;
    }
    
    // If validation passes
    CustomQuickAlert.loading(
      title: 'Submitting Form...',
      message: 'Please wait while we process your information.',
    );
    
    Future.delayed(Duration(seconds: 2), () {
      CustomQuickAlert.dismiss();
      
      CustomQuickAlert.success(
        title: 'Form Submitted!',
        message: 'Thank you! Your information has been submitted successfully.',
        onConfirm: () {
          Navigator.pop(navigatorKey.currentContext!);
        },
      );
    });
  }
}
```

## 📚 Additional Tips

### 1. Dismiss Alerts Programmatically

```dart
// Dismiss the current alert
CustomQuickAlert.dismiss();

// Check if an alert is currently showing
if (CustomQuickAlert.isInitialized) {
  // Alert system is ready
}
```

### 2. Prevent Back Button

```dart
CustomQuickAlert.loading(
  title: 'Processing Payment...',
  message: 'Please do not close the app during payment processing.',
  disableBackButton: true, // Prevents back button from dismissing
);
```

### 3. Custom Content Widget

```dart
CustomQuickAlert.custom(
  title: 'Rate Our App',
  customContent: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('How would you rate your experience?'),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) => 
          IconButton(
            icon: Icon(Icons.star, color: Colors.amber),
            onPressed: () {
              // Handle rating
              CustomQuickAlert.dismiss();
            },
          ),
        ),
      ),
    ],
  ),
  showConfirm: false,
  showCancel: false,
);
```

This comprehensive guide covers all the major features and use cases of the Custom Quick Alert library. You can mix and match these examples to create the perfect alert experience for your Flutter application!
