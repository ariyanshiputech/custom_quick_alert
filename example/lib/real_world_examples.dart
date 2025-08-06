import 'dart:async';

import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Real-world examples demonstrating practical use cases
class RealWorldExamplesPage extends StatelessWidget {
  const RealWorldExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-World Examples'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildSection(
              'Authentication & User Management',
              <Widget>[
                _buildExampleCard(
                  'Login Flow',
                  'Complete login with loading and error handling',
                  Icons.login,
                  Colors.blue,
                  () => LoginService.simulateLogin(
                    'user@example.com',
                    'password',
                  ),
                ),
                _buildExampleCard(
                  'Login Error',
                  'Handle login failures gracefully',
                  Icons.error_outline,
                  Colors.red,
                  () => LoginService.simulateLogin('user@example.com', 'wrong'),
                ),
                _buildExampleCard(
                  'Logout Confirmation',
                  'Ask user before logging out',
                  Icons.logout,
                  Colors.orange,
                  LogoutService.confirmLogout,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Data Operations',
              <Widget>[
                _buildExampleCard(
                  'File Upload',
                  'Upload with progress indication',
                  Icons.upload_file,
                  Colors.green,
                  FileUploadService.uploadFile,
                ),
                _buildExampleCard(
                  'Delete Confirmation',
                  'Confirm before deleting important data',
                  Icons.delete_forever,
                  Colors.red,
                  () => DataService.confirmDelete('Important Document'),
                ),
                _buildExampleCard(
                  'Save Changes',
                  'Prompt to save unsaved changes',
                  Icons.save,
                  Colors.blue,
                  SaveService.promptSaveChanges,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Network & Connectivity',
              <Widget>[
                _buildExampleCard(
                  'Network Error',
                  'Handle network connectivity issues',
                  Icons.wifi_off,
                  Colors.red,
                  NetworkStatusHandler.showNetworkError,
                ),
                _buildExampleCard(
                  'Connection Restored',
                  'Notify when connection is restored',
                  Icons.wifi,
                  Colors.green,
                  NetworkStatusHandler.showConnectionRestored,
                ),
                _buildExampleCard(
                  'Slow Connection',
                  'Warn about slow network speed',
                  Icons.network_check,
                  Colors.orange,
                  NetworkStatusHandler.showSlowConnection,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Form Validation & Input',
              <Widget>[
                _buildExampleCard(
                  'Form Validation',
                  'Validate form fields and show errors',
                  Icons.assignment_turned_in,
                  Colors.purple,
                  FormValidator.validateSampleForm,
                ),
                _buildExampleCard(
                  'Required Fields',
                  'Highlight missing required fields',
                  Icons.error,
                  Colors.red,
                  FormValidator.showRequiredFieldsError,
                ),
                _buildExampleCard(
                  'Form Success',
                  'Celebrate successful form submission',
                  Icons.check_circle,
                  Colors.green,
                  FormValidator.showFormSubmitSuccess,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'E-commerce & Payments',
              <Widget>[
                _buildExampleCard(
                  'Payment Processing',
                  'Handle payment flow with loading',
                  Icons.payment,
                  Colors.green,
                  PaymentService.processPayment,
                ),
                _buildExampleCard(
                  'Add to Cart',
                  'Confirm item added to shopping cart',
                  Icons.shopping_cart,
                  Colors.blue,
                  () => ShoppingService.addToCart('Premium Headphones'),
                ),
                _buildExampleCard(
                  'Order Confirmation',
                  'Confirm order placement',
                  Icons.receipt_long,
                  Colors.purple,
                  OrderService.confirmOrder,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'App Features & Notifications',
              <Widget>[
                _buildExampleCard(
                  'App Update',
                  'Notify about new app version',
                  Icons.system_update,
                  Colors.blue,
                  AppUpdateService.showUpdateAvailable,
                ),
                _buildExampleCard(
                  'Feature Unlock',
                  'Celebrate premium feature unlock',
                  Icons.star,
                  Colors.amber,
                  FeatureService.showPremiumUnlock,
                ),
                _buildExampleCard(
                  'Maintenance Mode',
                  'Inform about app maintenance',
                  Icons.construction,
                  Colors.orange,
                  MaintenanceService.showMaintenanceNotice,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildExampleCard(
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(description, style: TextStyle(color: Colors.grey[600])),
        trailing: const Icon(Icons.play_arrow, color: Colors.teal),
        onTap: onTap,
      ),
    );
  }
}

// Service classes for real-world examples
class LoginService {
  static Future<void> simulateLogin(String email, String password) async {
    // Show loading
    unawaited(CustomQuickAlert.loading(
      title: 'Signing In...',
      message: 'Please wait while we authenticate you.',
    ),);
    

    try {
      // Simulate API call
      await Future<void>.delayed(const Duration(seconds: 2));

      // Dismiss loading
      CustomQuickAlert.dismiss();

      if (email == 'user@example.com' && password == 'password') {
        // Success
        await CustomQuickAlert.success(
          title: 'Welcome Back!',
          message: 'You have been successfully signed in.',
          confirmText: 'Continue',
          onConfirm: () {
            // In real app, navigate to dashboard
            if (kDebugMode) {
              debugPrint('Navigating to dashboard...');
            }
          },
        );
      } else {
        // Error
        await CustomQuickAlert.error(
          title: 'Login Failed',
          message: 'Invalid email or password. Please try again.',
          confirmText: 'Try Again',
        );
      }
    } on Exception {
      CustomQuickAlert.dismiss();
      await CustomQuickAlert.error(
        title: 'Connection Error',
        message:
            'Unable to connect to server. Please check your internet connection.',
        confirmText: 'Retry',
        showCancel: true,
        onConfirm: () => simulateLogin(email, password), // Retry
      );
    }
  }
}

class LogoutService {
  static void confirmLogout() {
    CustomQuickAlert.confirm(
      title: 'Logout Confirmation',
      message: 'Are you sure you want to logout?',
      confirmText: 'Yes, Logout',
      cancelText: 'Cancel',
      confirmBtnColor: Colors.red,
      onConfirm: () {
        CustomQuickAlert.loading(
          title: 'Logging Out...',
          message: 'Please wait...',
        );

        Future<void>.delayed(const Duration(seconds: 1), () {
          CustomQuickAlert.dismiss();
          CustomQuickAlert.success(
            title: 'Logged Out',
            message: 'You have been successfully logged out.',
            autoCloseDuration: const Duration(seconds: 2),
          );
        });
      },
    );
  }
}

class FileUploadService {
  static Future<void> uploadFile() async {
    await CustomQuickAlert.loading(
      title: 'Uploading File...',
      message: "Your file is being uploaded. Please don't close the app.",
    );

    try {
      // Simulate file upload
      await Future<void>.delayed(const Duration(seconds: 3));

      CustomQuickAlert.dismiss();

      await CustomQuickAlert.success(
        title: 'Upload Complete!',
        message: 'Your file has been uploaded successfully.',
        confirmText: 'View File',
        showCancel: true,
        cancelText: 'Close',
        onConfirm: () {
          if (kDebugMode) {
            debugPrint('Opening file viewer...');
          }
        },
      );
    } on Exception {
      CustomQuickAlert.dismiss();

      await CustomQuickAlert.error(
        title: 'Upload Failed',
        message: 'Failed to upload file. Would you like to try again?',
        confirmText: 'Retry',
        showCancel: true,
        onConfirm: uploadFile,
      );
    }
  }
}

class DataService {
  static void confirmDelete(String itemName) {
    CustomQuickAlert.warning(
      title: 'Delete $itemName?',
      message:
          'This action cannot be undone. The item will be permanently deleted.',
      confirmText: 'Delete',
      showCancel: true,
      confirmBtnColor: Colors.red,
      onConfirm: () {
        CustomQuickAlert.loading(
          title: 'Deleting...',
          message: 'Please wait while we delete the item.',
        );

        Future<void>.delayed(const Duration(seconds: 1), () {
          CustomQuickAlert.dismiss();

          CustomQuickAlert.success(
            title: 'Deleted Successfully',
            message: '$itemName has been deleted.',
            autoCloseDuration: const Duration(seconds: 2),
            showConfirm: false,
          );
        });
      },
    );
  }
}

class SaveService {
  static void promptSaveChanges() {
    CustomQuickAlert.confirm(
      title: 'Save Changes?',
      message:
          'You have unsaved changes. Do you want to save them before leaving?',
      confirmText: 'Save',
      cancelText: 'Discard',
      confirmBtnColor: Colors.blue,
      cancelBtnColor: Colors.grey,
      onConfirm: () {
        CustomQuickAlert.loading(
          title: 'Saving...',
          message: 'Please wait while we save your changes.',
        );

        Future<void>.delayed(const Duration(seconds: 1), () {
          CustomQuickAlert.dismiss();
          CustomQuickAlert.success(
            title: 'Changes Saved',
            message: 'Your changes have been saved successfully.',
            autoCloseDuration: const Duration(seconds: 2),
          );
        });
      },
      onCancel: () {
        CustomQuickAlert.info(
          title: 'Changes Discarded',
          message: 'Your unsaved changes have been discarded.',
          autoCloseDuration: const Duration(seconds: 2),
        );
      },
    );
  }
}

class NetworkStatusHandler {
  static void showNetworkError() {
    CustomQuickAlert.error(
      title: 'No Internet Connection',
      message: 'Please check your internet connection and try again.',
      confirmText: 'Retry',
      showCancel: true,
      cancelText: 'Offline Mode',
      position: CustomQuickAlertPosition.top,
      onConfirm: () {
        if (kDebugMode) {
          debugPrint('Retrying connection...');
        }
      },
      onCancel: () {
        CustomQuickAlert.info(
          title: 'Offline Mode',
          message: 'You are now in offline mode. Some features may be limited.',
          position: CustomQuickAlertPosition.top,
          autoCloseDuration: const Duration(seconds: 3),
        );
      },
    );
  }

  static void showConnectionRestored() {
    CustomQuickAlert.success(
      title: 'Connection Restored',
      message: "You're back online! Syncing your data...",
      position: CustomQuickAlertPosition.top,
      autoCloseDuration: const Duration(seconds: 3),
      showConfirm: false,
    );
  }

  static void showSlowConnection() {
    CustomQuickAlert.warning(
      title: 'Slow Connection',
      message:
          'Your internet connection seems slow. Some features may take longer to load.',
      position: CustomQuickAlertPosition.top,
      autoCloseDuration: const Duration(seconds: 4),
      showConfirm: false,
    );
  }
}

class FormValidator {
  static void validateSampleForm() {
    final List<String> errors = <String>[
      'Email is required',
      'Password must be at least 8 characters',
    ];

    CustomQuickAlert.warning(
      title: 'Form Validation Error',
      message: 'Please fix the following errors:\n\n• ${errors.join('\n• ')}',
      confirmText: 'Fix Errors',
      borderRadius: 16,
    );
  }

  static void showRequiredFieldsError() {
    CustomQuickAlert.error(
      title: 'Required Fields Missing',
      message: 'Please fill in all required fields marked with *',
    );
  }

  static void showFormSubmitSuccess() {
    CustomQuickAlert.success(
      title: 'Form Submitted!',
      message: 'Thank you! Your information has been submitted successfully.',
      confirmText: 'Continue',
      onConfirm: () {
        if (kDebugMode) {
          debugPrint('Form submission completed');
        }
      },
    );
  }
}

class PaymentService {
  static Future<void> processPayment() async {
    await CustomQuickAlert.loading(
      title: 'Processing Payment...',
      message: 'Please wait while we process your payment securely.',
    );

    await Future<void>.delayed(const Duration(seconds: 3));

    CustomQuickAlert.dismiss();

    await CustomQuickAlert.success(
      title: 'Payment Successful!',
      message: r'Your payment of $99.99 has been processed successfully.',
      confirmText: 'View Receipt',
      onConfirm: () {
        if (kDebugMode) {
          debugPrint('Opening receipt...');
        }
      },
    );
  }
}

class ShoppingService {
  static void addToCart(String itemName) {
    CustomQuickAlert.success(
      title: 'Added to Cart!',
      message: '$itemName has been added to your shopping cart.',
      confirmText: 'View Cart',
      showCancel: true,
      cancelText: 'Continue Shopping',
      autoCloseDuration: const Duration(seconds: 3),
      position: CustomQuickAlertPosition.top,
      onConfirm: () {
        if (kDebugMode) {
          debugPrint('Opening cart...');
        }
      },
    );
  }
}

class OrderService {
  static void confirmOrder() {
    CustomQuickAlert.confirm(
      title: 'Confirm Your Order',
      message: r'Are you ready to place your order for $299.99?',
      confirmText: 'Place Order',
      cancelText: 'Review Cart',
      confirmBtnColor: Colors.green,
      onConfirm: () {
        CustomQuickAlert.loading(
          title: 'Placing Order...',
          message: 'Please wait while we process your order.',
        );

        Future<void>.delayed(const Duration(seconds: 2), () {
          CustomQuickAlert.dismiss();
          CustomQuickAlert.success(
            title: 'Order Placed!',
            message: 'Your order #12345 has been placed successfully.',
            confirmText: 'Track Order',
          );
        });
      },
    );
  }
}

class AppUpdateService {
  static void showUpdateAvailable() {
    CustomQuickAlert.info(
      title: 'App Update Available',
      message: 'Version 2.0 is now available with exciting new features!',
      confirmText: 'Update Now',
      showCancel: true,
      cancelText: 'Later',
      confirmBtnColor: Colors.blue,
      onConfirm: () {
        CustomQuickAlert.loading(
          title: 'Downloading Update...',
          message: 'Please wait while we download the latest version.',
        );

        Future<void>.delayed(const Duration(seconds: 3), () {
          CustomQuickAlert.dismiss();
          CustomQuickAlert.success(
            title: 'Update Complete!',
            message: 'The app will restart to apply the update.',
            autoCloseDuration: const Duration(seconds: 2),
          );
        });
      },
    );
  }
}

class FeatureService {
  static void showPremiumUnlock() {
    CustomQuickAlert.custom(
      title: 'Premium Unlocked!',
      message: 'Congratulations! You now have access to all premium features.',
      backgroundColor: Colors.deepPurple,
      titleColor: Colors.white,
      messageColor: Colors.white70,
      confirmText: 'Explore Features',
      confirmBtnColor: Colors.amber,
      confirmTextColor: Colors.black87,
      borderRadius: 20,
      customContent: Column(
        children: <Widget>[
          const Icon(Icons.star, color: Colors.amber, size: 60),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.amber.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Welcome to Premium!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MaintenanceService {
  static void showMaintenanceNotice() {
    CustomQuickAlert.warning(
      title: 'Scheduled Maintenance',
      message:
          'The app will be under maintenance from 2:00 AM to 4:00 AM EST. Some features may be unavailable during this time.',
      confirmText: 'Understood',
      backgroundColor: Colors.orange.shade50,
      titleColor: Colors.orange.shade800,
      messageColor: Colors.orange.shade700,
      confirmBtnColor: Colors.orange,
    );
  }
}
