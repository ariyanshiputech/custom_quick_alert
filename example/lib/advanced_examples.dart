import 'dart:async';

import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';

/// Advanced examples demonstrating animations, positions, and styling
class AdvancedExamplesPage extends StatelessWidget {
  const AdvancedExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Examples'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildSection(
              'Animation Types',
              <Widget>[
                _buildExampleCard(
                  'Scale Animation',
                  'Default scaling effect',
                  Icons.open_in_full,
                  Colors.blue,
                  _showScaleAnimation,
                ),
                _buildExampleCard(
                  'Fade Animation',
                  'Smooth fade in/out',
                  Icons.blur_on,
                  Colors.purple,
                  _showFadeAnimation,
                ),
                _buildExampleCard(
                  'Slide Down',
                  'Slides from top',
                  Icons.keyboard_arrow_down,
                  Colors.green,
                  _showSlideDownAnimation,
                ),
                _buildExampleCard(
                  'Slide Up',
                  'Slides from bottom',
                  Icons.keyboard_arrow_up,
                  Colors.orange,
                  _showSlideUpAnimation,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Position Examples',
              <Widget>[
                _buildExampleCard(
                  'Top Position',
                  'Alert at screen top',
                  Icons.vertical_align_top,
                  Colors.indigo,
                  _showTopPosition,
                ),
                _buildExampleCard(
                  'Center Position',
                  'Alert at screen center',
                  Icons.vertical_align_center,
                  Colors.teal,
                  _showCenterPosition,
                ),
                _buildExampleCard(
                  'Bottom Position',
                  'Alert at screen bottom',
                  Icons.vertical_align_bottom,
                  Colors.red,
                  _showBottomPosition,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Styling Examples',
              <Widget>[
                _buildExampleCard(
                  'Dark Theme',
                  'Professional dark styling',
                  Icons.dark_mode,
                  Colors.grey[800]!,
                  _showDarkTheme,
                ),
                _buildExampleCard(
                  'Gradient Buttons',
                  'Beautiful gradient effects',
                  Icons.gradient,
                  Colors.pink,
                  _showGradientButtons,
                ),
                _buildExampleCard(
                  'Custom Colors',
                  'Brand-specific colors',
                  Icons.palette,
                  Colors.cyan,
                  _showCustomColors,
                ),
                _buildExampleCard(
                  'Large Size',
                  'Custom width and padding',
                  Icons.aspect_ratio,
                  Colors.brown,
                  _showLargeSize,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Interactive Features',
              <Widget>[
                _buildExampleCard(
                  'Auto Dismiss',
                  'Automatically closes after timer',
                  Icons.timer,
                  Colors.amber,
                  _showAutoDismiss,
                ),
                _buildExampleCard(
                  'Barrier Dismissible',
                  'Tap outside to close',
                  Icons.touch_app,
                  Colors.lime,
                  _showBarrierDismissible,
                ),
                _buildExampleCard(
                  'No Back Button',
                  'Prevents back button dismissal',
                  Icons.block,
                  Colors.redAccent,
                  _showNoBackButton,
                ),
                _buildExampleCard(
                  'Custom Content',
                  'Rich custom widget content',
                  Icons.widgets,
                  Colors.deepOrange,
                  _showCustomContent,
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
            fontSize: 20,
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
        trailing: const Icon(Icons.play_arrow, color: Colors.blue),
        onTap: onTap,
      ),
    );
  }

  // Animation Examples
  void _showScaleAnimation() {
    CustomQuickAlert.success(
      title: 'Scale Animation',
      message: 'This alert uses the default scale animation effect.',
      animationType: CustomQuickAlertAnimationType.scale,
    );
  }

  void _showFadeAnimation() {
    CustomQuickAlert.info(
      title: 'Fade Animation',
      message: 'This alert smoothly fades in and out.',
      animationType: CustomQuickAlertAnimationType.fade,
    );
  }

  void _showSlideDownAnimation() {
    CustomQuickAlert.warning(
      title: 'Slide Down Animation',
      message: 'This alert slides down from the top of the screen.',
      animationType: CustomQuickAlertAnimationType.slideInDown,
    );
  }

  void _showSlideUpAnimation() {
    CustomQuickAlert.error(
      title: 'Slide Up Animation',
      message: 'This alert slides up from the bottom of the screen.',
      animationType: CustomQuickAlertAnimationType.slideInUp,
    );
  }

  // Position Examples
  void _showTopPosition() {
    CustomQuickAlert.success(
      title: 'Top Positioned Alert',
      message: 'This alert appears at the top of the screen.',
      position: CustomQuickAlertPosition.top,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  void _showCenterPosition() {
    CustomQuickAlert.info(
      title: 'Center Positioned Alert',
      message: 'This alert appears in the center of the screen.',
      position: CustomQuickAlertPosition.center,
    );
  }

  void _showBottomPosition() {
    CustomQuickAlert.warning(
      title: 'Bottom Positioned Alert',
      message: 'This alert appears at the bottom of the screen.',
      position: CustomQuickAlertPosition.bottom,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  // Styling Examples
  void _showDarkTheme() {
    CustomQuickAlert.custom(
      title: 'Dark Theme Alert',
      message: 'This alert uses a professional dark theme design.',
      backgroundColor: const Color(0xFF1E1E1E),
      titleColor: Colors.white,
      messageColor: Colors.white70,
      confirmBtnColor: Colors.blue,
      confirmTextColor: Colors.white,
      borderRadius: 16,
    );
  }

  void _showGradientButtons() {
    CustomQuickAlert.success(
      title: 'Gradient Button Style',
      message: 'This alert features beautiful gradient button effects.',
      confirmBtnColor: Colors.purple,
      showCancel: true,
      cancelBtnColor: Colors.grey,
    );
  }

  void _showCustomColors() {
    CustomQuickAlert.custom(
      title: 'Custom Brand Colors',
      message: 'This alert uses custom brand-specific color scheme.',
      backgroundColor: const Color(0xFFFFF3E0),
      titleColor: const Color(0xFFE65100),
      messageColor: const Color(0xFFBF360C),
      confirmBtnColor: const Color(0xFFFF9800),
      confirmTextColor: Colors.white,
      borderRadius: 20,
    );
  }

  void _showLargeSize() {
    CustomQuickAlert.info(
      title: 'Large Custom Size',
      message:
          'This alert demonstrates custom width and padding for larger content areas.',
      width: 400,
      padding: const EdgeInsets.all(32),
      borderRadius: 24,
    );
  }

  // Interactive Features
  void _showAutoDismiss() {
    CustomQuickAlert.success(
      title: 'Auto Dismiss Alert',
      message: 'This alert will automatically close in 3 seconds.',
      autoCloseDuration: const Duration(seconds: 3),
      showConfirm: false,
    );
  }

  void _showBarrierDismissible() {
    CustomQuickAlert.info(
      title: 'Tap Outside to Dismiss',
      message: 'You can tap outside this alert to close it.',
      barrierDismissible: true,
      confirmText: 'Or tap here',
    );
  }

  void _showNoBackButton() {
    CustomQuickAlert.loading(
      title: 'Processing Payment',
      message: 'Please do not use the back button during payment processing.',
    );

    // Auto dismiss after 4 seconds
    unawaited(
      Future<void>.delayed(const Duration(seconds: 4), () {
        CustomQuickAlert.dismiss();
        CustomQuickAlert.success(
          title: 'Payment Complete',
          message: 'Your payment has been processed successfully.',
        );
      }),
    );
  }

  void _showCustomContent() {
    CustomQuickAlert.custom(
      title: 'Rate Our App',
      message: 'How would you rate your experience?',
      backgroundColor: Colors.white,
      customContent: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              5,
              (int index) => IconButton(
                icon: Icon(
                  Icons.star,
                  color: index < 4 ? Colors.amber : Colors.grey[300],
                  size: 32,
                ),
                onPressed: () {
                  CustomQuickAlert.dismiss();
                  CustomQuickAlert.success(
                    title: 'Thank You!',
                    message:
                        'Thanks for rating us ${index + 1} star${index == 0 ? '' : 's'}!',
                    autoCloseDuration: const Duration(seconds: 2),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Tap a star to rate',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      showConfirm: false,
      barrierDismissible: true,
    );
  }
}
