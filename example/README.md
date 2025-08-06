# 📱 Custom Quick Alert - Example App

This Flutter app demonstrates all the features and capabilities of the Custom Quick Alert package. Use this as a reference for implementing alerts in your own applications.

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.24.0+
- Dart SDK 3.4.0+

### Installation

1. **Clone the repository:**
```bash
git clone https://github.com/ariyanshiputech/custom_quick_alert.git
cd custom_quick_alert/example
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Run the example app:**
```bash
flutter run
```

## 📱 Example App Features

### 🎯 Demo Sections

| Section | Description | Examples |
|---------|-------------|-----------|
| **Basic Examples** | Simple alert implementations | Success, Error, Warning, Info, Confirm, Loading |
| **Advanced Examples** | Complex customizations | Custom themes, animations, positioning |
| **Real-World Examples** | Production-ready patterns | Authentication flows, e-commerce actions |
| **Widget Examples** | Integration with widgets | Form validation, network handling |
| **Position Tests** | Position demonstrations | Top, Center, Bottom positioning |

### 🎬 Available Demos

#### 1. Basic Alert Types
- ✅ Success alerts with auto-dismiss
- ❌ Error alerts with retry functionality  
- ⚠️ Warning alerts with confirmations
- ℹ️ Info alerts with custom styling
- 🤔 Confirmation dialogs with callbacks
- ⏳ Loading indicators with progress
- 🎨 Custom alerts with widgets

#### 2. Animation Showcase
- Scale animations (default)
- Slide animations (Up, Down, Left, Right)
- Fade animations
- Custom Lottie animations

#### 3. Position Testing
- Top positioned alerts
- Center positioned alerts (default)
- Bottom positioned alerts

#### 4. Styling Examples
- Material Design 3 themes
- Dark mode support
- Custom color schemes
- Gradient buttons
- Professional shadows

## 🗂️ File Structure

```
example/
├── lib/
│   ├── main.dart                 # Main app entry point
│   ├── example_navigation.dart   # Navigation between examples
│   ├── basic_examples.dart       # Simple alert implementations
│   ├── advanced_examples.dart    # Complex customizations
│   ├── real_world_examples.dart  # Production patterns
│   ├── widget_examples.dart      # Widget integration
│   ├── no_casting_examples.dart  # Type-safe implementations
│   ├── position_test_app.dart    # Position demonstrations
│   └── alert_example_page.dart   # Individual alert demos
├── assets/
│   └── icons/                    # App icons and graphics
├── android/                      # Android platform files
├── ios/                          # iOS platform files
├── web/                          # Web platform files
├── windows/                      # Windows platform files
├── linux/                        # Linux platform files
├── macos/                        # macOS platform files
└── pubspec.yaml                  # Dependencies
```

## 📋 Code Examples

### Basic Implementation

```dart
import 'package:custom_quick_alert/custom_quick_alert.dart';

// Success Alert
CustomQuickAlert.success(
  title: 'Success!',
  message: 'Operation completed successfully.',
);

// Error Alert
CustomQuickAlert.error(
  title: 'Error',
  message: 'Something went wrong.',
);

// Confirmation Dialog
CustomQuickAlert.confirm(
  title: 'Confirm Action',
  message: 'Are you sure you want to proceed?',
  onConfirm: () => print('Confirmed'),
  onCancel: () => print('Cancelled'),
);
```

### Advanced Customization

```dart
// Custom Styled Alert
CustomQuickAlert.success(
  title: 'Payment Successful',
  message: 'Your transaction has been processed.',
  backgroundColor: Colors.green.shade50,
  titleColor: Colors.green.shade800,
  confirmBtnColor: Colors.green.shade600,
  borderRadius: 16.0,
  useGradientButtons: true,
  customShadows: [
    BoxShadow(
      color: Colors.green.withValues(alpha: 0.2),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ],
);
```

### Real-World Usage

```dart
// Authentication Flow
class AuthExample {
  static Future<void> login(String email, String password) async {
    // Show loading
    CustomQuickAlert.loading(
      title: 'Signing In',
      message: 'Authenticating your credentials...',
    );

    try {
      await authService.login(email, password);
      CustomQuickAlert.dismiss();
      
      // Show success
      CustomQuickAlert.success(
        title: 'Welcome Back!',
        message: 'You have been successfully signed in.',
        onConfirm: () => Navigator.pushReplacementNamed(context, '/home'),
      );
    } catch (e) {
      CustomQuickAlert.dismiss();
      
      // Show error
      CustomQuickAlert.error(
        title: 'Login Failed',
        message: 'Invalid credentials. Please try again.',
      );
    }
  }
}
```

## 🎨 Customization Examples

### Theme System
```dart
// Professional Success Theme
static void showSuccessTheme() {
  CustomQuickAlert.success(
    title: 'Professional Success',
    message: 'Operation completed with style.',
    backgroundColor: const Color(0xFFF0FDF4),
    titleColor: const Color(0xFF16A34A),
    messageColor: const Color(0xFF166534),
    confirmBtnColor: const Color(0xFF22C55E),
    borderRadius: 16.0,
  );
}

// Dark Theme Alert
static void showDarkTheme() {
  CustomQuickAlert.info(
    title: 'Dark Theme Alert',
    message: 'This alert uses dark theme styling.',
    backgroundColor: const Color(0xFF1F2937),
    titleColor: const Color(0xFFF9FAFB),
    messageColor: const Color(0xFFD1D5DB),
    confirmBtnColor: const Color(0xFF3B82F6),
  );
}
```

### Animation Options
```dart
// Slide Animation
CustomQuickAlert.success(
  title: 'Slide Animation',
  message: 'This alert slides in from the top.',
  animationType: QuickAlertAnimationType.slideInDown,
);

// Fade Animation
CustomQuickAlert.info(
  title: 'Fade Animation',
  message: 'This alert fades in smoothly.',
  animationType: QuickAlertAnimationType.fade,
);
```

## 🔧 Development

### Adding New Examples

1. **Create example function:**
```dart
static void showNewExample() {
  CustomQuickAlert.custom(
    title: 'New Example',
    message: 'Description of the new example.',
    // ... customization
  );
}
```

2. **Add to navigation:**
```dart
ElevatedButton(
  onPressed: () => ExampleClass.showNewExample(),
  child: Text('New Example'),
)
```

3. **Update documentation:**
- Add description to this README
- Update main documentation if applicable

### Testing

```bash
# Run tests
flutter test

# Run specific test
flutter test test/example_test.dart

# Run with coverage
flutter test --coverage
```

### Platform Testing

```bash
# Test on Android
flutter run -d android

# Test on iOS
flutter run -d ios

# Test on Web
flutter run -d chrome

# Test on Desktop
flutter run -d windows  # or macos, linux
```

## 📚 Learning Resources

### Documentation Links
- **[Installation Guide](../docs/installation.md)** - Setup instructions
- **[API Reference](../docs/api/)** - Complete parameter guide
- **[Customization Guide](../docs/customization/)** - Styling options
- **[Real-World Examples](../docs/examples/)** - Production patterns

### External Resources
- **[Flutter Documentation](https://docs.flutter.dev/)** - Flutter development guide
- **[Material Design 3](https://m3.material.io/)** - Design principles
- **[Lottie Animations](https://lottiefiles.com/)** - Animation resources

## 🐛 Known Issues

1. **Hot Reload**: Some customizations may require app restart
2. **Web Platform**: Complex shadows may not render on all browsers
3. **Desktop**: Position calculations may differ on high-DPI displays

## 💡 Tips & Best Practices

### Performance
- Use `autoCloseDuration` for non-critical alerts
- Implement proper error handling
- Avoid showing multiple alerts simultaneously

### User Experience
- Use appropriate alert types for different scenarios
- Keep messages concise and actionable
- Test on different screen sizes

### Accessibility
- Ensure sufficient color contrast
- Test with screen readers
- Provide keyboard navigation support

## 🤝 Contributing

Found a bug or want to add an example? We welcome contributions!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/new-example`)
3. Add your example and tests
4. Update documentation
5. Submit a pull request

## 📄 License

This example app is licensed under the MIT License - see the [LICENSE](../LICENSE) file for details.

---

**Happy coding with Custom Quick Alert! 🚀**

For more information, visit the [main documentation](../README.md) or [package page](https://pub.dev/packages/custom_quick_alert).
