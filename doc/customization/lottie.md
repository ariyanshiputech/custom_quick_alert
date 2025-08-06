# 🎬 Custom Lottie Animations Guide

Create stunning, custom animated experiences with your own Lottie animations in Custom Quick Alert. This guide covers everything from using existing animations to creating your own.

## 🎯 Overview

Custom Quick Alert supports Lottie animations for beautiful, professional alert experiences. You can use the built-in animations, import custom animations, or create your own from scratch.

## 📦 Built-in Animations

Custom Quick Alert comes with professionally designed Lottie animations for each alert type:

### Available Built-in Animations

| Alert Type | Animation File | Description |
|------------|----------------|-------------|
| `success` | `success.json` | Green checkmark with celebration |
| `error` | `error.json` | Red X with shake effect |
| `warning` | `warning.json` | Orange warning triangle |
| `info` | `info.json` | Blue information icon |
| `confirm` | `confirm.json` | Question mark with pulse |
| `loading` | `loading.json` | Spinning loader (repeating) |
| `custom` | `custom.json` | Purple star with sparkle |

### Using Built-in Animations

```dart
// Built-in animations are used automatically
CustomQuickAlert.success(
  title: 'Success!',
  message: 'Uses built-in success animation',
);

// Animation file: packages/custom_quick_alert/assets/animations/success.json
```

---

## 🎨 Using Custom Lottie Animations

### 1. Add Animation to Assets

First, add your Lottie animation file to your project's `assets` folder:

```yaml
# pubspec.yaml
flutter:
  assets:
    - assets/animations/
    - assets/animations/my_custom_success.json
    - assets/animations/celebration.json
    - assets/animations/loading_spinner.json
```

### 2. Use Custom Animation

```dart
CustomQuickAlert.success(
  title: 'Custom Success!',
  message: 'Using my custom animation',
  lottieAsset: 'assets/animations/my_custom_success.json',
);
```

### 3. Advanced Custom Animation Usage

```dart
CustomQuickAlert.custom(
  title: 'Achievement Unlocked!',
  message: 'You completed all tasks',
  lottieAsset: 'assets/animations/celebration.json',
  animationType: CustomQuickAlertAnimationType.scale,
  backgroundColor: Colors.purple[50],
  titleColor: Colors.purple[800],
  confirmBtnColor: Colors.purple,
);
```

---

## 🏗️ Creating Custom Lottie Animations

### Animation Requirements

| Property | Requirement | Recommendation |
|----------|-------------|----------------|
| **Duration** | 0.5 - 3.0 seconds | 1.5 - 2.0 seconds |
| **Size** | 120x120 - 200x200 px | 120x120 px |
| **Frame Rate** | 30-60 FPS | 60 FPS |
| **File Size** | < 100 KB | < 50 KB |
| **Loop** | Optional | False (except loading) |

### Design Guidelines

#### Success Animations
- ✅ Use checkmarks, thumbs up, or celebration elements
- 🎨 Green color scheme (#4CAF50 family)
- ⚡ Quick, satisfying animation (1-2 seconds)
- 🎉 Can include subtle celebration effects

```dart
// Example: Custom success with celebration
CustomQuickAlert.success(
  title: 'Payment Successful!',
  message: 'Your order has been confirmed',
  lottieAsset: 'assets/animations/payment_success.json',
);
```

#### Error Animations
- ❌ Use X marks, warning symbols, or shake effects
- 🎨 Red color scheme (#F44336 family)
- ⚡ Clear, attention-grabbing (1-2 seconds)
- 🚫 Avoid overly dramatic or scary animations

```dart
// Example: Custom error with shake effect
CustomQuickAlert.error(
  title: 'Connection Failed',
  message: 'Unable to connect to server',
  lottieAsset: 'assets/animations/connection_error.json',
);
```

#### Loading Animations
- ⏳ Use spinners, progress bars, or pulse effects
- 🎨 Neutral colors (grays, blues)
- 🔄 **Must loop infinitely**
- ⚡ Smooth, non-distracting motion

```dart
// Example: Custom loading spinner
CustomQuickAlert.loading(
  title: 'Processing Payment...',
  message: 'Please wait while we process your payment',
  lottieAsset: 'assets/animations/payment_loading.json',
);
```

---

## 🛠️ Animation Tools & Resources

### Recommended Tools

#### 1. **After Effects + LottieFiles**
```bash
# Create animation in After Effects
# Export using Bodymovin plugin
# Optimize on LottieFiles.com
```

#### 2. **Rive (Alternative)**
```dart
// Note: Custom Quick Alert currently supports Lottie only
// Convert Rive animations to Lottie format
```

#### 3. **Online Lottie Editors**
- **LottieFiles Editor**: Online Lottie editing
- **Haiku Animator**: Animation creation tool
- **SVGator**: SVG-based animations (export to Lottie)

### Free Animation Resources

#### LottieFiles Marketplace
```dart
// Download from lottiefiles.com
// Popular categories:
// - Success animations
// - Error/failure animations  
// - Loading spinners
// - Confirmation dialogs
```

#### Custom Animation Examples

```dart
// Business/Professional
CustomQuickAlert.success(
  lottieAsset: 'assets/animations/business_success.json', // Handshake, documents
);

// E-commerce
CustomQuickAlert.success(
  lottieAsset: 'assets/animations/cart_success.json', // Shopping cart, money
);

// Social/Gaming
CustomQuickAlert.success(
  lottieAsset: 'assets/animations/level_up.json', // Stars, badges, celebrations
);

// Healthcare
CustomQuickAlert.info(
  lottieAsset: 'assets/animations/health_reminder.json', // Heart, pills, calendar
);
```

---

## 🎭 Animation Optimization

### File Size Optimization

```json
// Optimize Lottie JSON
{
  "v": "5.7.4",
  "fr": 30,        // Reduce frame rate if possible
  "ip": 0,
  "op": 60,        // Shorter duration = smaller file
  "w": 120,        // Optimize dimensions
  "h": 120,
  "nm": "success",
  "ddd": 0,
  "assets": [],    // Minimize assets
  "layers": [...]  // Reduce layer complexity
}
```

### Performance Guidelines

```dart
// ✅ Good: Appropriate animation size
CustomQuickAlert.success(
  lottieAsset: 'assets/animations/small_success.json', // 30KB
);

// ❌ Avoid: Oversized animations
CustomQuickAlert.success(
  lottieAsset: 'assets/animations/huge_success.json', // 500KB
);

// ✅ Good: Simple animations for frequent use
for (int i = 0; i < items.length; i++) {
  CustomQuickAlert.success(
    lottieAsset: 'assets/animations/simple_check.json', // Lightweight
    autoCloseDuration: Duration(seconds: 1),
  );
}
```

### Memory Management

```dart
// Preload frequently used animations
class AnimationPreloader {
  static final Map<String, LottieComposition> _cache = {};
  
  static Future<void> preloadAnimations() async {
    final animations = [
      'assets/animations/success.json',
      'assets/animations/error.json',
      'assets/animations/loading.json',
    ];
    
    for (final animation in animations) {
      _cache[animation] = await AssetLottie(animation).load();
    }
  }
}
```

---

## 🎨 Animation Categories & Examples

### Business & Professional

```dart
// Contract signing success
CustomQuickAlert.success(
  title: 'Contract Signed',
  message: 'Document has been signed successfully',
  lottieAsset: 'assets/animations/contract_success.json',
);

// Data backup complete
CustomQuickAlert.info(
  title: 'Backup Complete',
  message: 'Your data has been backed up safely',
  lottieAsset: 'assets/animations/backup_complete.json',
);

// Meeting scheduled
CustomQuickAlert.success(
  title: 'Meeting Scheduled',
  message: 'Calendar invitation sent to attendees',
  lottieAsset: 'assets/animations/calendar_success.json',
);
```

### E-commerce & Shopping

```dart
// Add to cart
CustomQuickAlert.success(
  title: 'Added to Cart',
  message: 'Item added successfully',
  lottieAsset: 'assets/animations/cart_add.json',
  position: CustomQuickAlertPosition.bottom,
  autoCloseDuration: Duration(seconds: 2),
);

// Payment processing
CustomQuickAlert.loading(
  title: 'Processing Payment',
  message: 'Please wait...',
  lottieAsset: 'assets/animations/payment_processing.json',
);

// Order confirmed
CustomQuickAlert.success(
  title: 'Order Confirmed!',
  message: 'Your order #12345 has been placed',
  lottieAsset: 'assets/animations/order_success.json',
);
```

### Social & Communication

```dart
// Message sent
CustomQuickAlert.success(
  title: 'Message Sent',
  message: 'Your message has been delivered',
  lottieAsset: 'assets/animations/message_sent.json',
  position: CustomQuickAlertPosition.bottom,
);

// Friend request sent
CustomQuickAlert.info(
  title: 'Friend Request Sent',
  message: 'Waiting for response',
  lottieAsset: 'assets/animations/friend_request.json',
);

// Post published
CustomQuickAlert.success(
  title: 'Post Published',
  message: 'Your post is now live',
  lottieAsset: 'assets/animations/post_success.json',
);
```

### Gaming & Entertainment

```dart
// Level up
CustomQuickAlert.success(
  title: 'Level Up!',
  message: 'You reached level 15',
  lottieAsset: 'assets/animations/level_up.json',
  animationType: CustomQuickAlertAnimationType.scale,
);

// Achievement unlocked
CustomQuickAlert.custom(
  title: 'Achievement Unlocked!',
  message: 'Master Strategist',
  lottieAsset: 'assets/animations/achievement.json',
  backgroundColor: Colors.purple[50],
  titleColor: Colors.purple[800],
);

// Game over
CustomQuickAlert.info(
  title: 'Game Over',
  message: 'Final Score: 1,250 points',
  lottieAsset: 'assets/animations/game_over.json',
);
```

---

## 🔧 Advanced Animation Techniques

### Conditional Animation Selection

```dart
String getAnimationForContext(String context, bool isSuccess) {
  final baseFolder = 'assets/animations/';
  
  switch (context) {
    case 'payment':
      return isSuccess 
        ? '${baseFolder}payment_success.json'
        : '${baseFolder}payment_error.json';
    case 'upload':
      return isSuccess 
        ? '${baseFolder}upload_success.json'
        : '${baseFolder}upload_error.json';
    case 'social':
      return isSuccess 
        ? '${baseFolder}social_success.json'
        : '${baseFolder}social_error.json';
    default:
      return isSuccess 
        ? '${baseFolder}generic_success.json'
        : '${baseFolder}generic_error.json';
  }
}

// Usage
CustomQuickAlert.success(
  title: 'Payment Complete',
  message: 'Transaction successful',
  lottieAsset: getAnimationForContext('payment', true),
);
```

### Dynamic Animation Loading

```dart
class DynamicAnimations {
  static Future<void> showRemoteAnimation(String url) async {
    // Download animation from URL
    final response = await http.get(Uri.parse(url));
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/temp_animation.json');
    await file.writeAsBytes(response.bodyBytes);
    
    CustomQuickAlert.custom(
      title: 'Dynamic Animation',
      message: 'Loaded from server',
      lottieAsset: file.path,
    );
  }
}
```

### Animation Variants

```dart
class AnimationVariants {
  static String getSuccessAnimation(String intensity) {
    switch (intensity) {
      case 'subtle':
        return 'assets/animations/success_subtle.json';
      case 'normal':
        return 'assets/animations/success_normal.json';
      case 'celebration':
        return 'assets/animations/success_celebration.json';
      default:
        return 'assets/animations/success_normal.json';
    }
  }
}

// Usage
CustomQuickAlert.success(
  title: 'Task Complete',
  lottieAsset: AnimationVariants.getSuccessAnimation('celebration'),
);
```

---

## 🐛 Animation Troubleshooting

### Common Issues & Solutions

#### Animation Not Loading
```dart
// ✅ Check file path
CustomQuickAlert.success(
  lottieAsset: 'assets/animations/success.json', // Correct path
);

// ❌ Common mistakes
// lottieAsset: 'animations/success.json', // Missing 'assets/'
// lottieAsset: 'assets/success.json',     // Wrong folder
```

#### Animation Too Large
```dart
// ✅ Optimize large animations
// Use LottieFiles optimizer or reduce complexity
CustomQuickAlert.success(
  lottieAsset: 'assets/animations/optimized_success.json', // <50KB
);
```

#### Animation Not Repeating (Loading)
```dart
// ✅ Loading animations should loop
// Check Lottie file has loop property set to true
CustomQuickAlert.loading(
  lottieAsset: 'assets/animations/loading_loop.json', // Loops infinitely
);
```

### Error Handling

```dart
Widget buildAnimationWithFallback(String assetPath) {
  return Lottie.asset(
    assetPath,
    width: 120,
    height: 120,
    errorBuilder: (context, error, stackTrace) {
      // Fallback to icon
      return Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.info,
          size: 60,
          color: Colors.blue,
        ),
      );
    },
  );
}
```

---

## 🔗 Related Documentation

- [Styling Guide](styling.md)
- [Animation Types](animations.md)
- [Performance Optimization](../advanced/performance.md)
- [Asset Management](../advanced/assets.md)
