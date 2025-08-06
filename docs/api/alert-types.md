# 📚 API Reference - Alert Types

This document provides detailed information about all available alert types in Custom Quick Alert.

## 🎯 QuickAlertType Enum

The `QuickAlertType` enum defines all available alert types:

```dart
enum QuickAlertType {
  success,    // ✅ Success operations
  error,      // ❌ Error states
  warning,    // ⚠️ Warning messages
  info,       // ℹ️ Information
  confirm,    // ❓ Confirmation dialogs
  loading,    // ⏳ Loading states
  custom,     // 🎨 Custom alerts
}
```

---

## ✅ Success Alert

Used to indicate successful operations or positive outcomes.

### Visual Characteristics
- **Color Scheme:** Green theme
- **Icon:** Checkmark animation
- **Default Animation:** `success.json`
- **Typical Duration:** 2-3 seconds

### Basic Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.success,
  title: 'Success!',
  text: 'Your action was completed successfully.',
);
```

### Advanced Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.success,
  title: 'Payment Successful!',
  text: 'Your payment of \$99.99 has been processed.',
  confirmBtnText: 'Continue Shopping',
  onConfirmBtnTap: () {
    Navigator.of(context).pop();
    _navigateToProducts();
  },
  autoCloseDuration: Duration(seconds: 3),
  position: QuickAlertAnimationType.slideInDown,
);
```

### Common Use Cases
- Form submission success
- Payment confirmation
- File upload completion
- Account creation
- Settings saved

---

## ❌ Error Alert

Used to display error messages and failure states.

### Visual Characteristics
- **Color Scheme:** Red theme
- **Icon:** X mark animation
- **Default Animation:** `error.json`
- **Typical Duration:** Until dismissed

### Basic Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.error,
  title: 'Error!',
  text: 'Something went wrong. Please try again.',
);
```

### Advanced Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.error,
  title: 'Connection Failed',
  text: 'Unable to connect to the server. Please check your internet connection and try again.',
  confirmBtnText: 'Retry',
  cancelBtnText: 'Cancel',
  onConfirmBtnTap: () {
    Navigator.of(context).pop();
    _retryOperation();
  },
  onCancelBtnTap: () {
    Navigator.of(context).pop();
  },
  barrierDismissible: false,
);
```

### Common Use Cases
- Network errors
- Validation failures
- Authentication errors
- File processing errors
- API failures

---

## ⚠️ Warning Alert

Used to display warning messages and cautionary information.

### Visual Characteristics
- **Color Scheme:** Orange/Amber theme
- **Icon:** Warning triangle animation
- **Default Animation:** `warning.json`
- **Typical Duration:** Until dismissed

### Basic Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.warning,
  title: 'Warning!',
  text: 'Please check your input and try again.',
);
```

### Advanced Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.warning,
  title: 'Low Storage Space',
  text: 'Your device is running low on storage. Some features may not work properly.',
  confirmBtnText: 'Manage Storage',
  cancelBtnText: 'Dismiss',
  onConfirmBtnTap: () {
    Navigator.of(context).pop();
    _openStorageSettings();
  },
  showCancelBtn: true,
);
```

### Common Use Cases
- Input validation warnings
- System resource warnings
- Data loss warnings
- Permission requests
- Feature limitations

---

## ℹ️ Info Alert

Used to display informational messages and helpful tips.

### Visual Characteristics
- **Color Scheme:** Blue theme
- **Icon:** Information "i" animation
- **Default Animation:** `info.json`
- **Typical Duration:** Until dismissed

### Basic Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.info,
  title: 'Information',
  text: 'Here is some important information for you.',
);
```

### Advanced Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.info,
  title: 'New Feature Available!',
  text: 'We\'ve added dark mode support. You can enable it in the settings.',
  confirmBtnText: 'Go to Settings',
  cancelBtnText: 'Maybe Later',
  onConfirmBtnTap: () {
    Navigator.of(context).pop();
    _navigateToSettings();
  },
  showCancelBtn: true,
  widget: Container(
    padding: EdgeInsets.all(16),
    child: Image.asset('assets/images/dark_mode_preview.png'),
  ),
);
```

### Common Use Cases
- Feature announcements
- Tips and tutorials
- System notifications
- Version updates
- Help information

---

## ❓ Confirm Alert

Used to request user confirmation before performing important actions.

### Visual Characteristics
- **Color Scheme:** Purple/Blue theme
- **Icon:** Question mark animation
- **Default Animation:** `confirm.json`
- **Typical Duration:** Until user responds

### Basic Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.confirm,
  title: 'Are you sure?',
  text: 'This action cannot be undone.',
  confirmBtnText: 'Yes, Delete',
  cancelBtnText: 'Cancel',
  onConfirmBtnTap: () {
    Navigator.of(context).pop();
    _performDeletion();
  },
);
```

### Advanced Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.confirm,
  title: 'Delete Account',
  text: 'Are you sure you want to delete your account? This will permanently remove all your data and cannot be undone.',
  confirmBtnText: 'Delete Account',
  cancelBtnText: 'Keep Account',
  confirmBtnColor: Colors.red,
  onConfirmBtnTap: () async {
    Navigator.of(context).pop();
    
    // Show loading
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Deleting Account...',
    );
    
    try {
      await _deleteAccount();
      Navigator.of(context).pop(); // Close loading
      _showAccountDeletedSuccess();
    } catch (e) {
      Navigator.of(context).pop(); // Close loading
      _showDeleteError(e.toString());
    }
  },
  barrierDismissible: false,
);
```

### Common Use Cases
- Delete confirmations
- Logout confirmations
- Purchase confirmations
- Data overwrite warnings
- Permanent actions

---

## ⏳ Loading Alert

Used to indicate ongoing operations and loading states.

### Visual Characteristics
- **Color Scheme:** Neutral theme
- **Icon:** Spinning loader animation
- **Default Animation:** `loading.json`
- **Typical Duration:** Until operation completes

### Basic Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.loading,
  title: 'Loading...',
  text: 'Please wait while we process your request.',
);

// Dismiss when done
Future.delayed(Duration(seconds: 3), () {
  Navigator.of(context).pop();
});
```

### Advanced Usage with Progress
```dart
void _performLongOperation() async {
  // Show initial loading
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.loading,
    title: 'Processing...',
    text: 'Uploading files (0/5)',
    barrierDismissible: false,
  );

  try {
    for (int i = 0; i < 5; i++) {
      await _uploadFile(i);
      
      // Update progress
      Navigator.of(context).pop(); // Close current
      CustomQuickAlert.show(
        context: context,
        type: QuickAlertType.loading,
        title: 'Processing...',
        text: 'Uploading files (${i + 1}/5)',
        barrierDismissible: false,
      );
    }
    
    Navigator.of(context).pop(); // Close loading
    _showUploadSuccess();
  } catch (e) {
    Navigator.of(context).pop(); // Close loading
    _showUploadError(e.toString());
  }
}
```

### Common Use Cases
- API requests
- File uploads/downloads
- Data processing
- Authentication
- Long calculations

---

## 🎨 Custom Alert

Used to create alerts with custom styling and animations.

### Visual Characteristics
- **Color Scheme:** Customizable
- **Icon:** Custom animation or image
- **Default Animation:** `custom.json` or user-provided
- **Typical Duration:** User-defined

### Basic Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.custom,
  title: 'Custom Alert',
  text: 'This is a custom alert with your own styling.',
  customAsset: 'assets/animations/my_custom.json',
);
```

### Advanced Usage
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.custom,
  title: 'Welcome to Premium!',
  text: 'You now have access to all premium features.',
  customAsset: 'assets/animations/premium_celebration.json',
  backgroundColor: Color(0xFFF8F4E6),
  titleColor: Color(0xFFD4AF37),
  textColor: Color(0xFF8B7355),
  confirmBtnColor: Color(0xFFD4AF37),
  confirmBtnText: 'Explore Features',
  showCancelBtn: true,
  cancelBtnText: 'Maybe Later',
  widget: Container(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Column(
      children: [
        Icon(Icons.star, color: Color(0xFFD4AF37), size: 24),
        SizedBox(height: 8),
        Text(
          'Premium Benefits',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4AF37),
          ),
        ),
        SizedBox(height: 8),
        _buildBenefitsList(),
      ],
    ),
  ),
  onConfirmBtnTap: () {
    Navigator.of(context).pop();
    _navigateToPremiumFeatures();
  },
);
```

### Custom Widget Example
```dart
Widget _buildBenefitsList() {
  final benefits = [
    'Unlimited downloads',
    'Ad-free experience',
    'Priority support',
    'Exclusive content',
  ];

  return Column(
    children: benefits.map((benefit) => 
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, 
                 color: Color(0xFFD4AF37), size: 16),
            SizedBox(width: 8),
            Text(benefit, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    ).toList(),
  );
}
```

### Common Use Cases
- Onboarding flows
- Feature introductions
- Celebration moments
- Branded notifications
- Special announcements

---

## 🔄 Type Comparison Matrix

| Type | Primary Use | Color | Icon | Auto-Dismiss | Cancel Button |
|------|-------------|-------|------|--------------|---------------|
| Success | Positive feedback | Green | Checkmark | Optional | Rarely |
| Error | Error states | Red | X mark | No | Optional |
| Warning | Cautions | Orange | Triangle | No | Often |
| Info | Information | Blue | Info icon | Optional | Often |
| Confirm | User decisions | Purple | Question | No | Always |
| Loading | Progress | Neutral | Spinner | When done | Rarely |
| Custom | Special cases | Custom | Custom | Custom | Custom |

---

## 🎯 Best Practices by Type

### Success Alerts
- Keep messages positive and encouraging
- Consider auto-dismissing after 2-3 seconds
- Include next action when appropriate
- Use for completed operations only

### Error Alerts
- Provide clear, actionable error messages
- Avoid technical jargon
- Offer retry options when possible
- Include help resources for complex errors

### Warning Alerts
- Be specific about the risk or issue
- Provide clear instructions to resolve
- Use sparingly to maintain impact
- Allow users to proceed with caution

### Info Alerts
- Keep information relevant and timely
- Provide value to the user
- Include links to detailed information
- Consider user preferences for notifications

### Confirm Alerts
- Make consequences clear
- Use descriptive button text
- Mark destructive actions clearly
- Prevent accidental dismissal

### Loading Alerts
- Provide progress indication when possible
- Include estimated time for long operations
- Allow cancellation for non-critical operations
- Prevent user interaction during loading

### Custom Alerts
- Maintain consistency with app design
- Follow accessibility guidelines
- Test across different screen sizes
- Provide fallback for missing assets

---

**Next:** [Parameters Reference →](parameters.md)
