# 📚 Custom Quick Alert Documentation Wiki

Welcome to the comprehensive documentation for Custom Quick Alert v2.1.0! This wiki provides detailed guides, tutorials, and best practices for using the package effectively.

## 📖 Table of Contents

### 🚀 Getting Started
- [Installation Guide](installation.md)
- [Quick Start Tutorial](quick-start.md)
- [Basic Usage Examples](basic-usage.md)
- [Migration from v1.x](migration-guide.md)

### 📱 API Documentation
- [Alert Types Reference](api/alert-types.md)
- [Parameters Reference](api/parameters.md)
- [Methods Reference](api/methods.md)
- [Enums Reference](api/enums.md)

### 🎨 Customization
- [Styling Guide](customization/styling.md)
- [Animation Types](customization/animations.md)
- [Position Options](customization/positions.md)
- [Theme System](customization/themes.md)
- [Custom Lottie Animations](customization/lottie.md)

### 💡 Advanced Guides
- [Performance Optimization](advanced/performance.md)
- [Memory Management](advanced/memory.md)
- [Testing Guide](advanced/testing.md)
- [Accessibility Guide](advanced/accessibility.md)
- [Deployment & Production](advanced/deployment.md)

### 🛠️ Examples & Tutorials
- [Real-World Examples](examples/real-world.md)
- [Real-World Examples v2](examples/real-world-v2.md)
- [Widget Integration Guide](examples/widget-integration.md)

### 🐛 Troubleshooting
- [Common Issues](troubleshooting/common-issues.md)

## 🌟 Quick Navigation

### 📋 Most Popular Guides
1. **[Installation Guide](installation.md)** - Get started in 5 minutes
2. **[Quick Start Tutorial](quick-start.md)** - Your first alert
3. **[Basic Usage Examples](basic-usage.md)** - Essential patterns
4. **[Widget Integration Guide](examples/widget-integration.md)** - Integrate with Flutter widgets
5. **[Styling Guide](customization/styling.md)** - Customize appearance
6. **[Real-World Examples](examples/real-world.md)** - Practical implementations

### 🎯 By Use Case
- **New to Custom Quick Alert?** → Start with [Installation](installation.md) → [Quick Start](quick-start.md)
- **Want to customize?** → Check [Styling Guide](customization/styling.md) → [Animation Types](customization/animations.md)
- **Need widget integration?** → See [Widget Integration Guide](examples/widget-integration.md)
- **Performance concerns?** → See [Performance Optimization](advanced/performance.md) → [Memory Management](advanced/memory.md)
- **Testing your app?** → Browse [Testing Guide](advanced/testing.md)
- **Production deployment?** → Check [Deployment Guide](advanced/deployment.md)
- **Accessibility needs?** → Visit [Accessibility Guide](advanced/accessibility.md)
- **Need examples?** → Browse [Real-World Examples](examples/real-world.md)
- **Having issues?** → Visit [Common Issues](troubleshooting/common-issues.md)

### 🔧 By Development Phase
- **Planning** → [API Documentation](api/alert-types.md) → [Widget Integration](examples/widget-integration.md)
- **Implementation** → [Basic Usage](basic-usage.md) → [Customization](customization/styling.md)
- **Testing** → [Testing Guide](advanced/testing.md) → [Accessibility](advanced/accessibility.md)
- **Optimization** → [Performance](advanced/performance.md) → [Memory](advanced/memory.md)
- **Deployment** → [Production Guide](advanced/deployment.md)
- **Troubleshooting** → [Common Issues](troubleshooting/common-issues.md)

## 📚 Documentation Features

### ✨ What You'll Find Here
- 🚀 **Complete Setup Guides** - From installation to production deployment
- 📖 **Comprehensive API Reference** - Every parameter and method documented
- 🎨 **Styling & Customization** - Make alerts match your brand perfectly
- 💡 **Real-World Examples** - Copy-paste solutions for common scenarios
- 🧩 **Widget Integration** - Seamless integration with Flutter widgets
- 🧪 **Testing Strategies** - Comprehensive testing approaches and utilities
- ⚡ **Performance Tips** - Optimize for the best user experience
- ♿ **Accessibility Guide** - WCAG compliant implementations
- � **Production Deployment** - Enterprise-ready deployment strategies
- �🐛 **Troubleshooting** - Solutions to common problems

### 🎯 Documentation Standards
- **Code Examples** - Every guide includes working, tested code
- **Platform Coverage** - iOS, Android, Web, Desktop support
- **Best Practices** - Industry-standard recommendations and patterns
- **Performance Notes** - Memory optimization and speed improvements
- **Accessibility** - WCAG 2.1 AA compliant implementations
- **Production Ready** - Enterprise deployment and monitoring guides
- **Testing Coverage** - Unit, widget, integration, and accessibility tests
- **Security** - Secure implementation patterns and best practices

## 🤝 Contributing to Documentation

Found an error or want to improve the docs? We welcome contributions!

1. **Report Issues** - [Create an issue](https://github.com/ariyanshiputech/custom_quick_alert/issues)
2. **Suggest Improvements** - [Open a discussion](https://github.com/ariyanshiputech/custom_quick_alert/discussions)
3. **Submit Changes** - [Create a pull request](https://github.com/ariyanshiputech/custom_quick_alert/pulls)

## 📊 Package Information

| Property | Value |
|----------|-------|
| **Current Version** | 2.1.0 |
| **Platform Support** | iOS, Android, Web, Desktop |
| **Flutter Version** | 3.24.0+ |
| **Dart Version** | 3.4.0+ |
| **License** | MIT |

---

*Happy coding with Custom Quick Alert! 🚀*

---

## 🔗 Quick Links

- [📦 Package on pub.dev](https://pub.dev/packages/custom_quick_alert)
- [🐙 GitHub Repository](https://github.com/ariyanshiputech/custom_quick_alert)
- [🐛 Report Issues](https://github.com/ariyanshiputech/custom_quick_alert/issues)
- [💬 Discussions](https://github.com/ariyanshiputech/custom_quick_alert/discussions)

## 🚀 Current Features (v2.1.0)

### 🎯 **Core Capabilities**
- ✅ **Context-Free API** - No BuildContext required
- ✅ **Global Navigator Support** - Works from anywhere
- ✅ **Type-Safe Enums** - Comprehensive type system
- ✅ **Zero Boilerplate** - One-line implementation
- ✅ **Memory Efficient** - Optimized performance

### 🎨 **Visual Excellence**
- ✅ **Material Design 3** - Latest design principles
- ✅ **Gradient Buttons** - Professional styling
- ✅ **Enhanced Shadows** - Multi-layer depth effects
- ✅ **Lottie Animations** - High-quality animations
- ✅ **Responsive Design** - All screen sizes

### ⚙️ **Customization**
- ✅ **7 Alert Types** - Success, Error, Warning, Info, Confirm, Loading, Custom
- ✅ **6 Animation Types** - Scale, Slide, Fade, Rotate
- ✅ **3 Position Options** - Top, Center, Bottom
- ✅ **Auto-Dismiss Timer** - Configurable duration
- ✅ **Theme System** - Complete visual control
- ✅ **Custom Widgets** - Unlimited flexibility

## 🎯 Quick Examples

### Basic Usage
```dart
// Success alert
CustomQuickAlert.success(
  title: 'Success!',
  message: 'Operation completed successfully.',
);

// Error alert
CustomQuickAlert.error(
  title: 'Error Occurred',
  message: 'Please try again later.',
);

// Confirmation dialog
CustomQuickAlert.confirm(
  title: 'Are you sure?',
  message: 'This action cannot be undone.',
  confirmText: 'Yes, Delete',
  cancelText: 'Cancel',
  showCancel: true,
  onConfirm: () {
    // Handle confirmation
  },
);
```

### Advanced Styling
```dart
CustomQuickAlert.success(
  title: 'Payment Successful',
  message: 'Your transaction has been processed securely.',
  useGradientButtons: true,
  customShadows: [
    BoxShadow(
      color: Colors.green.withValues(alpha: 0.2),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ],
  backgroundColor: Colors.green.shade50,
  titleColor: Colors.green.shade800,
  messageColor: Colors.green.shade600,
  confirmBtnColor: Colors.green.shade600,
  borderRadius: 16.0,
);
```

---

## 🤝 Contributing to Documentation

Help us improve this documentation! If you find any issues or want to add content:

1. [Create an issue](https://github.com/ariyanshiputech/custom_quick_alert/issues/new) for discussion
2. Fork the repository
3. Make your changes in the `docs/` folder
4. Submit a pull request

---

*Last updated: August 2025*
