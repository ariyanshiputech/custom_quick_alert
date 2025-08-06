# 🔧 Troubleshooting - Common Issues

This guide helps you resolve the most frequently encountered issues when using Custom Quick Alert.

## 🐛 Installation Issues

### Issue: Alert not showing
**Error:**
```
CustomQuickAlert methods not working or alerts not appearing
```

**Solutions:**
1. **Check Navigator Key Setup**
   ```dart
   // Ensure you have set up the navigator key
   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
   
   void main() {
     runApp(const MyApp());
     CustomQuickAlert.initialize(navigatorKey); // Important!
   }
   
   class MyApp extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         navigatorKey: navigatorKey, // Must be assigned
         home: HomePage(),
       );
     }
   }
   ```

2. **Verify Package Import**
   ```dart
   import 'package:custom_quick_alert/custom_quick_alert.dart';
   ```

3. **Check Flutter Version**
   ```bash
   flutter --version
   # Ensure Flutter >=3.0.0
   ```

---

## 🎨 Animation Issues

### Animations Not Loading
**Error:**
```
Unable to load asset: packages/custom_quick_alert/assets/animations/success.json
```

**Solutions:**
1. **Flutter Clean and Rebuild**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

2. **Check Flutter Version Compatibility**
   ```bash
   flutter doctor
   # Ensure no issues reported
   ```

3. **Manual Asset Verification**
   ```dart
   // Test with a simple alert first
   CustomQuickAlert.show(
     context: context,
     type: QuickAlertType.success,
     title: 'Test',
     text: 'Testing animations',
   );
   ```

### Custom Animations Not Working
**Problem:** Custom Lottie files not displaying

**Solutions:**
1. **Verify File Path**
   ```dart
   // Ensure your custom animation exists
   CustomQuickAlert.show(
     context: context,
     type: QuickAlertType.custom,
     customAsset: 'assets/animations/my_custom.json', // Check this path
   );
   ```

2. **Add to pubspec.yaml**
   ```yaml
   flutter:
     assets:
       - assets/animations/
       - assets/animations/my_custom.json
   ```

3. **Validate JSON Format**
   - Use Lottie preview tools
   - Check file size (keep under 1MB for performance)
   - Ensure JSON is valid

---

## 🖥️ Context Issues

### Context Errors
**Error:**
```
BuildContext not found or widget is not mounted
```

**Solutions:**
1. **Check Widget Mount State**
   ```dart
   void showAlert() {
     if (!mounted) return; // For StatefulWidget
     
     CustomQuickAlert.show(
       context: context,
       type: QuickAlertType.success,
       title: 'Success',
     );
   }
   ```

2. **Use GlobalKey for Context**
   ```dart
   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
   
   // In MaterialApp
   MaterialApp(
     navigatorKey: navigatorKey,
     // ...
   );
   
   // When showing alert
   CustomQuickAlert.show(
     context: navigatorKey.currentContext!,
     type: QuickAlertType.success,
     title: 'Success',
   );
   ```

3. **Use Builder Widget**
   ```dart
   Scaffold(
     body: Builder(
       builder: (BuildContext context) {
         return ElevatedButton(
           onPressed: () => _showAlert(context),
           child: Text('Show Alert'),
         );
       },
     ),
   );
   ```

### Navigator Issues
**Error:**
```
Navigator operation requested with a context that does not include a Navigator
```

**Solutions:**
1. **Wrap with MaterialApp**
   ```dart
   void main() {
     runApp(
       MaterialApp(
         home: YourHomePage(),
       ),
     );
   }
   ```

2. **Use Correct Context**
   ```dart
   class MyWidget extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('My App')),
         body: Builder( // Important: Use Builder
           builder: (BuildContext scaffoldContext) {
             return ElevatedButton(
               onPressed: () => _showAlert(scaffoldContext),
               child: Text('Show Alert'),
             );
           },
         ),
       );
     }
   }
   ```

---

## 📱 Platform-Specific Issues

### Android Issues

**APK Build Errors**
```
Exception: Gradle task assembleDebug failed with exit code 1
```

**Solutions:**
1. **Update Android SDK**
   ```bash
   flutter doctor --android-licenses
   ```

2. **Check build.gradle Settings**
   ```gradle
   // android/app/build.gradle
   android {
       compileSdkVersion 34
       defaultConfig {
           minSdkVersion 21
           targetSdkVersion 34
       }
   }
   ```

3. **Clean Android Build**
   ```bash
   cd android
   ./gradlew clean
   cd ..
   flutter clean
   flutter pub get
   ```

**ProGuard Issues**
```
R8: Missing class androidx.lifecycle.DefaultLifecycleObserver
```

**Solutions:**
1. **Add ProGuard Rules**
   ```
   # android/app/proguard-rules.pro
   -keep class androidx.lifecycle.** { *; }
   -keep class com.** { *; }
   ```

2. **Disable R8 (Temporary)**
   ```gradle
   // android/gradle.properties
   android.enableR8=false
   ```

### iOS Issues

**CocoaPods Errors**
```
[!] Unable to find a specification for 'custom_quick_alert'
```

**Solutions:**
1. **Update CocoaPods**
   ```bash
   cd ios
   pod repo update
   pod install
   cd ..
   ```

2. **Clean iOS Build**
   ```bash
   cd ios
   rm -rf Pods Podfile.lock
   pod install
   cd ..
   flutter clean
   ```

3. **Check iOS Deployment Target**
   ```ruby
   # ios/Podfile
   platform :ios, '11.0'
   ```

**Signing Issues**
```
No signing certificate "iOS Development" found
```

**Solutions:**
1. **Use Automatic Signing**
   - Open `ios/Runner.xcworkspace` in Xcode
   - Select "Automatically manage signing"

2. **Set Development Team**
   - Add your Apple Developer Team ID in Xcode

### Web Issues

**CORS Errors in Debug**
```
Access to XMLHttpRequest blocked by CORS policy
```

**Solutions:**
1. **Use HTML Renderer**
   ```bash
   flutter run -d chrome --web-renderer html
   ```

2. **Disable CORS for Development**
   ```bash
   flutter run -d chrome --web-browser-flag "--disable-web-security"
   ```

3. **Check Asset Loading**
   ```dart
   // Ensure assets are properly configured for web
   flutter:
     assets:
       - assets/animations/
   ```

---

## 🎯 Performance Issues

### Slow Animation Performance
**Problem:** Animations are laggy or stuttering

**Solutions:**
1. **Optimize Lottie Files**
   - Reduce file size (aim for <500KB)
   - Lower frame rate if possible
   - Simplify complex animations

2. **Use Cache Manager**
   ```dart
   // Pre-load animations
   void preloadAnimations() {
     precacheImage(
       AssetImage('packages/custom_quick_alert/assets/animations/success.json'),
       context,
     );
   }
   ```

3. **Disable Debug Mode Checks**
   ```dart
   // Only for production
   CustomQuickAlert.show(
     context: context,
     type: QuickAlertType.success,
     // Reduce animation duration for performance
     animationDuration: Duration(milliseconds: 200),
   );
   ```

### Memory Leaks
**Problem:** Memory usage increases over time

**Solutions:**
1. **Proper Alert Dismissal**
   ```dart
   // Always ensure alerts are properly dismissed
   Timer? _alertTimer;
   
   void showTimedAlert() {
     CustomQuickAlert.show(
       context: context,
       type: QuickAlertType.loading,
       title: 'Loading...',
     );
     
     _alertTimer = Timer(Duration(seconds: 5), () {
       if (mounted) {
         Navigator.of(context).pop();
       }
     });
   }
   
   @override
   void dispose() {
     _alertTimer?.cancel();
     super.dispose();
   }
   ```

2. **Avoid Nested Alerts**
   ```dart
   // ❌ Avoid
   void showNestedAlerts() {
     CustomQuickAlert.show(/*...*/);
     CustomQuickAlert.show(/*...*/); // Creates overlay issues
   }
   
   // ✅ Better
   void showSequentialAlerts() {
     CustomQuickAlert.show(
       /*...*/
       onConfirmBtnTap: () {
         Navigator.of(context).pop();
         // Show next alert after closing first
         Future.delayed(Duration(milliseconds: 100), () {
           CustomQuickAlert.show(/*...*/);
         });
       },
     );
   }
   ```

---

## 🔍 Debugging Tips

### Enable Debug Logging
```dart
import 'package:flutter/foundation.dart';

void showDebugAlert(BuildContext context) {
  if (kDebugMode) {
    print('Showing alert with context: $context');
  }
  
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    title: 'Debug Alert',
    onConfirmBtnTap: () {
      if (kDebugMode) {
        print('Alert confirmed');
      }
      Navigator.of(context).pop();
    },
  );
}
```

### Widget Inspector
Use Flutter's widget inspector to debug layout issues:
```bash
flutter inspector
```

### Performance Profiling
```bash
flutter run --profile
# Then use DevTools for performance analysis
```

---

## 📞 Getting Help

### Before Reporting Issues
1. **Search Existing Issues**: Check [GitHub Issues](https://github.com/ariyanshiputech/custom_quick_alert/issues)
2. **Try Latest Version**: Update to the newest package version
3. **Minimal Reproduction**: Create a simple test case
4. **Gather Information**:
   - Flutter version (`flutter --version`)
   - Platform (Android/iOS/Web/Desktop)
   - Device/simulator information
   - Full error logs

### Creating Bug Reports
Include this information:
```
**Flutter Version:**
flutter --version output

**Platform:**
[ ] Android
[ ] iOS  
[ ] Web
[ ] Desktop

**Package Version:**
custom_quick_alert: ^2.0.3

**Expected Behavior:**
Describe what should happen

**Actual Behavior:**
Describe what actually happens

**Code Sample:**
```dart
// Minimal code that reproduces the issue
```

**Error Logs:**
```
Full error message and stack trace
```

**Additional Context:**
Any other relevant information
```

### Community Support
- [GitHub Discussions](https://github.com/ariyanshiputech/custom_quick_alert/discussions)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter) (use `custom-quick-alert` tag)
- [Flutter Community](https://flutter.dev/community)

---

**Next:** [Platform-Specific Issues →](platform-issues.md)
