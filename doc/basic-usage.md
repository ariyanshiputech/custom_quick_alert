# 📱 Basic Usage Guide

Learn the fundamentals of using Custom Quick Alert in your Flutter applications.

## 🚀 Prerequisites

Before you begin, make sure you have:
- [Installed Custom Quick Alert](installation.md)
- [Set up the global navigator key](installation.md#setup)

## 🎯 Basic Alert Types

### 1. Success Alert ✅

Perfect for confirming successful operations:

```dart
CustomQuickAlert.success(
  title: 'Success!',
  message: 'Your data has been saved successfully.',
);
```

**Use Cases:**
- Form submission confirmation
- File upload completion
- Account creation success
- Payment processing confirmation

### 2. Error Alert ❌

Show critical error messages:

```dart
CustomQuickAlert.error(
  title: 'Error Occurred',
  message: 'Failed to save data. Please try again.',
);
```

**Use Cases:**
- Network connection failures
- Validation errors
- Server errors
- Permission denied messages

### 3. Warning Alert ⚠️

Alert users about potential issues:

```dart
CustomQuickAlert.warning(
  title: 'Warning',
  message: 'This action cannot be undone.',
);
```

**Use Cases:**
- Data loss warnings
- Permission requests
- Unsaved changes alerts
- Security warnings

### 4. Info Alert ℹ️

Share helpful information:

```dart
CustomQuickAlert.info(
  title: 'Information',
  message: 'Your session will expire in 5 minutes.',
);
```

**Use Cases:**
- Feature announcements
- System notifications
- Help messages
- Status updates

### 5. Confirmation Dialog 🤔

Get user confirmation before actions:

```dart
CustomQuickAlert.confirm(
  title: 'Delete Item',
  message: 'Are you sure you want to delete this item?',
  onConfirm: () {
    // User confirmed
    deleteItem();
  },
  onCancel: () {
    // User cancelled
    print('Action cancelled');
  },
);
```

**Use Cases:**
- Delete confirmations
- Logout prompts
- Purchase confirmations
- Settings changes

### 6. Loading Alert ⏳

Show progress for long operations:

```dart
// Show loading
CustomQuickAlert.loading(
  title: 'Processing...',
  message: 'Please wait while we process your request.',
);

// Dismiss when done
CustomQuickAlert.dismiss();
```

**Use Cases:**
- API calls
- File processing
- Data synchronization
- Payment processing

### 7. Custom Alert 🎨

Create fully customized alerts:

```dart
CustomQuickAlert.custom(
  title: 'Custom Alert',
  message: 'This is a custom styled alert.',
  confirmBtnColor: Colors.purple,
  backgroundColor: Colors.grey[100],
  titleColor: Colors.purple[800],
);
```

## 🎭 Basic Customization

### Change Button Text

```dart
CustomQuickAlert.confirm(
  title: 'Save Changes',
  message: 'Do you want to save your changes?',
  confirmText: 'Save',
  cancelText: 'Discard',
);
```

### Auto-Dismiss Alerts

```dart
CustomQuickAlert.success(
  title: 'Success!',
  message: 'Data saved successfully.',
  autoCloseDuration: Duration(seconds: 3),
);
```

### Handle Button Actions

```dart
CustomQuickAlert.confirm(
  title: 'Logout',
  message: 'Are you sure you want to logout?',
  onConfirm: () {
    // Perform logout
    Navigator.pushReplacementNamed(context, '/login');
  },
  onCancel: () {
    // Stay on current screen
    print('Logout cancelled');
  },
);
```

## 🛠️ Common Patterns

### Form Validation

```dart
void validateAndSubmit() {
  if (formKey.currentState!.validate()) {
    // Show loading
    CustomQuickAlert.loading(
      title: 'Submitting...',
      message: 'Please wait while we process your form.',
    );
    
    // Submit form
    submitForm().then((_) {
      CustomQuickAlert.dismiss(); // Hide loading
      CustomQuickAlert.success(
        title: 'Form Submitted!',
        message: 'Your form has been submitted successfully.',
      );
    }).catchError((error) {
      CustomQuickAlert.dismiss(); // Hide loading
      CustomQuickAlert.error(
        title: 'Submission Failed',
        message: 'Please check your input and try again.',
      );
    });
  }
}
```

### Network Operations

```dart
Future<void> fetchData() async {
  try {
    CustomQuickAlert.loading(
      title: 'Loading...',
      message: 'Fetching latest data...',
    );
    
    final data = await apiService.fetchData();
    
    CustomQuickAlert.dismiss();
    
    // Process data...
    
  } catch (e) {
    CustomQuickAlert.dismiss();
    CustomQuickAlert.error(
      title: 'Network Error',
      message: 'Failed to fetch data. Please check your connection.',
    );
  }
}
```

### Delete Confirmation

```dart
void deleteItem(String itemId) {
  CustomQuickAlert.confirm(
    title: 'Delete Item',
    message: 'This action cannot be undone. Are you sure?',
    confirmText: 'Delete',
    cancelText: 'Cancel',
    confirmBtnColor: Colors.red,
    onConfirm: () async {
      CustomQuickAlert.loading(
        title: 'Deleting...',
        message: 'Please wait...',
      );
      
      try {
        await deleteItemFromServer(itemId);
        CustomQuickAlert.dismiss();
        CustomQuickAlert.success(
          title: 'Deleted!',
          message: 'Item has been deleted successfully.',
        );
      } catch (e) {
        CustomQuickAlert.dismiss();
        CustomQuickAlert.error(
          title: 'Delete Failed',
          message: 'Could not delete item. Please try again.',
        );
      }
    },
  );
}
```

## 📚 Next Steps

- Learn about [Advanced Customization](customization/styling.md)
- Explore [Animation Types](customization/animations.md)
- Check out [Real-World Examples](examples/real-world.md)
- Read the [API Reference](api/parameters.md)

## 🔗 Related Documentation

- [Installation Guide](installation.md)
- [Quick Start Tutorial](quick-start.md)
- [Troubleshooting](troubleshooting/common-issues.md)
