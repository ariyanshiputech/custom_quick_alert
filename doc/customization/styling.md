# 🎨 Styling Guide

Learn how to customize the appearance of your alerts to match your app's design language and branding.

## 🎯 Overview

Custom Quick Alert provides extensive styling options to make alerts feel native to your app. You can customize colors, typography, spacing, and visual elements.

## 🌈 Color Customization

### Background Colors
```dart
CustomQuickAlert.success(
  title: 'Custom Background',
  message: 'This alert has a custom background color.',
  backgroundColor: Colors.green.shade50, // Light green background
);
```

### Text Colors
```dart
CustomQuickAlert.info(
  title: 'Custom Text Colors',
  message: 'Title and text have custom colors.',
  titleColor: Colors.indigo.shade800,    // Dark blue title
  messageColor: Colors.indigo.shade600,  // Medium blue message
);
```

### Button Colors
```dart
CustomQuickAlert.confirm(
  title: 'Custom Button Colors',
  message: 'Buttons have custom colors.',
  confirmBtnColor: Colors.purple,        // Purple confirm button
  cancelBtnColor: Colors.grey,           // Grey cancel button
  confirmTextColor: Colors.white,        // White confirm text
  cancelTextColor: Colors.black87,       // Dark cancel text
);
```

## 🔤 Typography

### Title Styling
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.success,
  title: 'Custom Typography',
  text: 'This alert uses custom fonts and sizes.',
  titleTextStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.green.shade800,
    fontFamily: 'CustomFont',
    letterSpacing: 1.2,
  ),
);
```

### Body Text Styling
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.info,
  title: 'Body Text Styling',
  text: 'The body text can be customized too.',
  textTextStyle: TextStyle(
    fontSize: 16,
    color: Colors.grey.shade700,
    fontFamily: 'Roboto',
    height: 1.5, // Line height
  ),
);
```

### Button Text Styling
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.confirm,
  title: 'Button Text Styling',
  text: 'Buttons can have custom text styles.',
  confirmBtnText: 'CONFIRM',
  cancelBtnText: 'cancel',
  confirmBtnTextStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    color: Colors.white,
  ),
  cancelBtnTextStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey.shade600,
  ),
);
```

## 📏 Sizing and Spacing

### Dialog Width
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.info,
  title: 'Custom Width',
  text: 'This dialog has a custom width.',
  width: 350.0, // Custom width in pixels
);
```

### Custom Padding
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.success,
  title: 'Custom Spacing',
  text: 'This alert has custom internal spacing.',
  // Use a custom widget for complete control
  widget: Padding(
    padding: EdgeInsets.all(24.0),
    child: Column(
      children: [
        Text('Custom Content Area'),
        SizedBox(height: 16),
        Text('With custom spacing'),
      ],
    ),
  ),
);
```

## 🎭 Theme Integration

### Using App Theme Colors
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.info,
  title: 'Theme Integration',
  text: 'This alert uses your app theme colors.',
  backgroundColor: Theme.of(context).cardColor,
  titleColor: Theme.of(context).primaryColor,
  textColor: Theme.of(context).textTheme.bodyMedium?.color,
  confirmBtnColor: Theme.of(context).primaryColor,
);
```

### Dark Mode Support
```dart
void _showThemeAwareAlert(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    title: 'Theme Aware',
    text: 'This alert adapts to light/dark theme.',
    backgroundColor: isDark ? Colors.grey.shade800 : Colors.white,
    titleColor: isDark ? Colors.white : Colors.black87,
    textColor: isDark ? Colors.grey.shade300 : Colors.grey.shade600,
    confirmBtnColor: Theme.of(context).primaryColor,
  );
}
```

## 🎨 Complete Styling Examples

### Material Design 3 Style
```dart
void _showMaterial3Alert(BuildContext context) {
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    title: 'Material 3 Style',
    text: 'Following Material Design 3 guidelines.',
    backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
    titleColor: Theme.of(context).colorScheme.onSurfaceVariant,
    textColor: Theme.of(context).colorScheme.onSurfaceVariant,
    confirmBtnColor: Theme.of(context).colorScheme.primary,
    confirmBtnTextStyle: TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
      fontWeight: FontWeight.w500,
    ),
    borderRadius: 28.0, // Material 3 corner radius
  );
}
```

### iOS Cupertino Style
```dart
void _showCupertinoAlert(BuildContext context) {
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.info,
    title: 'iOS Style',
    text: 'Following iOS design guidelines.',
    backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
    titleColor: CupertinoColors.label.resolveFrom(context),
    textColor: CupertinoColors.secondaryLabel.resolveFrom(context),
    confirmBtnColor: CupertinoColors.systemBlue,
    titleTextStyle: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: CupertinoColors.label.resolveFrom(context),
    ),
    textTextStyle: TextStyle(
      fontSize: 15,
      color: CupertinoColors.secondaryLabel.resolveFrom(context),
    ),
    borderRadius: 14.0, // iOS corner radius
  );
}
```

### Custom Brand Style
```dart
class BrandColors {
  static const primary = Color(0xFF6366F1);
  static const secondary = Color(0xFF8B5CF6);
  static const surface = Color(0xFFF8FAFC);
  static const onSurface = Color(0xFF1E293B);
  static const success = Color(0xFF10B981);
  static const error = Color(0xFFEF4444);
}

void _showBrandedAlert(BuildContext context) {
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.custom,
    title: 'Branded Alert',
    text: 'This alert follows our brand guidelines.',
    backgroundColor: BrandColors.surface,
    titleColor: BrandColors.onSurface,
    textColor: BrandColors.onSurface,
    confirmBtnColor: BrandColors.primary,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: BrandColors.onSurface,
      fontFamily: 'BrandFont',
    ),
    textTextStyle: TextStyle(
      fontSize: 16,
      color: BrandColors.onSurface.withOpacity(0.8),
      height: 1.5,
    ),
    confirmBtnTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    borderRadius: 16.0,
  );
}
```

### Glassmorphism Style
```dart
void _showGlassmorphismAlert(BuildContext context) {
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.info,
    title: 'Glassmorphism',
    text: 'Modern glass-like appearance.',
    backgroundColor: Colors.white.withOpacity(0.1),
    titleColor: Colors.white,
    textColor: Colors.white.withOpacity(0.9),
    confirmBtnColor: Colors.white.withOpacity(0.2),
    confirmBtnTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    // Add blur effect background
    barrierColor: Colors.black.withOpacity(0.3),
    borderRadius: 20.0,
  );
}
```

## 🎪 Animation Styling

### Custom Entry Animation
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.success,
  title: 'Custom Animation',
  text: 'This alert slides in from the top.',
  position: QuickAlertAnimationType.slideInDown,
  animationDuration: Duration(milliseconds: 600),
);
```

### Custom Exit Animation
```dart
CustomQuickAlert.show(
  context: context,
  type: QuickAlertType.success,
  title: 'Custom Exit',
  text: 'This alert has a custom exit animation.',
  autoCloseDuration: Duration(seconds: 3),
  // Custom exit animation will be applied automatically
);
```

## 🎯 Responsive Design

### Screen Size Adaptation
```dart
void _showResponsiveAlert(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final isTablet = screenWidth > 600;
  
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.info,
    title: 'Responsive Design',
    text: 'This alert adapts to screen size.',
    width: isTablet ? 400.0 : screenWidth * 0.9,
    titleTextStyle: TextStyle(
      fontSize: isTablet ? 24 : 20,
      fontWeight: FontWeight.bold,
    ),
    textTextStyle: TextStyle(
      fontSize: isTablet ? 16 : 14,
    ),
  );
}
```

### Orientation Handling
```dart
void _showOrientationAwareAlert(BuildContext context) {
  final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
  
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    title: 'Orientation Aware',
    text: 'This alert adapts to device orientation.',
    width: isLandscape ? 500.0 : 350.0,
    // Adjust content based on orientation
  );
}
```

## 🎨 Custom Widgets

### Rich Content Alert
```dart
void _showRichContentAlert(BuildContext context) {
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.custom,
    title: 'Rich Content',
    text: 'This alert contains rich custom content.',
    widget: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Custom image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/feature_preview.png',
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          
          // Feature list
          ...['Feature 1', 'Feature 2', 'Feature 3'].map(
            (feature) => Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 20),
                  SizedBox(width: 8),
                  Text(feature),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 16),
          
          // Rating stars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) => 
              Icon(Icons.star, color: Colors.amber, size: 24)),
          ),
        ],
      ),
    ),
  );
}
```

### Progress Alert
```dart
void _showProgressAlert(BuildContext context) {
  double progress = 0.0;
  
  CustomQuickAlert.show(
    context: context,
    type: QuickAlertType.loading,
    title: 'Download Progress',
    text: 'Downloading files...',
    widget: StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 8),
            Text('${(progress * 100).toInt()}%'),
          ],
        );
      },
    ),
  );
  
  // Simulate progress updates
  Timer.periodic(Duration(milliseconds: 100), (timer) {
    progress += 0.01;
    if (progress >= 1.0) {
      timer.cancel();
      Navigator.of(context).pop();
    }
  });
}
```

## 🛠️ Styling Best Practices

### 1. Consistency
- Use your app's design system colors and typography
- Maintain consistent spacing and sizing across alerts
- Follow platform conventions (Material/Cupertino)

### 2. Accessibility
- Ensure sufficient color contrast (WCAG AA: 4.5:1 ratio)
- Use semantic colors (red for errors, green for success)
- Test with larger text sizes and screen readers

### 3. Performance
- Cache custom fonts and assets
- Use theme colors instead of hardcoded values
- Minimize widget rebuilds in custom widgets

### 4. Responsiveness
- Test on different screen sizes and orientations
- Use relative sizing when possible
- Provide fallbacks for missing assets

### 5. User Experience
- Keep animations smooth and purposeful
- Ensure buttons are easily tappable (minimum 44pt)
- Provide clear visual hierarchy

---

**Next:** [Animation Types →](animations.md)
