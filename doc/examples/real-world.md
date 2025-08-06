# 💡 Real-World Examples

This guide provides practical, real-world examples of using Custom Quick Alert in various application scenarios.

## 🛒 E-Commerce Application

### Product Purchase Flow
```dart
class ProductPurchaseFlow {
  static Future<void> purchaseProduct(
    BuildContext context,
    Product product,
  ) async {
    // Step 1: Confirmation
    await _showPurchaseConfirmation(context, product);
  }

  static Future<void> _showPurchaseConfirmation(
    BuildContext context,
    Product product,
  ) async {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: 'Confirm Purchase',
      text: 'Are you sure you want to buy ${product.name} for \$${product.price}?',
      confirmBtnText: 'Buy Now',
      cancelBtnText: 'Cancel',
      confirmBtnColor: Colors.green,
      widget: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12),
            Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${product.price}',
              style: TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        _processPurchase(context, product);
      },
    );
  }

  static Future<void> _processPurchase(
    BuildContext context,
    Product product,
  ) async {
    // Step 2: Show loading
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Processing Payment',
      text: 'Please wait while we process your payment...',
      barrierDismissible: false,
    );

    try {
      // Simulate payment processing
      await PaymentService.processPayment(product);
      
      Navigator.of(context).pop(); // Close loading
      _showPurchaseSuccess(context, product);
    } catch (e) {
      Navigator.of(context).pop(); // Close loading
      _showPurchaseError(context, e.toString());
    }
  }

  static void _showPurchaseSuccess(BuildContext context, Product product) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Purchase Successful!',
      text: 'Thank you for your purchase. You will receive a confirmation email shortly.',
      confirmBtnText: 'Continue Shopping',
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        // Navigate to product catalog
      },
      autoCloseDuration: Duration(seconds: 3),
    );
  }

  static void _showPurchaseError(BuildContext context, String error) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Purchase Failed',
      text: 'We couldn\'t process your payment. Please try again.',
      confirmBtnText: 'Retry',
      cancelBtnText: 'Cancel',
      showCancelBtn: true,
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        // Retry purchase logic
      },
    );
  }
}
```

### Shopping Cart Management
```dart
class CartManager {
  static void showItemAddedToCart(BuildContext context, Product product) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Added to Cart!',
      text: '${product.name} has been added to your cart.',
      confirmBtnText: 'View Cart',
      cancelBtnText: 'Continue Shopping',
      showCancelBtn: true,
      autoCloseDuration: Duration(seconds: 2),
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/cart');
      },
    );
  }

  static void showCartEmptyWarning(BuildContext context) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      title: 'Cart is Empty',
      text: 'Add some items to your cart before proceeding to checkout.',
      confirmBtnText: 'Browse Products',
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/products');
      },
    );
  }
}
```

---

## 🔐 Authentication System

### Login Flow
```dart
class AuthenticationFlow {
  static Future<void> handleLogin(
    BuildContext context,
    String email,
    String password,
  ) async {
    // Show loading
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Signing In',
      text: 'Please wait...',
      barrierDismissible: false,
    );

    try {
      final user = await AuthService.login(email, password);
      Navigator.of(context).pop(); // Close loading
      
      if (user.requiresEmailVerification) {
        _showEmailVerificationRequired(context, user.email);
      } else {
        _showLoginSuccess(context, user.name);
      }
    } catch (e) {
      Navigator.of(context).pop(); // Close loading
      _showLoginError(context, e.toString());
    }
  }

  static void _showLoginSuccess(BuildContext context, String userName) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Welcome Back!',
      text: 'Hello $userName, you\'re now signed in.',
      confirmBtnText: 'Continue',
      autoCloseDuration: Duration(seconds: 2),
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, '/home');
      },
    );
  }

  static void _showLoginError(BuildContext context, String error) {
    String userFriendlyMessage;
    String actionText = 'Try Again';
    VoidCallback? action;

    if (error.contains('invalid-email')) {
      userFriendlyMessage = 'Please enter a valid email address.';
    } else if (error.contains('user-not-found')) {
      userFriendlyMessage = 'No account found with this email.';
      actionText = 'Create Account';
      action = () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/register');
      };
    } else if (error.contains('wrong-password')) {
      userFriendlyMessage = 'Incorrect password. Please try again.';
      actionText = 'Forgot Password?';
      action = () {
        Navigator.of(context).pop();
        _showForgotPasswordDialog(context);
      };
    } else {
      userFriendlyMessage = 'Unable to sign in. Please check your connection and try again.';
    }

    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Sign In Failed',
      text: userFriendlyMessage,
      confirmBtnText: actionText,
      onConfirmBtnTap: action ?? () => Navigator.of(context).pop(),
    );
  }

  static void _showEmailVerificationRequired(BuildContext context, String email) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: 'Email Verification Required',
      text: 'Please check your email ($email) and click the verification link to complete your registration.',
      confirmBtnText: 'Resend Email',
      cancelBtnText: 'OK',
      showCancelBtn: true,
      onConfirmBtnTap: () async {
        Navigator.of(context).pop();
        await AuthService.resendVerificationEmail();
        _showVerificationEmailSent(context);
      },
    );
  }
}
```

### Password Reset Flow
```dart
class PasswordResetFlow {
  static void showForgotPasswordDialog(BuildContext context) {
    final emailController = TextEditingController();

    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: 'Reset Password',
      text: 'Enter your email address and we\'ll send you a reset link.',
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'Email Address',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ),
      confirmBtnText: 'Send Reset Link',
      cancelBtnText: 'Cancel',
      showCancelBtn: true,
      onConfirmBtnTap: () {
        if (emailController.text.isNotEmpty) {
          Navigator.of(context).pop();
          _sendPasswordResetEmail(context, emailController.text);
        }
      },
    );
  }

  static Future<void> _sendPasswordResetEmail(
    BuildContext context,
    String email,
  ) async {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Sending Reset Link',
      text: 'Please wait...',
    );

    try {
      await AuthService.sendPasswordResetEmail(email);
      Navigator.of(context).pop(); // Close loading
      
      CustomQuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Reset Link Sent!',
        text: 'Check your email for password reset instructions.',
        confirmBtnText: 'OK',
      );
    } catch (e) {
      Navigator.of(context).pop(); // Close loading
      
      CustomQuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Failed to Send',
        text: 'Unable to send reset email. Please try again.',
        confirmBtnText: 'Retry',
        onConfirmBtnTap: () {
          Navigator.of(context).pop();
          showForgotPasswordDialog(context);
        },
      );
    }
  }
}
```

---

## 📋 Form Validation

### Contact Form
```dart
class ContactFormHandler {
  static Future<void> submitContactForm(
    BuildContext context,
    ContactFormData formData,
  ) async {
    // Validate form
    final validationResult = _validateForm(formData);
    if (!validationResult.isValid) {
      _showValidationErrors(context, validationResult.errors);
      return;
    }

    // Show loading
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Sending Message',
      text: 'Please wait while we send your message...',
    );

    try {
      await ContactService.submitForm(formData);
      Navigator.of(context).pop(); // Close loading
      _showSubmissionSuccess(context);
    } catch (e) {
      Navigator.of(context).pop(); // Close loading
      _showSubmissionError(context);
    }
  }

  static void _showValidationErrors(
    BuildContext context,
    List<String> errors,
  ) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      title: 'Please Check Your Input',
      text: 'Please fix the following issues:',
      widget: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: errors.map((error) => 
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.error_outline, 
                       color: Colors.orange, size: 16),
                  SizedBox(width: 8),
                  Expanded(child: Text(error, style: TextStyle(fontSize: 14))),
                ],
              ),
            ),
          ).toList(),
        ),
      ),
      confirmBtnText: 'Fix Issues',
    );
  }

  static void _showSubmissionSuccess(BuildContext context) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Message Sent!',
      text: 'Thank you for contacting us. We\'ll get back to you within 24 hours.',
      confirmBtnText: 'Continue',
      autoCloseDuration: Duration(seconds: 3),
    );
  }
}
```

---

## 📱 Social Media App

### Post Sharing
```dart
class SocialMediaActions {
  static void showShareOptions(BuildContext context, Post post) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.custom,
      title: 'Share Post',
      text: 'Choose how you\'d like to share this post:',
      backgroundColor: Colors.blue.shade50,
      widget: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildShareOption(
              context,
              'Facebook',
              Icons.facebook,
              Colors.blue.shade800,
              () => _shareToFacebook(context, post),
            ),
            _buildShareOption(
              context,
              'Twitter',
              Icons.flutter_dash, // Using as Twitter icon substitute
              Colors.blue.shade400,
              () => _shareToTwitter(context, post),
            ),
            _buildShareOption(
              context,
              'Copy Link',
              Icons.link,
              Colors.grey.shade600,
              () => _copyLink(context, post),
            ),
            _buildShareOption(
              context,
              'More Options',
              Icons.more_horiz,
              Colors.grey.shade600,
              () => _showMoreOptions(context, post),
            ),
          ],
        ),
      ),
      showCancelBtn: true,
      cancelBtnText: 'Cancel',
    );
  }

  static Widget _buildShareOption(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            SizedBox(width: 16),
            Text(title, style: TextStyle(fontSize: 16)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  static void _copyLink(BuildContext context, Post post) {
    Clipboard.setData(ClipboardData(text: post.shareUrl));
    
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Link Copied!',
      text: 'The post link has been copied to your clipboard.',
      autoCloseDuration: Duration(seconds: 2),
    );
  }
}
```

### Comment System
```dart
class CommentSystem {
  static void showDeleteCommentConfirmation(
    BuildContext context,
    Comment comment,
  ) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: 'Delete Comment?',
      text: 'Are you sure you want to delete this comment? This action cannot be undone.',
      confirmBtnText: 'Delete',
      cancelBtnText: 'Cancel',
      confirmBtnColor: Colors.red,
      widget: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          comment.text,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.grey.shade700,
          ),
        ),
      ),
      onConfirmBtnTap: () async {
        Navigator.of(context).pop();
        await _deleteComment(context, comment);
      },
    );
  }

  static Future<void> _deleteComment(
    BuildContext context,
    Comment comment,
  ) async {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Deleting Comment',
      text: 'Please wait...',
    );

    try {
      await CommentService.deleteComment(comment.id);
      Navigator.of(context).pop(); // Close loading
      
      CustomQuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Comment Deleted',
        text: 'Your comment has been deleted successfully.',
        autoCloseDuration: Duration(seconds: 2),
      );
    } catch (e) {
      Navigator.of(context).pop(); // Close loading
      
      CustomQuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Delete Failed',
        text: 'Unable to delete comment. Please try again.',
        confirmBtnText: 'Retry',
        onConfirmBtnTap: () {
          Navigator.of(context).pop();
          _deleteComment(context, comment);
        },
      );
    }
  }
}
```

---

## 🏥 Healthcare App

### Appointment Booking
```dart
class AppointmentBooking {
  static void confirmAppointment(
    BuildContext context,
    Doctor doctor,
    DateTime appointmentTime,
  ) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: 'Confirm Appointment',
      text: 'Please confirm your appointment details:',
      confirmBtnText: 'Book Appointment',
      cancelBtnText: 'Cancel',
      confirmBtnColor: Colors.green,
      widget: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(doctor.profileImage),
            ),
            SizedBox(height: 16),
            Text(
              'Dr. ${doctor.name}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              doctor.specialization,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(height: 16),
            _buildAppointmentDetail('Date', _formatDate(appointmentTime)),
            _buildAppointmentDetail('Time', _formatTime(appointmentTime)),
            _buildAppointmentDetail('Duration', '30 minutes'),
            _buildAppointmentDetail('Fee', '\$${doctor.consultationFee}'),
          ],
        ),
      ),
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        _processAppointmentBooking(context, doctor, appointmentTime);
      },
    );
  }

  static Widget _buildAppointmentDetail(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }

  static Future<void> _processAppointmentBooking(
    BuildContext context,
    Doctor doctor,
    DateTime appointmentTime,
  ) async {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Booking Appointment',
      text: 'Please wait while we confirm your appointment...',
    );

    try {
      final appointment = await AppointmentService.bookAppointment(
        doctor.id,
        appointmentTime,
      );
      
      Navigator.of(context).pop(); // Close loading
      _showBookingSuccess(context, appointment);
    } catch (e) {
      Navigator.of(context).pop(); // Close loading
      _showBookingError(context, e.toString());
    }
  }

  static void _showBookingSuccess(BuildContext context, Appointment appointment) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Appointment Booked!',
      text: 'Your appointment has been successfully booked.',
      confirmBtnText: 'View Details',
      cancelBtnText: 'OK',
      showCancelBtn: true,
      widget: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 60),
            SizedBox(height: 16),
            Text(
              'Appointment ID: ${appointment.id}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'You will receive a confirmation email shortly.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(
          context,
          '/appointment-details',
          arguments: appointment,
        );
      },
    );
  }
}
```

---

## 💾 Data Management

### Backup and Sync
```dart
class DataManager {
  static void showBackupProgress(BuildContext context) {
    double progress = 0.0;
    late Timer progressTimer;
    
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Backing Up Data',
      text: 'Please don\'t close the app during backup...',
      barrierDismissible: false,
      widget: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              SizedBox(height: 12),
              Text('${(progress * 100).toInt()}% Complete'),
              SizedBox(height: 8),
              Text(
                _getBackupStatusText(progress),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          );
        },
      ),
    );

    // Simulate backup progress
    progressTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (progress >= 1.0) {
        timer.cancel();
        Navigator.of(context).pop();
        _showBackupComplete(context);
        return;
      }
      
      progress += 0.02;
      // Update the StatefulBuilder
      (context as Element).markNeedsBuild();
    });
  }

  static String _getBackupStatusText(double progress) {
    if (progress < 0.3) return 'Preparing data...';
    if (progress < 0.6) return 'Uploading files...';
    if (progress < 0.9) return 'Finalizing backup...';
    return 'Almost done...';
  }

  static void _showBackupComplete(BuildContext context) {
    CustomQuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Backup Complete!',
      text: 'Your data has been safely backed up to the cloud.',
      confirmBtnText: 'View Backup Details',
      cancelBtnText: 'OK',
      showCancelBtn: true,
      autoCloseDuration: Duration(seconds: 5),
    );
  }
}
```

These real-world examples demonstrate how Custom Quick Alert can be integrated into various application flows to provide excellent user experience and clear communication with users.

---

**Next:** [Authentication Flow →](auth-flow.md)
