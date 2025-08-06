# Custom Quick Alert Examples

This directory contains comprehensive examples demonstrating the full capabilities of the Custom Quick Alert library.

## 📁 Files Overview

### Core Files
- **`main.dart`** - Main demo app with navigation to all examples
- **`example_navigation.dart`** - Navigation hub for all example categories

### Example Categories

#### 1. Basic Examples (`basic_examples.dart`)
Learn the fundamentals with simple, clean examples:
- ✅ Success alerts
- ❌ Error alerts  
- ⚠️ Warning alerts
- ℹ️ Info alerts
- 🤔 Confirmation dialogs
- ⏳ Loading alerts
- 🎨 Custom alerts

#### 2. Advanced Examples (`advanced_examples.dart`)
Explore advanced features and customization:
- **Animation Types**: Scale, Fade, Slide (Down/Up/Left/Right)
- **Position Options**: Top, Center, Bottom
- **Styling**: Dark themes, gradient buttons, custom colors, sizing
- **Interactive Features**: Auto-dismiss, barrier dismissible, custom content

#### 3. Real-World Examples (`real_world_examples.dart`)
Practical implementations for common app scenarios:
- **Authentication**: Login flows, logout confirmations
- **Data Operations**: File uploads, delete confirmations, save prompts
- **Network Handling**: Connection errors, restoration, slow connection warnings
- **Form Validation**: Field validation, required fields, submission success
- **E-commerce**: Payment processing, cart operations, order confirmations
- **App Features**: Update notifications, premium unlocks, maintenance notices

## 🚀 Quick Start

1. **Initialize the library** in your `main()` function:
```dart
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
  CustomQuickAlert.initialize(navigatorKey);
}
```

2. **Add the navigator key** to your MaterialApp:
```dart
MaterialApp(
  navigatorKey: navigatorKey, // Important!
  home: MyHomePage(),
)
```

3. **Use anywhere** in your app:
```dart
CustomQuickAlert.success(
  title: 'Success!',
  message: 'Operation completed successfully.',
);
```

## 🎯 Key Features Demonstrated

### Context-Free Usage
All examples show how to use alerts without needing a BuildContext.

### Professional Styling
- Material Design 3.0 compliance
- Gradient buttons and shadows
- Customizable themes and colors
- Responsive design for all screen sizes

### Rich Animations
- Multiple animation types
- Smooth transitions
- Lottie animation support
- Position-based animations

### Enterprise Features
- Auto-dismiss functionality
- Callback handling
- Error recovery patterns
- Loading state management

## 📱 Running the Examples

1. Navigate to the example directory:
```bash
cd example
```

2. Get dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

4. Tap "View All Examples" to explore all categories.

## 💡 Learning Path

**Recommended order for exploring examples:**

1. **Start with Basic Examples** - Understand fundamental alert types
2. **Progress to Advanced Examples** - Learn customization and positioning
3. **Study Real-World Examples** - See practical implementation patterns

Each example includes:
- Clear, commented code
- Practical use cases
- Best practice implementations
- Professional styling

## 🔧 Customization Tips

### Theme Consistency
Create reusable configurations for consistent theming across your app:

```dart
final successConfig = QuickAlertConfig(
  type: QuickAlertType.success,
  backgroundColor: Colors.green.shade50,
  titleColor: Colors.green.shade800,
  confirmBtnColor: Colors.green,
  borderRadius: 15.0,
);
```

### Error Handling
Implement proper error handling patterns:

```dart
try {
  await riskyOperation();
  CustomQuickAlert.success(title: 'Success!');
} catch (e) {
  CustomQuickAlert.error(
    title: 'Error',
    message: e.toString(),
    confirmText: 'Retry',
    onConfirm: () => retryOperation(),
  );
}
```

### Loading States
Always provide feedback for async operations:

```dart
CustomQuickAlert.loading(title: 'Processing...');
try {
  await asyncOperation();
  CustomQuickAlert.dismiss();
  CustomQuickAlert.success(title: 'Complete!');
} catch (e) {
  CustomQuickAlert.dismiss();
  CustomQuickAlert.error(title: 'Failed');
}
```

## 📚 Additional Resources

- **Main Documentation**: See the README.md in the root directory
- **API Reference**: Check the `/lib` directory for detailed code documentation
- **Migration Guide**: Available in `/docs` for upgrading from previous versions

Happy coding with Custom Quick Alert! 🚀
