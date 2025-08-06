import 'dart:async';

import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';

/// Basic examples demonstrating all alert types with simple usage
class BasicExamplesPage extends StatelessWidget {
  const BasicExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Alert Examples'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Basic Alert Types',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // Success Alert
            _buildExampleButton(
              icon: Icons.check_circle,
              color: Colors.green,
              title: 'Success Alert',
              description: 'Show a success message',
              onTap: _showSuccessAlert,
            ),

            const SizedBox(height: 12),

            // Error Alert
            _buildExampleButton(
              icon: Icons.error,
              color: Colors.red,
              title: 'Error Alert',
              description: 'Show an error message',
              onTap: _showErrorAlert,
            ),

            const SizedBox(height: 12),

            // Warning Alert
            _buildExampleButton(
              icon: Icons.warning,
              color: Colors.orange,
              title: 'Warning Alert',
              description: 'Show a warning message',
              onTap: _showWarningAlert,
            ),

            const SizedBox(height: 12),

            // Info Alert
            _buildExampleButton(
              icon: Icons.info,
              color: Colors.blue,
              title: 'Info Alert',
              description: 'Show an information message',
              onTap: _showInfoAlert,
            ),

            const SizedBox(height: 12),

            // Confirm Alert
            _buildExampleButton(
              icon: Icons.help,
              color: Colors.purple,
              title: 'Confirmation Dialog',
              description: 'Ask for user confirmation',
              onTap: _showConfirmAlert,
            ),

            const SizedBox(height: 12),

            // Loading Alert
            _buildExampleButton(
              icon: Icons.hourglass_empty,
              color: Colors.grey,
              title: 'Loading Alert',
              description: 'Show loading with auto-dismiss',
              onTap: _showLoadingAlert,
            ),

            const SizedBox(height: 12),

            // Custom Alert
            _buildExampleButton(
              icon: Icons.star,
              color: Colors.amber,
              title: 'Custom Alert',
              description: 'Fully customized alert',
              onTap: _showCustomAlert,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleButton({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  void _showSuccessAlert() {
    CustomQuickAlert.success(
      title: 'Success!',
      message: 'Your operation was completed successfully.',
      confirmText: 'Great!',
    );
  }

  void _showErrorAlert() {
    CustomQuickAlert.error(
      title: 'Error Occurred',
      message: 'Something went wrong. Please try again later.',
    );
  }

  void _showWarningAlert() {
    CustomQuickAlert.warning(
      title: 'Warning!',
      message: 'Please review your input before proceeding.',
      confirmText: 'Understood',
    );
  }

  void _showInfoAlert() {
    CustomQuickAlert.info(
      title: 'Information',
      message: 'Here is some important information for you.',
      confirmText: 'Got it',
    );
  }

  void _showConfirmAlert() {
    CustomQuickAlert.confirm(
      title: 'Confirmation Required',
      message: 'Are you sure you want to proceed with this action?',
      confirmText: 'Yes, Proceed',
      cancelText: 'Cancel',
      onConfirm: () {
        // Show success after confirmation
        CustomQuickAlert.success(
          title: 'Confirmed!',
          message: 'Your action has been confirmed.',
          autoCloseDuration: const Duration(seconds: 2),
        );
      },
      onCancel: () {
        // Show info when cancelled
        CustomQuickAlert.info(
          title: 'Cancelled',
          message: 'Action was cancelled by user.',
          autoCloseDuration: const Duration(seconds: 2),
        );
      },
    );
  }

  void _showLoadingAlert() {
    CustomQuickAlert.loading(
      title: 'Processing...',
      message: 'Please wait while we process your request.',
    );

    // Simulate async operation
    unawaited(
      Future<void>.delayed(const Duration(seconds: 3), () {
        CustomQuickAlert.dismiss(); // Dismiss loading

        CustomQuickAlert.success(
          title: 'Complete!',
          message: 'Your request has been processed successfully.',
        );
      }),
    );
  }

  void _showCustomAlert() {
    CustomQuickAlert.custom(
      title: 'Welcome Premium User!',
      message: 'Thank you for upgrading to our premium plan.',
      backgroundColor: Colors.deepPurple,
      titleColor: Colors.white,
      messageColor: Colors.white70,
      confirmText: 'Get Started',
      confirmBtnColor: Colors.amber,
      confirmTextColor: Colors.black87,
      borderRadius: 20,
      width: 320,
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
              'Premium Features Unlocked!',
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
