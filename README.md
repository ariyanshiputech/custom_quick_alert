<div align="center">

[![Banner](https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/banner.png)](https://github.com/ariyanshiputech/custom_quick_alert)

### *The most beautiful and customizable alert dialogs for Flutter*

*`Create stunning, professional-looking alerts with smooth animations, extensive customization options, and zero hassle setup.`*

[![Build Status](https://img.shields.io/github/actions/workflow/status/ariyanshiputech/custom_quick_alert/main.yaml?branch=main&style=for-the-badge&logo=github)](https://github.com/ariyanshiputech/custom_quick_alert/actions) [![GitHub Stars](https://img.shields.io/github/stars/ariyanshiputech/custom_quick_alert?style=for-the-badge&logo=github)](https://github.com/ariyanshiputech/custom_quick_alert) [![Code Coverage](https://img.shields.io/codecov/c/github/ariyanshiputech/custom_quick_alert?style=for-the-badge&logo=codecov)](https://codecov.io/gh/ariyanshiputech/custom_quick_alert) [![Contributors](https://img.shields.io/github/contributors/ariyanshiputech/custom_quick_alert?style=for-the-badge)](https://github.com/ariyanshiputech/custom_quick_alert/graphs/contributors) [![License](https://img.shields.io/github/license/ariyanshiputech/custom_quick_alert?style=for-the-badge)](https://github.com/ariyanshiputech/custom_quick_alert/blob/main/LICENSE.md) 
[![Platform](https://img.shields.io/badge/platform-flutter-blue.svg?style=for-the-badge&logo=flutter)](https://flutter.dev) [![Package](https://img.shields.io/badge/package-custom_quick_alert-blue.svg?style=for-the-badge&logo=dart)](https://pub.dev/packages/custom_quick_alert) [![Pub Version](https://img.shields.io/pub/v/custom_quick_alert.svg?style=for-the-badge&logo=dart)](https://pub.dev/packages/custom_quick_alert)


</div>

## 🌟 Demo

<div align="center">

![Demo](https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/demo.gif)

*Experience the full power of Custom Quick Alert in action*

</div>

---

## ✨ Features

<table>
<tr>
<td width="50%">

### � **Core Features**
- 🎨 **7 Pre-built Alert Types** - Success, Error, Warning, Info, Confirm, Loading, and Custom
- 🎬 **Smooth Lottie Animations** - High-quality, engaging animations for each type
- � **Context-Free Usage** - Trigger alerts from anywhere without passing context
- ⚡ **One-Line Implementation** - Beautiful alerts with minimal code
- 📱 **Responsive Design** - Adapts to all screen sizes and orientations

</td>
<td width="50%">

### ⚙️ **Customization**
- 🎨 **Full Theme Control** - Colors, fonts, backgrounds, and more
- 🔧 **Custom Widgets** - Embed your own widgets for unlimited flexibility
- 🎭 **6 Animation Types** - Scale, slide, rotate entrance animations
- � **3 Position Options** - Center, top, or bottom positioning
- ⏱️ **Auto-dismiss Timer** - Automatic closure with custom duration
- 🛡️ **Barrier Control** - Configurable tap-to-dismiss behavior

</td>
</tr>
</table>

## 📸 Screenshots & Previews

<div align="center">

### 🎯 Alert Types Overview

| Success ✅ | Error ❌ | Warning ⚠️ |
|:----------:|:--------:|:----------:|
| ![Success](https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/success.gif) | ![Error](https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/error.gif) | ![Warning](https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/warning.gif) |
| Perfect for confirmations | Handle errors gracefully | Important notifications |

| Info ℹ️ | Confirm 🤔 | Loading ⏳ |
|:-------:|:----------:|:----------:|
| ![Info](https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/info.gif) | ![Confirm](https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/confirm.gif) | ![Loading](https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/loading.gif) |
| Share information | Get user decisions | Show progress |

### 🎨 Dialog Previews

<table>
<tr>
<td align="center">
<img src="https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/success_dialog.png" width="200"/>
<br><b>Success Dialog</b>
</td>
<td align="center">
<img src="https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/error_dialog.png" width="200"/>
<br><b>Error Dialog</b>
</td>
<td align="center">
<img src="https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/warning_dialog.png" width="200"/>
<br><b>Warning Dialog</b>
</td>
</tr>
<tr>
<td align="center">
<img src="https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/info_dialog.png" width="200"/>
<br><b>Info Dialog</b>
</td>
<td align="center">
<img src="https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/confirm_dialog.png" width="200"/>
<br><b>Confirm Dialog</b>
</td>
<td align="center">
<img src="https://raw.githubusercontent.com/ariyanshiputech/custom_quick_alert/main/screenshots/custom_dialog.png" width="200"/>
<br><b>Custom Dialog</b>
</td>
</tr>
</table>

</div>
## 🚀 Quick Start Guide

### 📦 Installation

Add `custom_quick_alert` to your Flutter project:

```bash
flutter pub add custom_quick_alert
```

### 📝 Import

```dart
import 'package:custom_quick_alert/custom_quick_alert.dart';
```

### ⚙️ Setup (Required)

**🚨 Important:** To enable context-free alerts, add the navigator key to your `MaterialApp`:

```dart
import 'package:flutter/material.dart';
import 'package:custom_quick_alert/custom_quick_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Quick Alert Demo',
      // 🔑 This line enables context-free alerts
      navigatorKey: customQuickAlertNavigatorKey,
      home: const HomePage(),
    );
  }
}
```

### 🎯 Basic Usage

```dart
// Success alert
CustomQuickAlert.success(
  title: 'Success!',
  message: 'Operation completed successfully.',
);

// Error alert
CustomQuickAlert.error(
  title: 'Error!',
  message: 'Something went wrong.',
);

// Warning alert
CustomQuickAlert.warning(
  title: 'Warning!',
  message: 'Please review your input.',
);
```

---

## � Comprehensive Examples

### 🎯 All Alert Types

<details>
<summary><b>🔍 Click to expand examples</b></summary>

#### ✅ Success Alert
```dart
CustomQuickAlert.success(
  title: 'Account Created!',
  message: 'Welcome to our app! Your account has been successfully created.',
);
```

#### ❌ Error Alert
```dart
CustomQuickAlert.error(
  title: 'Connection Failed',
  message: 'Unable to connect to the server. Please check your internet connection and try again.',
);
```

#### ⚠️ Warning Alert
```dart
CustomQuickAlert.warning(
  title: 'Unsaved Changes',
  message: 'You have unsaved changes. Are you sure you want to leave this page?',
);
```

#### ℹ️ Info Alert
```dart
CustomQuickAlert.info(
  title: 'Pro Tip!',
  message: 'You can swipe left on any item to access quick actions.',
);
```

#### 🤔 Confirm Alert
```dart
CustomQuickAlert.confirm(
  title: 'Delete Account',
  message: 'This action cannot be undone. Are you sure you want to delete your account?',
  confirmText: 'Delete',
  cancelText: 'Cancel',
  onConfirm: () {
    // Handle confirmation
    print('Account deleted');
    CustomQuickAlert.dismiss();
  },
  onCancel: () {
    print('Action cancelled');
  },
);
```

#### ⏳ Loading Alert
```dart
void processPayment() async {
  // Show loading
  CustomQuickAlert.loading(
    title: 'Processing Payment',
    message: 'Please wait while we process your payment...',
  );

  try {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 3));
    
    // Dismiss loading and show success
    CustomQuickAlert.dismiss();
    CustomQuickAlert.success(
      title: 'Payment Successful!',
      message: 'Your payment has been processed successfully.',
    );
  } catch (e) {
    // Dismiss loading and show error
    CustomQuickAlert.dismiss();
    CustomQuickAlert.error(
      title: 'Payment Failed',
      message: 'An error occurred while processing your payment.',
    );
  }
}
```

</details>

## 🎨 Advanced Customization

### 🛠️ Custom Alert with Full Control

```dart
CustomQuickAlert.show(
  type: CustomQuickAlertType.custom,
  title: '🌟 Rate Your Experience',
  message: 'How would you rate our service today?',
  
  // Custom Lottie animation
  lottieAsset: 'assets/animations/custom.json',
  
  // Custom widget content
  customContent: Container(
    margin: const EdgeInsets.symmetric(vertical: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) => 
        Icon(
          index < 4 ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 30,
        ),
      ),
    ),
  ),
  
  // Styling
  backgroundColor: const Color(0xFF1E1E2E),
  titleColor: Colors.white,
  messageColor: Colors.white70,
  borderRadius: 20.0,
  
  // Buttons
  confirmText: '✨ Submit Rating',
  cancelText: '⏰ Later',
  showCancel: true,
  confirmBtnColor: Colors.purple,
  cancelBtnColor: Colors.grey,
  
  // Animations & Position
  animType: CustomQuickAlertAnimType.slideInUp,
  position: CustomQuickAlertPosition.center,
  
  // Auto dismiss
  autoCloseDuration: const Duration(seconds: 10),
  
  // Callbacks
  onConfirm: () {
    print('Rating submitted!');
    CustomQuickAlert.dismiss();
    
    // Show thank you message
    CustomQuickAlert.success(
      title: 'Thank You!',
      message: 'Your feedback helps us improve.',
    );
  },
  onCancel: () {
    print('Rating postponed');
  },
);
```

### 📊 Customization Parameters

<details>
<summary><b>📋 Complete Parameter Reference</b></summary>

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `type` | `CustomQuickAlertType` | **Required** - Alert type | - |
| `title` | `String?` | Alert title | `null` |
| `message` | `String?` | Alert message | `null` |
| `lottieAsset` | `String?` | Custom Lottie animation path | Default for type |
| `customContent` | `Widget?` | Custom widget content | `null` |
| `animType` | `CustomQuickAlertAnimType` | Entrance animation | `scale` |
| `position` | `CustomQuickAlertPosition` | Screen position | `center` |
| `barrierDismissible` | `bool` | Tap outside to dismiss | `true` |
| `showCancel` | `bool` | Show cancel button | `false` |
| `showConfirm` | `bool` | Show confirm button | `true` |
| `confirmText` | `String` | Confirm button text | `'OK'` |
| `cancelText` | `String` | Cancel button text | `'Cancel'` |
| `onConfirm` | `VoidCallback?` | Confirm action | `null` |
| `onCancel` | `VoidCallback?` | Cancel action | `null` |
| `confirmBtnColor` | `Color` | Confirm button color | Theme dependent |
| `cancelBtnColor` | `Color` | Cancel button color | Theme dependent |
| `confirmTextColor` | `Color` | Confirm text color | White |
| `cancelTextColor` | `Color` | Cancel text color | Theme dependent |
| `backgroundColor` | `Color` | Dialog background | Theme dependent |
| `titleColor` | `Color` | Title text color | Theme dependent |
| `messageColor` | `Color` | Message text color | Theme dependent |
| `autoCloseDuration` | `Duration?` | Auto dismiss timer | `null` |
| `borderRadius` | `double` | Dialog corner radius | `16.0` |
| `width` | `double?` | Custom dialog width | Auto |
| `disableBackBtn` | `bool` | Disable Android back | `false` |

</details>

### 🎭 Animation Types

```dart
// Available animation types
CustomQuickAlertAnimType.scale        // Default smooth scale
CustomQuickAlertAnimType.rotate       // Rotate entrance
CustomQuickAlertAnimType.slideInDown  // Slide from top
CustomQuickAlertAnimType.slideInUp    // Slide from bottom
CustomQuickAlertAnimType.slideInLeft  // Slide from left
CustomQuickAlertAnimType.slideInRight // Slide from right
```

### 📍 Position Options

```dart
// Available positions
CustomQuickAlertPosition.center  // Center of screen (default)
CustomQuickAlertPosition.top     // Top of screen
CustomQuickAlertPosition.bottom  // Bottom of screen
```

### 🎯 Alert Types

```dart
// All available alert types
CustomQuickAlertType.success  // ✅ Success alerts
CustomQuickAlertType.error    // ❌ Error alerts
CustomQuickAlertType.warning  // ⚠️ Warning alerts
CustomQuickAlertType.info     // ℹ️ Info alerts
CustomQuickAlertType.confirm  // 🤔 Confirmation dialogs
CustomQuickAlertType.loading  // ⏳ Loading indicators
CustomQuickAlertType.custom   // 🎨 Fully custom alerts
```

---

## 🎯 Common Use Cases

<details>
<summary><b>� Real-world Examples</b></summary>

### 🔐 Authentication Flow
```dart
// Login validation
void handleLogin(String email, String password) async {
  if (email.isEmpty || password.isEmpty) {
    CustomQuickAlert.warning(
      title: 'Missing Information',
      message: 'Please fill in all required fields.',
    );
    return;
  }

  CustomQuickAlert.loading(title: 'Signing in...');
  
  try {
    await authService.login(email, password);
    CustomQuickAlert.dismiss();
    CustomQuickAlert.success(
      title: 'Welcome Back!',
      message: 'You have successfully logged in.',
    );
  } catch (e) {
    CustomQuickAlert.dismiss();
    CustomQuickAlert.error(
      title: 'Login Failed',
      message: 'Invalid credentials. Please try again.',
    );
  }
}
```

### 🛒 E-commerce Actions
```dart
void addToCart(Product product) {
  CustomQuickAlert.confirm(
    title: 'Add to Cart',
    message: 'Add "${product.name}" to your cart?',
    confirmText: 'Add Item',
    onConfirm: () {
      cart.add(product);
      CustomQuickAlert.dismiss();
      CustomQuickAlert.success(
        title: 'Added to Cart!',
        message: '${product.name} has been added to your cart.',
        autoCloseDuration: const Duration(seconds: 2),
      );
    },
  );
}
```

### 📱 App Updates
```dart
void checkForUpdates() async {
  CustomQuickAlert.loading(title: 'Checking for updates...');
  
  final hasUpdate = await updateService.checkForUpdate();
  CustomQuickAlert.dismiss();
  
  if (hasUpdate) {
    CustomQuickAlert.info(
      title: 'Update Available',
      message: 'A new version of the app is available. Would you like to update now?',
      confirmText: 'Update',
      showCancel: true,
      onConfirm: () => updateService.startUpdate(),
    );
  } else {
    CustomQuickAlert.success(
      title: 'Up to Date',
      message: 'You are running the latest version.',
    );
  }
}
```

</details>

---

## 🔧 Utility Methods

### 📤 Dismiss Alert
```dart
// Programmatically dismiss the current alert
CustomQuickAlert.dismiss();
```

### 🎨 Custom Styling Helper
```dart
// Create consistent styling across your app
class AppAlerts {
  static void showSuccess(String title, String message) {
    CustomQuickAlert.success(
      title: title,
      message: message,
      confirmBtnColor: Colors.green.shade600,
      backgroundColor: Colors.green.shade50,
      borderRadius: 12.0,
    );
  }
  
  static void showError(String title, String message) {
    CustomQuickAlert.error(
      title: title,
      message: message,
      confirmBtnColor: Colors.red.shade600,
      backgroundColor: Colors.red.shade50,
      borderRadius: 12.0,
    );
  }
}
```

---

## 📱 Platform Support

<div align="center" style="width: 100%; overflow-x: auto;">

| Platform | Support | Notes |
|----------|---------|-------|
| 🤖 **Android** | ✅ Full | All features supported |
| 🍎 **iOS** | ✅ Full | All features supported |
| 🌐 **Web** | ✅ Full | All features supported |
| 🖥️ **macOS** | ✅ Full | All features supported |
| 🐧 **Linux** | ✅ Full | All features supported |
| 🪟 **Windows** | ✅ Full | All features supported |

</div>

---

## ⚡ Performance Tips

<details>
<summary><b>🚀 Optimization Guide</b></summary>

### 🎯 Best Practices

1. **Preload Animations**: Include animations in your asset bundle
2. **Reuse Instances**: Use static methods for better performance
3. **Memory Management**: Always dismiss loading alerts
4. **Custom Animations**: Optimize Lottie files for mobile

### 📊 Benchmarks

- **Cold Start**: < 50ms initialization
- **Alert Display**: < 100ms to show
- **Memory Usage**: < 2MB additional RAM
- **Animation Performance**: 60 FPS on all platforms

</details>

---

## 🐛 Troubleshooting

<details>
<summary><b>❓ Common Issues & Solutions</b></summary>

### Issue: Alert not showing
**Solution**: Ensure `customQuickAlertNavigatorKey` is set in `MaterialApp`

```dart
MaterialApp(
  navigatorKey: customQuickAlertNavigatorKey, // ← Add this
  // ... other properties
)
```

### Issue: Animation not working
**Solution**: Verify Lottie asset path in `pubspec.yaml`

```yaml
flutter:
  assets:
    - assets/animations/
```

### Issue: Custom colors not applying
**Solution**: Use the correct color parameters

```dart
CustomQuickAlert.show(
  backgroundColor: Colors.blue.shade50,  // Dialog background
  titleColor: Colors.blue.shade900,     // Title color
  messageColor: Colors.blue.shade700,   // Message color
);
```

</details>

### 🚀 How to Contribute

<details>
<summary><b>📋 Contribution Guidelines</b></summary>

#### 🐛 Bug Reports
1. Check existing issues first
2. Use the bug report template
3. Include reproduction steps
4. Provide system information

#### ✨ Feature Requests  
1. Search existing feature requests
2. Use the feature request template
3. Explain the use case
4. Provide mockups if applicable

#### 🔧 Code Contributions
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Follow the coding standards
4. Add tests for new features
5. Update documentation
6. Commit changes (`git commit -m 'Add amazing feature'`)
7. Push to branch (`git push origin feature/amazing-feature`)
8. Open a Pull Request

#### � Documentation
- Improve README clarity
- Add more examples
- Fix typos and grammar
- Translate to other languages

</details>

### 👨‍💻 Development Setup

```bash
# Clone the repository
git clone https://github.com/ariyanshiputech/custom_quick_alert.git

# Navigate to project
cd custom_quick_alert

# Install dependencies
flutter pub get

# Run example app
cd example
flutter run

# Run tests
flutter test

# Check code coverage
flutter test --coverage
```

---

## 📄 License
<div align="center">

**Custom Quick Alert** is released under the **MIT License**.

[![License](https://img.shields.io/github/license/ariyanshiputech/custom_quick_alert?style=for-the-badge&color=green)](https://github.com/ariyanshiputech/custom_quick_alert/blob/main/LICENSE)
</div>

---

## 💝 Show Your Support

<div align="center">

**If you find this package helpful, please consider:**

[![⭐ Star on GitHub](https://img.shields.io/badge/⭐-Star_on_GitHub-yellow?style=for-the-badge&logo=github)](https://github.com/ariyanshiputech/custom_quick_alert)
[![👤 Follow Developer](https://img.shields.io/badge/👤-Follow_Developer-blue?style=for-the-badge&logo=github)](https://github.com/ariyanshiputech)
[![💰 Sponsor Project](https://img.shields.io/badge/💰-Sponsor_Project-red?style=for-the-badge&logo=github-sponsors)](https://github.com/sponsors/ariyanshiputech)

### 🌟 Ways to Support

- ⭐ **Star this repository** - Help others discover this package
- 🐛 **Report bugs** - Help improve the package quality
- 💡 **Request features** - Share your ideas for improvements
- 📢 **Share with community** - Spread the word on social media
- 💖 **Contribute code** - Submit pull requests
- 📝 **Improve docs** - Help make documentation better

</div>

---

## 📚 Resources & Links

<div align="center">

| 📖 Resource | 🔗 Link | 📝 Description |
|-------------|---------|----------------|
| **Documentation** | [GitHub Wiki](https://github.com/ariyanshiputech/custom_quick_alert/wiki) | Complete documentation and guides |
| **Package** | [pub.dev](https://pub.dev/packages/custom_quick_alert) | Official Dart package repository |
| **Example App** | [Live Demo](https://github.com/ariyanshiputech/custom_quick_alert/tree/main/example) | Working example implementation |
| **Bug Reports** | [Issues](https://github.com/ariyanshiputech/custom_quick_alert/issues) | Report bugs and request features |
| **Discussions** | [GitHub Discussions](https://github.com/ariyanshiputech/custom_quick_alert/discussions) | Community discussions and Q&A |
| **Changelog** | [CHANGELOG.md](https://github.com/ariyanshiputech/custom_quick_alert/blob/main/CHANGELOG.md) | Version history and updates |

</div>

---
<div align="center">

## 🎯 **Custom Quick Alert**
### *Elevating Flutter apps with beautiful, customizable alerts*
<a href="https://github.com/ariyanshiputech">
  <img src="https://avatars.githubusercontent.com/u/181628538?v=4" width="120px;" style="border-radius: 50%;" alt="Ariyan Shipu"/>
</a>
</div>
<div align="center">
*Flutter Developer & Open Source Enthusiast*

### **[Ariyan Shipu](https://github.com/ariyanshiputech)**
[![GitHub](https://img.shields.io/badge/GitHub-ariyanshiputech-black?style=for-the-badge&logo=github)](https://github.com/ariyanshiputech) [![Website](https://img.shields.io/badge/🌐-ariyanshipu.me-blue?style=for-the-badge)](https://ariyanshipu.me/)
[![Pub.dev](https://img.shields.io/badge/pub.dev-custom__quick__alert-blue?style=for-the-badge&logo=dart)](https://pub.dev/packages/custom_quick_alert)[![Pub.dev](https://img.shields.io/pub/v/custom_quick_alert.svg?style=for-the-badge&logo=dart&Level=")](https://pub.dev/packages/custom_quick_alert)
[![Sponsor](https://img.shields.io/badge/💖-Sponsor_Me-yellow?style=for-the-badge&logo=github-sponsors)](https://github.com/sponsors/ariyanshiputech)
*Thank you for using Custom Quick Alert! 🙏*

</div>
