# 📦 Installation Guide

This guide walks you through installing and setting up Custom Quick Alert in your Flutter project.

## 📋 Prerequisites

- Flutter SDK: `>=3.0.0`
- Dart SDK: `>=3.0.0`
- Android API Level: `>=21`
- iOS Version: `>=11.0`

## 🚀 Installation Steps

### 1. Add Dependency

Add `custom_quick_alert` to your `pubspec.yaml`:

```yaml
dependencies:
  custom_quick_alert: ^2.1.1
```

### 2. Install Package

Run the following command in your terminal:

```bash
flutter pub add custom_quick_alert
```

### 3. Setup (One-Time Configuration)

**📌 Important:** Configure the global navigator key for context-free usage:

```dart
import 'package:flutter/material.dart';
import 'package:custom_quick_alert/custom_quick_alert.dart';

// 1. Create global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
  // 2. Initialize CustomQuickAlert
  CustomQuickAlert.initialize(navigatorKey);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // 3. Assign navigator key
      title: 'Custom Quick Alert Demo',
      home: const HomePage(),
    );
  }
}
```

### 4. Import Package

Import the package in your Dart files:

```dart
import 'package:custom_quick_alert/custom_quick_alert.dart';
```

## 🔧 Platform-Specific Setup

### Android Setup

No additional setup required! The package works out of the box on Android.

**Minimum Requirements:**
- `compileSdkVersion 34`
- `minSdkVersion 21`
- `targetSdkVersion 34`

### iOS Setup

No additional setup required! The package works out of the box on iOS.

**Minimum Requirements:**
- iOS 11.0+
- Xcode 12.0+

### Web Setup

The package supports Flutter Web with no additional configuration.

**Browser Support:**
- Chrome 70+
- Firefox 65+
- Safari 12+
- Edge 79+

### Desktop Setup

The package supports Flutter Desktop (Windows, macOS, Linux) with no additional configuration.

## ✅ Verify Installation

Create a simple test to verify the installation:

```dart
import 'package:flutter/material.dart';
import 'package:custom_quick_alert/custom_quick_alert.dart';

class TestAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Alert')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            CustomQuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              title: 'Installation Successful!',
              text: 'Custom Quick Alert is working correctly.',
            );
          },
          child: Text('Test Alert'),
        ),
      ),
    );
  }
}
```

## 🔄 Updating

To update to the latest version:

1. Check the latest version on [pub.dev](https://pub.dev/packages/custom_quick_alert)
2. Update your `pubspec.yaml`
3. Run `flutter pub get`
4. Check the [migration guide](migration-guide.md) for breaking changes

## 🐛 Troubleshooting Installation

### Common Issues

**Issue: Package not found**
```
Because no versions of custom_quick_alert match >=2.0.3 <3.0.0...
```

**Solution:** Ensure you have the latest Flutter version and run:
```bash
flutter pub cache repair
flutter clean
flutter pub get
```

**Issue: Build errors after installation**
```
Error: The method 'show' isn't defined for the type 'CustomQuickAlert'
```

**Solution:** Make sure you've imported the package correctly and restarted your IDE.

**Issue: Animation files not loading**
```
Unable to load asset: packages/custom_quick_alert/assets/animations/success.json
```

**Solution:** Run `flutter clean` and `flutter pub get`, then restart your app.

### Platform-Specific Issues

#### Android
- If you encounter build issues, ensure your `android/app/build.gradle` has the correct `compileSdkVersion`
- For ProGuard issues, add rules in `android/app/proguard-rules.pro`

#### iOS
- If you see signing issues, check your iOS deployment target in `ios/Podfile`
- For CocoaPods issues, run `cd ios && pod install`

#### Web
- If animations don't load, ensure your web server serves `.json` files correctly
- For CORS issues in debug mode, use `flutter run -d chrome --web-renderer html`

## 📞 Need Help?

If you're still having issues:

1. Check our [FAQ](troubleshooting/faq.md)
2. Search [existing issues](https://github.com/ariyanshiputech/custom_quick_alert/issues)
3. Create a [new issue](https://github.com/ariyanshiputech/custom_quick_alert/issues/new) with:
   - Flutter version (`flutter --version`)
   - Platform (Android/iOS/Web/Desktop)
   - Error logs
   - Minimal reproduction code

---

**Next:** [Quick Start Tutorial →](quick-start.md)
