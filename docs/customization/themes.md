# 🎨 Theme System Guide

Create consistent, beautiful alert designs with Custom Quick Alert's comprehensive theming system. Build your brand identity into every alert with professional styling options.

## 🎯 Theme System Overview

The theme system provides centralized styling control for consistent alert appearance across your entire application. Define your brand colors, typography, and styling once and apply them everywhere.

## 🏗️ CustomQuickAlertTheme Class

### Basic Theme Structure

```dart
class CustomQuickAlertTheme {
  // Color Properties
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? messageColor;
  final Color? confirmBtnColor;
  final Color? cancelBtnColor;
  final Color? confirmTextColor;
  final Color? cancelTextColor;
  
  // Layout Properties
  final double? borderRadius;
  final double? width;
  final EdgeInsets? padding;
  final List<BoxShadow>? shadows;
  
  // Button Properties
  final bool useGradientButtons;
  final double? buttonHeight;
  final double? buttonBorderRadius;
  
  // Animation Properties
  final CustomQuickAlertAnimationType? defaultAnimation;
  final CustomQuickAlertPosition? defaultPosition;
  final Duration? animationDuration;
}
```

### Creating Custom Themes

```dart
// Corporate Brand Theme
final corporateTheme = CustomQuickAlertTheme(
  backgroundColor: Color(0xFFF8F9FA),
  titleColor: Color(0xFF1A202C),
  messageColor: Color(0xFF4A5568),
  confirmBtnColor: Color(0xFF3182CE),
  cancelBtnColor: Color(0xFF718096),
  borderRadius: 12.0,
  useGradientButtons: true,
  defaultAnimation: CustomQuickAlertAnimationType.scale,
);

// Dark Theme
final darkTheme = CustomQuickAlertTheme(
  backgroundColor: Color(0xFF2D3748),
  titleColor: Color(0xFFE2E8F0),
  messageColor: Color(0xFFCBD5E0),
  confirmBtnColor: Color(0xFF4299E1),
  cancelBtnColor: Color(0xFF718096),
  confirmTextColor: Colors.white,
  cancelTextColor: Colors.white,
  borderRadius: 16.0,
  shadows: [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 20,
      offset: Offset(0, 10),
    ),
  ],
);

// Minimal Theme
final minimalTheme = CustomQuickAlertTheme(
  backgroundColor: Colors.white,
  titleColor: Color(0xFF2D3748),
  messageColor: Color(0xFF4A5568),
  confirmBtnColor: Color(0xFF38A169),
  borderRadius: 8.0,
  useGradientButtons: false,
  padding: EdgeInsets.all(20),
  defaultAnimation: CustomQuickAlertAnimationType.fade,
);
```

---

## 🎨 Predefined Themes

### Material Theme

```dart
final materialTheme = CustomQuickAlertTheme(
  backgroundColor: Colors.white,
  titleColor: Color(0xFF1976D2),
  messageColor: Color(0xFF424242),
  confirmBtnColor: Color(0xFF1976D2),
  cancelBtnColor: Color(0xFF757575),
  borderRadius: 8.0,
  useGradientButtons: false,
  shadows: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ],
);

// Usage
CustomQuickAlert.success(
  title: 'Success!',
  message: 'Operation completed',
  theme: materialTheme,
);
```

### Cupertino Theme

```dart
final cupertinoTheme = CustomQuickAlertTheme(
  backgroundColor: Color(0xFFF9F9F9),
  titleColor: Color(0xFF000000),
  messageColor: Color(0xFF8E8E93),
  confirmBtnColor: Color(0xFF007AFF),
  cancelBtnColor: Color(0xFF8E8E93),
  borderRadius: 14.0,
  useGradientButtons: false,
  padding: EdgeInsets.all(20),
  buttonHeight: 44.0,
  buttonBorderRadius: 8.0,
);
```

### Glassmorphism Theme

```dart
final glassmorphismTheme = CustomQuickAlertTheme(
  backgroundColor: Colors.white.withOpacity(0.1),
  titleColor: Colors.white,
  messageColor: Colors.white.withOpacity(0.8),
  confirmBtnColor: Colors.white.withOpacity(0.2),
  cancelBtnColor: Colors.white.withOpacity(0.1),
  confirmTextColor: Colors.white,
  cancelTextColor: Colors.white,
  borderRadius: 20.0,
  useGradientButtons: false,
  shadows: [
    BoxShadow(
      color: Colors.white.withOpacity(0.1),
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ],
);
```

### Neon Theme

```dart
final neonTheme = CustomQuickAlertTheme(
  backgroundColor: Color(0xFF0D1117),
  titleColor: Color(0xFF00D4FF),
  messageColor: Color(0xFFE6EDF3),
  confirmBtnColor: Color(0xFF00D4FF),
  cancelBtnColor: Color(0xFF6E7681),
  borderRadius: 12.0,
  useGradientButtons: true,
  shadows: [
    BoxShadow(
      color: Color(0xFF00D4FF).withOpacity(0.3),
      blurRadius: 20,
      offset: Offset(0, 0),
    ),
  ],
);
```

---

## 🎭 Type-Specific Themes

### Success Theme

```dart
final successTheme = CustomQuickAlertTheme(
  backgroundColor: Color(0xFFF0FDF4),
  titleColor: Color(0xFF166534),
  messageColor: Color(0xFF15803D),
  confirmBtnColor: Color(0xFF22C55E),
  confirmTextColor: Colors.white,
  borderRadius: 12.0,
  useGradientButtons: true,
);

CustomQuickAlert.success(
  title: 'Success!',
  message: 'Operation completed successfully',
  theme: successTheme,
);
```

### Error Theme

```dart
final errorTheme = CustomQuickAlertTheme(
  backgroundColor: Color(0xFFFEF2F2),
  titleColor: Color(0xFF991B1B),
  messageColor: Color(0xFFDC2626),
  confirmBtnColor: Color(0xFFEF4444),
  confirmTextColor: Colors.white,
  borderRadius: 12.0,
  shadows: [
    BoxShadow(
      color: Color(0xFFEF4444).withOpacity(0.2),
      blurRadius: 15,
      offset: Offset(0, 5),
    ),
  ],
);

CustomQuickAlert.error(
  title: 'Error!',
  message: 'Something went wrong',
  theme: errorTheme,
);
```

### Warning Theme

```dart
final warningTheme = CustomQuickAlertTheme(
  backgroundColor: Color(0xFFFFFBEB),
  titleColor: Color(0xFF92400E),
  messageColor: Color(0xFFD97706),
  confirmBtnColor: Color(0xFFF59E0B),
  confirmTextColor: Colors.white,
  borderRadius: 12.0,
);
```

---

## 🌓 Adaptive Themes

### Light/Dark Mode Support

```dart
class ThemeManager {
  static CustomQuickAlertTheme getTheme(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkTheme : lightTheme;
  }
  
  static final lightTheme = CustomQuickAlertTheme(
    backgroundColor: Colors.white,
    titleColor: Color(0xFF1A202C),
    messageColor: Color(0xFF4A5568),
    confirmBtnColor: Color(0xFF3182CE),
    shadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  );
  
  static final darkTheme = CustomQuickAlertTheme(
    backgroundColor: Color(0xFF2D3748),
    titleColor: Color(0xFFE2E8F0),
    messageColor: Color(0xFFCBD5E0),
    confirmBtnColor: Color(0xFF4299E1),
    shadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 15,
        offset: Offset(0, 8),
      ),
    ],
  );
}

// Usage
CustomQuickAlert.success(
  title: 'Success!',
  message: 'Theme adapts automatically',
  theme: ThemeManager.getTheme(context),
);
```

### Platform-Adaptive Themes

```dart
class PlatformThemes {
  static CustomQuickAlertTheme get current {
    if (Platform.isIOS) {
      return cupertinoTheme;
    } else if (Platform.isAndroid) {
      return materialTheme;
    } else {
      return desktopTheme;
    }
  }
  
  static final cupertinoTheme = CustomQuickAlertTheme(
    backgroundColor: Color(0xFFF9F9F9),
    borderRadius: 14.0,
    buttonHeight: 44.0,
  );
  
  static final materialTheme = CustomQuickAlertTheme(
    backgroundColor: Colors.white,
    borderRadius: 8.0,
    buttonHeight: 48.0,
  );
  
  static final desktopTheme = CustomQuickAlertTheme(
    backgroundColor: Colors.white,
    borderRadius: 6.0,
    width: 400.0,
    buttonHeight: 40.0,
  );
}
```

---

## 🎨 Brand Theme Examples

### Modern SaaS Theme

```dart
final saasTheme = CustomQuickAlertTheme(
  backgroundColor: Color(0xFFFAFAFA),
  titleColor: Color(0xFF0F172A),
  messageColor: Color(0xFF475569),
  confirmBtnColor: Color(0xFF6366F1),
  cancelBtnColor: Color(0xFF94A3B8),
  borderRadius: 16.0,
  useGradientButtons: true,
  padding: EdgeInsets.all(28),
  shadows: [
    BoxShadow(
      color: Color(0xFF6366F1).withOpacity(0.1),
      blurRadius: 20,
      offset: Offset(0, 10),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 40,
      offset: Offset(0, 20),
    ),
  ],
);
```

### E-commerce Theme

```dart
final ecommerceTheme = CustomQuickAlertTheme(
  backgroundColor: Colors.white,
  titleColor: Color(0xFF1F2937),
  messageColor: Color(0xFF6B7280),
  confirmBtnColor: Color(0xFF059669),
  cancelBtnColor: Color(0xFFEF4444),
  borderRadius: 12.0,
  useGradientButtons: true,
  buttonHeight: 50.0,
  shadows: [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 15,
      offset: Offset(0, 8),
    ),
  ],
);
```

### Gaming Theme

```dart
final gamingTheme = CustomQuickAlertTheme(
  backgroundColor: Color(0xFF1A1A2E),
  titleColor: Color(0xFF00D4FF),
  messageColor: Color(0xFFE94560),
  confirmBtnColor: Color(0xFF00D4FF),
  cancelBtnColor: Color(0xFFE94560),
  confirmTextColor: Color(0xFF1A1A2E),
  cancelTextColor: Colors.white,
  borderRadius: 20.0,
  useGradientButtons: true,
  shadows: [
    BoxShadow(
      color: Color(0xFF00D4FF).withOpacity(0.3),
      blurRadius: 25,
      offset: Offset(0, 0),
    ),
    BoxShadow(
      color: Color(0xFFE94560).withOpacity(0.2),
      blurRadius: 15,
      offset: Offset(0, 10),
    ),
  ],
);
```

---

## 🛠️ Advanced Theme Techniques

### Theme Inheritance

```dart
class BaseTheme {
  static final base = CustomQuickAlertTheme(
    borderRadius: 12.0,
    useGradientButtons: true,
    padding: EdgeInsets.all(24),
    defaultAnimation: CustomQuickAlertAnimationType.scale,
  );
  
  static CustomQuickAlertTheme success() => base.copyWith(
    backgroundColor: Color(0xFFF0FDF4),
    titleColor: Color(0xFF166534),
    confirmBtnColor: Color(0xFF22C55E),
  );
  
  static CustomQuickAlertTheme error() => base.copyWith(
    backgroundColor: Color(0xFFFEF2F2),
    titleColor: Color(0xFF991B1B),
    confirmBtnColor: Color(0xFFEF4444),
  );
}
```

### Dynamic Theme Generation

```dart
class ThemeGenerator {
  static CustomQuickAlertTheme fromPrimaryColor(Color primary) {
    return CustomQuickAlertTheme(
      backgroundColor: Colors.white,
      titleColor: primary.withOpacity(0.9),
      messageColor: primary.withOpacity(0.7),
      confirmBtnColor: primary,
      confirmTextColor: Colors.white,
      borderRadius: 12.0,
      shadows: [
        BoxShadow(
          color: primary.withOpacity(0.2),
          blurRadius: 15,
          offset: Offset(0, 8),
        ),
      ],
    );
  }
  
  static CustomQuickAlertTheme fromBrandColors({
    required Color primary,
    required Color secondary,
    required Color background,
  }) {
    return CustomQuickAlertTheme(
      backgroundColor: background,
      titleColor: primary,
      messageColor: primary.withOpacity(0.8),
      confirmBtnColor: primary,
      cancelBtnColor: secondary,
      borderRadius: 14.0,
      useGradientButtons: true,
    );
  }
}

// Usage
final myTheme = ThemeGenerator.fromPrimaryColor(Color(0xFF6366F1));
```

### Theme Validation

```dart
class ThemeValidator {
  static bool isAccessible(CustomQuickAlertTheme theme) {
    // Check contrast ratios
    final titleContrast = calculateContrast(
      theme.titleColor ?? Colors.black,
      theme.backgroundColor ?? Colors.white,
    );
    
    final messageContrast = calculateContrast(
      theme.messageColor ?? Colors.grey,
      theme.backgroundColor ?? Colors.white,
    );
    
    return titleContrast >= 4.5 && messageContrast >= 3.0;
  }
  
  static double calculateContrast(Color foreground, Color background) {
    // Implement WCAG contrast calculation
    // Simplified version - implement full WCAG formula
    final fLum = foreground.computeLuminance();
    final bLum = background.computeLuminance();
    
    final lighter = math.max(fLum, bLum);
    final darker = math.min(fLum, bLum);
    
    return (lighter + 0.05) / (darker + 0.05);
  }
}
```

---

## 📱 Responsive Theme Adjustments

### Screen Size Based Themes

```dart
class ResponsiveTheme {
  static CustomQuickAlertTheme forScreenSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    if (screenWidth < 600) {
      // Mobile
      return mobileTheme;
    } else if (screenWidth < 1200) {
      // Tablet
      return tabletTheme;
    } else {
      // Desktop
      return desktopTheme;
    }
  }
  
  static final mobileTheme = CustomQuickAlertTheme(
    width: null, // Use screen width minus margins
    padding: EdgeInsets.all(20),
    borderRadius: 16.0,
    buttonHeight: 48.0,
  );
  
  static final tabletTheme = CustomQuickAlertTheme(
    width: 400.0,
    padding: EdgeInsets.all(24),
    borderRadius: 12.0,
    buttonHeight: 44.0,
  );
  
  static final desktopTheme = CustomQuickAlertTheme(
    width: 420.0,
    padding: EdgeInsets.all(28),
    borderRadius: 8.0,
    buttonHeight: 40.0,
  );
}
```

---

## 🎨 Theme Application Patterns

### Global Theme Provider

```dart
class AlertThemeProvider extends ChangeNotifier {
  CustomQuickAlertTheme _currentTheme = defaultTheme;
  
  CustomQuickAlertTheme get currentTheme => _currentTheme;
  
  void setTheme(CustomQuickAlertTheme theme) {
    _currentTheme = theme;
    notifyListeners();
  }
  
  void toggleDarkMode() {
    _currentTheme = _currentTheme == lightTheme ? darkTheme : lightTheme;
    notifyListeners();
  }
}

// Usage with Provider
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AlertThemeProvider(),
      child: Consumer<AlertThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            home: MyHomePage(theme: themeProvider.currentTheme),
          );
        },
      ),
    );
  }
}
```

### Context-Aware Theming

```dart
void showThemedAlert(BuildContext context, String message) {
  final theme = Theme.of(context);
  final customTheme = CustomQuickAlertTheme(
    backgroundColor: theme.cardColor,
    titleColor: theme.textTheme.headlineSmall?.color,
    messageColor: theme.textTheme.bodyMedium?.color,
    confirmBtnColor: theme.primaryColor,
    borderRadius: theme.cardTheme.shape is RoundedRectangleBorder 
      ? (theme.cardTheme.shape as RoundedRectangleBorder).borderRadius.topLeft.x
      : 8.0,
  );
  
  CustomQuickAlert.info(
    title: 'Themed Alert',
    message: message,
    theme: customTheme,
  );
}
```

---

## 🔗 Related Documentation

- [Styling Guide](styling.md)
- [Color Customization](colors.md)
- [Typography Guide](typography.md)
- [Accessibility Guidelines](../advanced/accessibility.md)
