# 🚀 Deployment & Production Guide

This guide covers best practices for deploying Custom Quick Alert in production environments across all Flutter platforms.

## 📋 Table of Contents

- [Production Readiness Checklist](#-production-readiness-checklist)
- [Platform-Specific Deployment](#-platform-specific-deployment)
- [Performance Optimization](#-performance-optimization)
- [Security Considerations](#-security-considerations)
- [Monitoring & Analytics](#-monitoring--analytics)
- [Error Handling & Recovery](#-error-handling--recovery)
- [Maintenance & Updates](#-maintenance--updates)

## ✅ Production Readiness Checklist

### Code Quality
- [ ] All alerts have proper error handling
- [ ] Memory leaks are prevented (loading alerts are dismissed)
- [ ] Accessibility requirements are met
- [ ] User experience is consistent across all platforms
- [ ] Performance is optimized for target devices

### Testing
- [ ] Unit tests cover all alert scenarios
- [ ] Widget tests verify UI behavior
- [ ] Integration tests cover user flows
- [ ] Accessibility tests pass
- [ ] Performance tests meet targets

### Configuration
- [ ] Navigator key is properly initialized
- [ ] Alert timeouts are configured appropriately
- [ ] Theme consistency is maintained
- [ ] Platform-specific optimizations are applied

## 📱 Platform-Specific Deployment

### Android Deployment

#### ProGuard Configuration
```gradle
# android/app/proguard-rules.pro
-keep class com.ariyanshipu.custom_quick_alert.** { *; }
-keep class io.flutter.embedding.** { *; }

# Keep Lottie animations
-keep class com.airbnb.lottie.** { *; }
-dontwarn com.airbnb.lottie.**
```

#### Manifest Optimizations
```xml
<!-- android/app/src/main/AndroidManifest.xml -->
<application
    android:name="io.flutter.app.FlutterApplication"
    android:label="Your App"
    android:requestLegacyExternalStorage="false"
    android:hardwareAccelerated="true">
    
    <!-- Optimize for quick alert display -->
    <meta-data
        android:name="io.flutter.embedding.android.EnableImpeller"
        android:value="true" />
</application>
```

#### Build Configuration
```gradle
// android/app/build.gradle
android {
    compileSdkVersion 34

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    buildTypes {
        release {
            // Enable R8 optimization
            minifyEnabled true
            useProguard true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            
            // Optimize for performance
            shrinkResources true
            zipAlignEnabled true
        }
    }
}
```

### iOS Deployment

#### Info.plist Configuration
```xml
<!-- ios/Runner/Info.plist -->
<dict>
    <!-- Optimize rendering for alerts -->
    <key>CADisableMinimumFrameDurationOnPhone</key>
    <true/>
    
    <!-- Accessibility -->
    <key>UIAccessibilityTraits</key>
    <string>UIAccessibilityTraitUpdatesFrequently</string>
    
    <!-- Performance -->
    <key>UIViewControllerBasedStatusBarAppearance</key>
    <false/>
</dict>
```

#### Build Configuration
```ruby
# ios/Podfile
platform :ios, '12.0'

target 'Runner' do
  use_frameworks!
  use_modular_headers!

  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
  
  # Optimize for production
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['ENABLE_BITCODE'] = 'NO'
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-O'
      end
    end
  end
end
```

### Web Deployment

#### Build Optimization
```bash
# Build for web with optimizations
flutter build web --release \
  --web-renderer canvaskit \
  --dart-define=FLUTTER_WEB_USE_SKIA=true \
  --tree-shake-icons
```

#### Web Configuration
```html
<!-- web/index.html -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- Preload critical resources -->
  <link rel="preload" href="main.dart.js" as="script">
  
  <!-- Optimize for alerts -->
  <meta name="theme-color" content="#000000">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
</head>
<body>
  <script>
    window.addEventListener('load', function(ev) {
      // Optimize for Custom Quick Alert
      _flutter.loader.loadEntrypoint({
        serviceWorker: {
          serviceWorkerVersion: serviceWorkerVersion,
        }
      }).then(function(engineInitializer) {
        return engineInitializer.initializeEngine();
      }).then(function(appRunner) {
        return appRunner.runApp();
      });
    });
  </script>
</body>
</html>
```

### Desktop Deployment

#### Windows Configuration
```cmake
# windows/runner/CMakeLists.txt
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Optimize for performance
if(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /O2")
endif()
```

#### macOS Configuration
```xml
<!-- macos/Runner/Info.plist -->
<dict>
    <!-- Optimize for alerts -->
    <key>NSHighResolutionCapable</key>
    <true/>
    
    <!-- Security -->
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <false/>
    </dict>
</dict>
```

## ⚡ Performance Optimization

### Memory Management

```dart
class ProductionAlertManager {
  static final Map<String, Timer> _activeTimers = {};
  static const int maxConcurrentAlerts = 3;
  static int _currentAlertCount = 0;

  // Prevent memory leaks from loading alerts
  static void showLoadingWithTimeout(
    String id, {
    required String title,
    String? message,
    Duration timeout = const Duration(seconds: 30),
  }) {
    // Cancel existing timer if any
    _activeTimers[id]?.cancel();
    
    CustomQuickAlert.loading(title: title, message: message);
    
    // Auto-dismiss after timeout
    _activeTimers[id] = Timer(timeout, () {
      dismissLoading(id);
      
      CustomQuickAlert.error(
        title: 'Request Timeout',
        message: 'The operation took too long. Please try again.',
      );
    });
  }

  static void dismissLoading(String id) {
    _activeTimers[id]?.cancel();
    _activeTimers.remove(id);
    CustomQuickAlert.dismiss();
  }

  // Prevent too many concurrent alerts
  static bool canShowAlert() {
    return _currentAlertCount < maxConcurrentAlerts;
  }

  static void incrementAlertCount() {
    _currentAlertCount++;
  }

  static void decrementAlertCount() {
    _currentAlertCount = math.max(0, _currentAlertCount - 1);
  }

  // Clean up resources
  static void dispose() {
    _activeTimers.values.forEach((timer) => timer.cancel());
    _activeTimers.clear();
    _currentAlertCount = 0;
  }
}
```

### Asset Optimization

```yaml
# pubspec.yaml - Optimize assets for production
flutter:
  assets:
    # Use optimized Lottie files
    - assets/animations/
  
  # Generate different resolutions for icons
  generate: true
```

```dart
// Lazy load animations for better performance
class OptimizedAnimations {
  static const Map<QuickAlertType, String> _animationPaths = {
    QuickAlertType.success: 'assets/animations/success.json',
    QuickAlertType.error: 'assets/animations/error.json',
    QuickAlertType.warning: 'assets/animations/warning.json',
    QuickAlertType.info: 'assets/animations/info.json',
    QuickAlertType.loading: 'assets/animations/loading.json',
  };

  static String? getAnimationPath(QuickAlertType type) {
    return _animationPaths[type];
  }

  // Preload critical animations
  static Future<void> preloadCriticalAnimations() async {
    final criticalTypes = [
      QuickAlertType.success,
      QuickAlertType.error,
      QuickAlertType.loading,
    ];

    for (final type in criticalTypes) {
      final path = getAnimationPath(type);
      if (path != null) {
        await rootBundle.load(path);
      }
    }
  }
}
```

### Build Configuration

```dart
// lib/config/production_config.dart
class ProductionConfig {
  static const bool enableDebugAlerts = false;
  static const Duration defaultTimeout = Duration(seconds: 30);
  static const int maxRetryAttempts = 3;
  static const bool enableAnalytics = true;
  static const bool enableCrashReporting = true;

  // Performance settings
  static const int maxCachedAlerts = 10;
  static const Duration cacheExpiration = Duration(minutes: 5);
  static const bool enableAnimations = true;
  static const bool enableShadows = true;

  // Platform-specific optimizations
  static bool get enableComplexAnimations {
    if (kIsWeb) return false;
    if (Platform.isAndroid) {
      // Check device performance tier
      return _isHighPerformanceDevice();
    }
    return true;
  }

  static bool _isHighPerformanceDevice() {
    // Implement device performance detection
    // This is a simplified example
    return true;
  }
}
```

## 🔒 Security Considerations

### Input Sanitization

```dart
class SecureAlertManager {
  // Sanitize user input to prevent XSS in web builds
  static String sanitizeText(String? input) {
    if (input == null) return '';
    
    return input
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#x27;')
        .replaceAll('&', '&amp;');
  }

  // Secure alert with sanitized content
  static void showSecureAlert({
    required String title,
    required String message,
    QuickAlertType type = QuickAlertType.info,
  }) {
    final sanitizedTitle = sanitizeText(title);
    final sanitizedMessage = sanitizeText(message);

    switch (type) {
      case QuickAlertType.success:
        CustomQuickAlert.success(
          title: sanitizedTitle,
          message: sanitizedMessage,
        );
        break;
      case QuickAlertType.error:
        CustomQuickAlert.error(
          title: sanitizedTitle,
          message: sanitizedMessage,
        );
        break;
      // ... other cases
    }
  }

  // Validate sensitive operations
  static Future<bool> confirmSensitiveOperation({
    required String operation,
    required String userContext,
  }) async {
    // Additional security checks
    if (!_isValidContext(userContext)) {
      CustomQuickAlert.error(
        title: 'Security Error',
        message: 'Invalid operation context.',
      );
      return false;
    }

    final completer = Completer<bool>();

    CustomQuickAlert.confirm(
      title: 'Confirm ${sanitizeText(operation)}',
      message: 'This action requires confirmation for security.',
      confirmText: 'Confirm',
      cancelText: 'Cancel',
      showCancel: true,
      onConfirm: () => completer.complete(true),
      onCancel: () => completer.complete(false),
    );

    return completer.future;
  }

  static bool _isValidContext(String context) {
    // Implement context validation logic
    return context.isNotEmpty && context.length < 1000;
  }
}
```

### Environment Configuration

```dart
// lib/config/environment.dart
enum Environment { development, staging, production }

class EnvironmentConfig {
  static const Environment _environment = Environment.production;

  static bool get isProduction => _environment == Environment.production;
  static bool get isDevelopment => _environment == Environment.development;
  static bool get isStaging => _environment == Environment.staging;

  // Security settings based on environment
  static bool get enableDebugLogs => !isProduction;
  static bool get enableVerboseErrors => isDevelopment;
  static bool get enableAnalytics => isProduction || isStaging;

  // Alert configuration
  static Duration get alertTimeout {
    switch (_environment) {
      case Environment.development:
        return Duration(seconds: 60);
      case Environment.staging:
        return Duration(seconds: 45);
      case Environment.production:
        return Duration(seconds: 30);
    }
  }
}
```

## 📊 Monitoring & Analytics

### Error Tracking

```dart
class AlertAnalytics {
  static void trackAlertShown(QuickAlertType type, String context) {
    if (!ProductionConfig.enableAnalytics) return;

    // Track with your analytics service
    FirebaseAnalytics.instance.logEvent(
      name: 'alert_shown',
      parameters: {
        'alert_type': type.toString(),
        'context': context,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  static void trackAlertDismissed(QuickAlertType type, String action) {
    if (!ProductionConfig.enableAnalytics) return;

    FirebaseAnalytics.instance.logEvent(
      name: 'alert_dismissed',
      parameters: {
        'alert_type': type.toString(),
        'action': action, // 'confirm', 'cancel', 'auto_dismiss'
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  static void trackAlertError(String error, Map<String, dynamic> context) {
    if (!ProductionConfig.enableCrashReporting) return;

    FirebaseCrashlytics.instance.recordError(
      error,
      null,
      fatal: false,
      information: [
        DiagnosticsNode.message('Alert Error'),
        ...context.entries.map((e) => 
          DiagnosticsProperty(e.key, e.value)),
      ],
    );
  }
}
```

### Performance Monitoring

```dart
class AlertPerformanceMonitor {
  static final Map<String, Stopwatch> _timers = {};

  static void startTimer(String operation) {
    _timers[operation] = Stopwatch()..start();
  }

  static void endTimer(String operation) {
    final timer = _timers.remove(operation);
    if (timer != null) {
      timer.stop();
      
      // Log performance metric
      FirebasePerformance.instance
          .newTrace('alert_$operation')
          .start()
          .then((trace) {
        trace.setMetric('duration_ms', timer.elapsedMilliseconds);
        trace.stop();
      });

      // Alert if performance is poor
      if (timer.elapsedMilliseconds > 1000) {
        AlertAnalytics.trackAlertError(
          'Slow alert performance: $operation took ${timer.elapsedMilliseconds}ms',
          {'operation': operation, 'duration': timer.elapsedMilliseconds},
        );
      }
    }
  }

  static void measureAlertDisplay(VoidCallback alertCall) {
    startTimer('alert_display');
    alertCall();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      endTimer('alert_display');
    });
  }
}
```

## 🔄 Error Handling & Recovery

### Graceful Error Handling

```dart
class RobustAlertManager {
  static void safeShowAlert({
    required VoidCallback alertCall,
    VoidCallback? onError,
    String? context,
  }) {
    try {
      alertCall();
    } catch (error, stackTrace) {
      // Log error
      AlertAnalytics.trackAlertError(
        error.toString(),
        {
          'context': context ?? 'unknown',
          'stackTrace': stackTrace.toString(),
        },
      );

      // Show fallback alert
      _showFallbackAlert(error.toString());
      
      // Execute error callback
      onError?.call();
    }
  }

  static void _showFallbackAlert(String error) {
    try {
      // Minimal fallback alert
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: Text('Alert Error'),
          content: Text('An error occurred displaying the alert.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } catch (fallbackError) {
      // Last resort: print to console
      print('Critical alert system failure: $fallbackError');
    }
  }

  // Retry mechanism for failed operations
  static Future<void> showAlertWithRetry({
    required Future<void> Function() operation,
    int maxRetries = 3,
    Duration delay = const Duration(seconds: 1),
  }) async {
    int attempts = 0;
    
    while (attempts < maxRetries) {
      try {
        await operation();
        return;
      } catch (error) {
        attempts++;
        
        if (attempts >= maxRetries) {
          CustomQuickAlert.error(
            title: 'Operation Failed',
            message: 'Unable to complete the operation after $maxRetries attempts.',
          );
          rethrow;
        }
        
        // Show retry alert
        CustomQuickAlert.warning(
          title: 'Retry Attempt $attempts',
          message: 'Retrying operation...',
          autoCloseDuration: delay,
          showConfirm: false,
        );
        
        await Future.delayed(delay);
      }
    }
  }
}
```

### Circuit Breaker Pattern

```dart
class AlertCircuitBreaker {
  static int _failureCount = 0;
  static DateTime? _lastFailureTime;
  static const int failureThreshold = 5;
  static const Duration recoveryTime = Duration(minutes: 5);

  static bool get isCircuitOpen {
    if (_failureCount < failureThreshold) return false;
    
    if (_lastFailureTime != null) {
      final timeSinceLastFailure = DateTime.now().difference(_lastFailureTime!);
      if (timeSinceLastFailure > recoveryTime) {
        // Reset circuit breaker
        _failureCount = 0;
        _lastFailureTime = null;
        return false;
      }
    }
    
    return true;
  }

  static void recordFailure() {
    _failureCount++;
    _lastFailureTime = DateTime.now();
  }

  static void recordSuccess() {
    _failureCount = 0;
    _lastFailureTime = null;
  }

  static void showAlertWithCircuitBreaker(VoidCallback alertCall) {
    if (isCircuitOpen) {
      // Show simple fallback
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(content: Text('Alert system temporarily unavailable')),
      );
      return;
    }

    try {
      alertCall();
      recordSuccess();
    } catch (error) {
      recordFailure();
      rethrow;
    }
  }
}
```

## 🔧 Maintenance & Updates

### Version Management

```dart
class AlertVersionManager {
  static const String currentVersion = '2.1.1';
  static const int minSupportedVersion = 200; // 2.0.0

  static bool isVersionSupported(String version) {
    final versionCode = _parseVersion(version);
    return versionCode >= minSupportedVersion;
  }

  static int _parseVersion(String version) {
    final parts = version.split('.');
    if (parts.length != 3) return 0;
    
    try {
      final major = int.parse(parts[0]);
      final minor = int.parse(parts[1]);
      final patch = int.parse(parts[2]);
      
      return major * 10000 + minor * 100 + patch;
    } catch (e) {
      return 0;
    }
  }

  static void checkVersionCompatibility() {
    // This could check against a remote service
    if (!isVersionSupported(currentVersion)) {
      CustomQuickAlert.warning(
        title: 'Update Required',
        message: 'Please update the app to continue using all features.',
      );
    }
  }
}
```

### Health Checks

```dart
class AlertHealthCheck {
  static Future<bool> performHealthCheck() async {
    try {
      // Test basic alert functionality
      final completer = Completer<bool>();
      
      CustomQuickAlert.success(
        title: 'Health Check',
        message: 'Testing alert system...',
        autoCloseDuration: Duration(milliseconds: 100),
        showConfirm: false,
      );
      
      Timer(Duration(milliseconds: 200), () {
        completer.complete(true);
      });
      
      return await completer.future.timeout(Duration(seconds: 5));
    } catch (e) {
      return false;
    }
  }

  static Future<void> runScheduledHealthCheck() async {
    final isHealthy = await performHealthCheck();
    
    if (!isHealthy) {
      AlertAnalytics.trackAlertError(
        'Alert system health check failed',
        {'timestamp': DateTime.now().toIso8601String()},
      );
    }
  }
}
```

### Production Monitoring Dashboard

```dart
class ProductionMonitoring {
  static Map<String, dynamic> getMetrics() {
    return {
      'version': AlertVersionManager.currentVersion,
      'circuit_breaker_status': AlertCircuitBreaker.isCircuitOpen ? 'open' : 'closed',
      'failure_count': AlertCircuitBreaker._failureCount,
      'active_alerts': ProductionAlertManager._currentAlertCount,
      'last_health_check': DateTime.now().toIso8601String(),
    };
  }

  static void reportMetrics() {
    if (!ProductionConfig.enableAnalytics) return;

    final metrics = getMetrics();
    
    FirebaseAnalytics.instance.logEvent(
      name: 'alert_system_metrics',
      parameters: metrics,
    );
  }

  // Schedule periodic monitoring
  static void startMonitoring() {
    Timer.periodic(Duration(minutes: 5), (_) {
      AlertHealthCheck.runScheduledHealthCheck();
      reportMetrics();
    });
  }
}
```

### Deployment Checklist

#### Pre-Deployment
- [ ] All tests pass (unit, widget, integration)
- [ ] Performance benchmarks meet targets
- [ ] Accessibility audit completed
- [ ] Security review completed
- [ ] Error handling tested
- [ ] Memory leak tests pass

#### Deployment
- [ ] Feature flags configured
- [ ] Monitoring enabled
- [ ] Analytics configured
- [ ] Crash reporting active
- [ ] Circuit breakers configured
- [ ] Health checks enabled

#### Post-Deployment
- [ ] Monitor error rates
- [ ] Check performance metrics
- [ ] Verify user feedback
- [ ] Monitor crash reports
- [ ] Review analytics data
- [ ] Plan iterative improvements

---

This comprehensive deployment guide ensures Custom Quick Alert performs optimally in production environments while maintaining security, reliability, and excellent user experience across all platforms.
