# 💡 Real-World Examples

This guide provides practical, real-world examples of using Custom Quick Alert v2.1.1 in various application scenarios.

## 🔐 Authentication System

### Login Flow
```dart
class AuthController {
  static Future<void> loginUser(String email, String password) async {
    // Show loading
    CustomQuickAlert.loading(
      title: 'Signing In',
      message: 'Authenticating your credentials...',
    );

    try {
      final user = await AuthService.login(email, password);
      CustomQuickAlert.dismiss(); // Close loading
      
      // Show success
      CustomQuickAlert.success(
        title: 'Welcome Back!',
        message: 'Successfully signed in as ${user.name}',
        autoCloseDuration: const Duration(seconds: 2),
      );
      
    } catch (e) {
      CustomQuickAlert.dismiss(); // Close loading
      
      // Show error
      CustomQuickAlert.error(
        title: 'Login Failed',
        message: e.toString(),
        confirmText: 'Try Again',
      );
    }
  }

  static void logout() {
    CustomQuickAlert.confirm(
      title: 'Sign Out',
      message: 'Are you sure you want to sign out?',
      confirmText: 'Sign Out',
      cancelText: 'Cancel',
      showCancel: true,
      onConfirm: () async {
        await AuthService.logout();
        CustomQuickAlert.success(
          title: 'Signed Out',
          message: 'You have been successfully signed out.',
        );
      },
    );
  }
}
```

### Password Reset Flow
```dart
class PasswordResetController {
  static void showForgotPasswordDialog() {
    final emailController = TextEditingController();

    CustomQuickAlert.custom(
      title: 'Reset Password',
      message: 'Enter your email address and we\'ll send you a reset link.',
      confirmText: 'Send Reset Link',
      cancelText: 'Cancel',
      showCancel: true,
      onConfirm: () {
        if (emailController.text.isNotEmpty) {
          _sendPasswordResetEmail(emailController.text);
        }
      },
    );
  }

  static Future<void> _sendPasswordResetEmail(String email) async {
    CustomQuickAlert.loading(
      title: 'Sending Reset Link',
      message: 'Please wait...',
    );

    try {
      await AuthService.sendPasswordResetEmail(email);
      CustomQuickAlert.dismiss(); // Close loading
      
      CustomQuickAlert.success(
        title: 'Reset Link Sent!',
        message: 'Check your email for password reset instructions.',
        confirmText: 'OK',
      );
    } catch (e) {
      CustomQuickAlert.dismiss(); // Close loading
      
      CustomQuickAlert.error(
        title: 'Failed to Send',
        message: 'Unable to send reset email. Please try again.',
        confirmText: 'Retry',
        onConfirm: () => showForgotPasswordDialog(),
      );
    }
  }
}
```

## 🛒 E-Commerce Application

### Product Purchase Flow
```dart
class ShoppingController {
  static void addToCart(Product product) {
    CustomQuickAlert.confirm(
      title: 'Add to Cart',
      message: 'Add ${product.name} to your shopping cart?',
      confirmText: 'Add to Cart',
      cancelText: 'Cancel',
      showCancel: true,
      position: QuickAlertPosition.bottom,
      onConfirm: () {
        CartService.addItem(product);
        CustomQuickAlert.success(
          title: 'Added to Cart',
          message: '${product.name} has been added to your cart.',
          autoCloseDuration: const Duration(seconds: 2),
        );
      },
    );
  }

  static Future<void> processPayment(double amount) async {
    CustomQuickAlert.loading(
      title: 'Processing Payment',
      message: 'Please wait while we process your payment...',
    );

    try {
      await PaymentService.charge(amount);
      CustomQuickAlert.dismiss();
      
      CustomQuickAlert.success(
        title: 'Payment Successful!',
        message: 'Your order has been confirmed and will be shipped soon.',
        confirmText: 'View Order',
      );
    } catch (e) {
      CustomQuickAlert.dismiss();
      
      CustomQuickAlert.error(
        title: 'Payment Failed',
        message: 'Unable to process payment. Please try again.',
        confirmText: 'Retry',
        onConfirm: () => processPayment(amount),
      );
    }
  }

  static void removeFromCart(CartItem item) {
    CustomQuickAlert.warning(
      title: 'Remove Item',
      message: 'Remove ${item.product.name} from cart?',
      confirmText: 'Remove',
      cancelText: 'Keep',
      showCancel: true,
      onConfirm: () {
        CartService.removeItem(item.id);
        CustomQuickAlert.info(
          title: 'Item Removed',
          message: 'Item has been removed from your cart.',
        );
      },
    );
  }
}
```

### Shopping Cart Management
```dart
class CartManager {
  static void showItemAddedToCart(Product product) {
    CustomQuickAlert.success(
      title: 'Added to Cart!',
      message: '${product.name} has been added to your cart.',
      confirmText: 'View Cart',
      cancelText: 'Continue Shopping',
      showCancel: true,
      autoCloseDuration: Duration(seconds: 2),
    );
  }

  static void showCartEmptyWarning() {
    CustomQuickAlert.warning(
      title: 'Cart is Empty',
      message: 'Add some items to your cart before proceeding to checkout.',
      confirmText: 'Browse Products',
    );
  }

  static void confirmClearCart() {
    CustomQuickAlert.confirm(
      title: 'Clear Cart',
      message: 'Are you sure you want to remove all items from your cart?',
      confirmText: 'Clear All',
      cancelText: 'Cancel',
      showCancel: true,
      onConfirm: () {
        CartService.clearAll();
        CustomQuickAlert.success(
          title: 'Cart Cleared',
          message: 'All items have been removed from your cart.',
        );
      },
    );
  }
}
```

## 📱 App Updates & Maintenance

### Update Management
```dart
class AppUpdateController {
  static Future<void> checkForUpdates() async {
    CustomQuickAlert.loading(
      title: 'Checking for Updates',
      message: 'Looking for new version...',
    );

    final updateInfo = await UpdateService.checkForUpdates();
    CustomQuickAlert.dismiss();

    if (updateInfo.hasUpdate) {
      CustomQuickAlert.info(
        title: 'Update Available',
        message: 'Version ${updateInfo.version} is available with new features and improvements.',
        confirmText: 'Update Now',
        cancelText: 'Later',
        showCancel: true,
        onConfirm: () => _downloadUpdate(updateInfo),
      );
    } else {
      CustomQuickAlert.success(
        title: 'Up to Date',
        message: 'You are using the latest version of the app.',
        autoCloseDuration: const Duration(seconds: 2),
      );
    }
  }

  static Future<void> _downloadUpdate(UpdateInfo info) async {
    CustomQuickAlert.loading(
      title: 'Downloading Update',
      message: 'Downloading version ${info.version}...',
    );

    try {
      await UpdateService.downloadAndInstall(info);
      CustomQuickAlert.dismiss();
      
      CustomQuickAlert.success(
        title: 'Update Complete',
        message: 'App will restart to apply the update.',
        confirmText: 'Restart',
      );
    } catch (e) {
      CustomQuickAlert.dismiss();
      
      CustomQuickAlert.error(
        title: 'Update Failed',
        message: 'Failed to download update. Please try again.',
        confirmText: 'Retry',
        onConfirm: () => _downloadUpdate(info),
      );
    }
  }
}
```

## 📋 Form Validation

### Contact Form Handler
```dart
class ContactFormHandler {
  static Future<void> submitContactForm(ContactFormData formData) async {
    // Validate form
    final validationResult = _validateForm(formData);
    if (!validationResult.isValid) {
      _showValidationErrors(validationResult.errors);
      return;
    }

    // Show loading
    CustomQuickAlert.loading(
      title: 'Sending Message',
      message: 'Please wait while we send your message...',
    );

    try {
      await ContactService.submitForm(formData);
      CustomQuickAlert.dismiss(); // Close loading
      _showSubmissionSuccess();
    } catch (e) {
      CustomQuickAlert.dismiss(); // Close loading
      _showSubmissionError();
    }
  }

  static void _showValidationErrors(List<String> errors) {
    final errorList = errors.map((error) => '• $error').join('\n');
    
    CustomQuickAlert.warning(
      title: 'Please Check Your Input',
      message: 'Please fix the following issues:\n\n$errorList',
      confirmText: 'Fix Issues',
    );
  }

  static void _showSubmissionSuccess() {
    CustomQuickAlert.success(
      title: 'Message Sent!',
      message: 'Thank you for contacting us. We\'ll get back to you within 24 hours.',
      confirmText: 'Continue',
      autoCloseDuration: Duration(seconds: 3),
    );
  }

  static void _showSubmissionError() {
    CustomQuickAlert.error(
      title: 'Failed to Send',
      message: 'Unable to send your message. Please try again.',
      confirmText: 'Retry',
    );
  }
}
```

## 🏥 Healthcare App

### Appointment Booking
```dart
class AppointmentBooking {
  static void confirmAppointment(Doctor doctor, DateTime appointmentTime) {
    CustomQuickAlert.confirm(
      title: 'Confirm Appointment',
      message: 'Book appointment with Dr. ${doctor.name} on ${_formatDate(appointmentTime)}?',
      confirmText: 'Book Appointment',
      cancelText: 'Cancel',
      showCancel: true,
      confirmBtnColor: Colors.green,
      onConfirm: () => _processAppointmentBooking(doctor, appointmentTime),
    );
  }

  static Future<void> _processAppointmentBooking(
    Doctor doctor,
    DateTime appointmentTime,
  ) async {
    CustomQuickAlert.loading(
      title: 'Booking Appointment',
      message: 'Please wait while we confirm your appointment...',
    );

    try {
      final appointment = await AppointmentService.bookAppointment(
        doctor.id,
        appointmentTime,
      );
      
      CustomQuickAlert.dismiss(); // Close loading
      _showBookingSuccess(appointment);
    } catch (e) {
      CustomQuickAlert.dismiss(); // Close loading
      _showBookingError(e.toString());
    }
  }

  static void _showBookingSuccess(Appointment appointment) {
    CustomQuickAlert.success(
      title: 'Appointment Booked!',
      message: 'Your appointment has been successfully booked.\n\nAppointment ID: ${appointment.id}',
      confirmText: 'View Details',
      cancelText: 'OK',
      showCancel: true,
    );
  }

  static void _showBookingError(String error) {
    CustomQuickAlert.error(
      title: 'Booking Failed',
      message: 'Unable to book appointment. Please try again.',
      confirmText: 'Retry',
    );
  }

  static String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} at ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
```

## 📱 Social Media App

### Post Actions
```dart
class SocialMediaActions {
  static void showShareOptions(Post post) {
    CustomQuickAlert.custom(
      title: 'Share Post',
      message: 'Choose how you\'d like to share this post:',
      backgroundColor: Colors.blue.shade50,
      confirmText: 'Cancel',
    );
  }

  static void confirmDeletePost(Post post) {
    CustomQuickAlert.confirm(
      title: 'Delete Post',
      message: 'Are you sure you want to delete this post? This action cannot be undone.',
      confirmText: 'Delete',
      cancelText: 'Cancel',
      showCancel: true,
      confirmBtnColor: Colors.red,
      onConfirm: () async {
        CustomQuickAlert.loading(
          title: 'Deleting Post',
          message: 'Please wait...',
        );

        try {
          await SocialService.deletePost(post.id);
          CustomQuickAlert.dismiss();
          
          CustomQuickAlert.success(
            title: 'Post Deleted',
            message: 'Your post has been deleted successfully.',
            autoCloseDuration: Duration(seconds: 2),
          );
        } catch (e) {
          CustomQuickAlert.dismiss();
          
          CustomQuickAlert.error(
            title: 'Delete Failed',
            message: 'Unable to delete post. Please try again.',
          );
        }
      },
    );
  }

  static void reportPost(Post post) {
    CustomQuickAlert.confirm(
      title: 'Report Post',
      message: 'Report this post for inappropriate content?',
      confirmText: 'Report',
      cancelText: 'Cancel',
      showCancel: true,
      onConfirm: () async {
        await SocialService.reportPost(post.id);
        CustomQuickAlert.success(
          title: 'Post Reported',
          message: 'Thank you for your report. We\'ll review this content.',
        );
      },
    );
  }
}
```

## 💾 Data Management

### Backup Operations
```dart
class DataManager {
  static Future<void> performBackup() async {
    CustomQuickAlert.confirm(
      title: 'Backup Data',
      message: 'This will backup all your data to the cloud. Continue?',
      confirmText: 'Start Backup',
      cancelText: 'Cancel',
      showCancel: true,
      onConfirm: () => _executeBackup(),
    );
  }

  static Future<void> _executeBackup() async {
    CustomQuickAlert.loading(
      title: 'Backing Up Data',
      message: 'Please don\'t close the app during backup...',
    );

    try {
      await BackupService.performBackup();
      CustomQuickAlert.dismiss();
      
      CustomQuickAlert.success(
        title: 'Backup Complete!',
        message: 'Your data has been safely backed up to the cloud.',
        confirmText: 'View Details',
        autoCloseDuration: Duration(seconds: 5),
      );
    } catch (e) {
      CustomQuickAlert.dismiss();
      
      CustomQuickAlert.error(
        title: 'Backup Failed',
        message: 'Unable to backup data. Please check your connection and try again.',
        confirmText: 'Retry',
        onConfirm: () => _executeBackup(),
      );
    }
  }

  static void showStorageWarning(double usedPercentage) {
    if (usedPercentage > 0.9) {
      CustomQuickAlert.warning(
        title: 'Storage Almost Full',
        message: 'Your device storage is ${(usedPercentage * 100).toInt()}% full. Consider freeing up space.',
        confirmText: 'Manage Storage',
      );
    }
  }
}
```

## 🔧 Advanced Usage Patterns

### Custom Theme System
```dart
class AppAlerts {
  // Success theme
  static void showSuccess(String title, String message) {
    CustomQuickAlert.success(
      title: title,
      message: message,
      backgroundColor: const Color(0xFFF0FDF4),
      titleColor: const Color(0xFF16A34A),
      messageColor: const Color(0xFF166534),
      confirmBtnColor: const Color(0xFF22C55E),
      customShadows: [
        BoxShadow(
          color: Colors.green.withValues(alpha: 0.1),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }

  // Error theme
  static void showError(String title, String message) {
    CustomQuickAlert.error(
      title: title,
      message: message,
      backgroundColor: const Color(0xFFFEF2F2),
      titleColor: const Color(0xFFDC2626),
      messageColor: const Color(0xFF991B1B),
      confirmBtnColor: const Color(0xFFEF4444),
      customShadows: [
        BoxShadow(
          color: Colors.red.withValues(alpha: 0.1),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }

  // Dark theme variant
  static void showDarkThemeAlert(String title, String message) {
    CustomQuickAlert.info(
      title: title,
      message: message,
      backgroundColor: const Color(0xFF1F2937),
      titleColor: const Color(0xFFF9FAFB),
      messageColor: const Color(0xFFD1D5DB),
      confirmBtnColor: const Color(0xFF3B82F6),
      confirmTextColor: Colors.white,
      borderRadius: 12.0,
    );
  }
}
```

### Performance Optimization
```dart
class AlertManager {
  static Timer? _debounceTimer;
  static final Queue<AlertConfig> _alertQueue = Queue<AlertConfig>();
  static bool _isShowingAlert = false;
  
  // Debounced alerts to prevent spam
  static void showDebouncedSuccess(String title, String message) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      CustomQuickAlert.success(title: title, message: message);
    });
  }
  
  // Queue management for multiple alerts
  static void queueAlert(AlertConfig config) {
    _alertQueue.add(config);
    _processQueue();
  }
  
  static void _processQueue() {
    if (_isShowingAlert || _alertQueue.isEmpty) return;
    
    _isShowingAlert = true;
    final config = _alertQueue.removeFirst();
    
    // Show alert and process next after completion
    config.show().then((_) {
      _isShowingAlert = false;
      _processQueue();
    });
  }

  // Memory cleanup
  static void dispose() {
    _debounceTimer?.cancel();
    _alertQueue.clear();
    _isShowingAlert = false;
  }
}
```

These real-world examples demonstrate how Custom Quick Alert v2.1.1 can be integrated into various application flows to provide excellent user experience and clear communication with users.

---

**Next:** [Authentication Flow →](auth-flow.md)
