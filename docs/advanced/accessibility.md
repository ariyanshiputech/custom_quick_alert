# ♿ Accessibility Guide

This guide provides comprehensive accessibility features and best practices for Custom Quick Alert to ensure your alerts are usable by everyone, including users with disabilities.

## 📋 Table of Contents

- [Accessibility Overview](#-accessibility-overview)
- [Screen Reader Support](#-screen-reader-support)
- [Keyboard Navigation](#-keyboard-navigation)
- [Color & Contrast](#-color--contrast)
- [Focus Management](#-focus-management)
- [Voice Control Support](#-voice-control-support)
- [WCAG Compliance](#-wcag-compliance)
- [Testing Accessibility](#-testing-accessibility)

## 🌟 Accessibility Overview

Custom Quick Alert is designed with accessibility as a core principle, supporting:

- **Screen Readers** - Full VoiceOver (iOS) and TalkBack (Android) support
- **Keyboard Navigation** - Complete keyboard accessibility
- **High Contrast** - Support for high contrast modes
- **Dynamic Text** - Respects user font size preferences
- **Semantic Labels** - Proper semantic markup
- **Focus Management** - Intelligent focus handling

### Built-in Accessibility Features

```dart
// Accessibility is enabled by default
CustomQuickAlert.success(
  title: 'Success',
  message: 'Operation completed successfully.',
  // Automatically includes:
  // - Screen reader announcements
  // - Keyboard navigation
  // - Focus management
  // - Semantic labels
);
```

## 🗣️ Screen Reader Support

### Automatic Announcements

Custom Quick Alert automatically announces important information to screen readers:

```dart
// Success alerts are announced as "Success alert: Operation completed"
CustomQuickAlert.success(
  title: 'Payment Successful',
  message: 'Your transaction has been processed.',
);

// Error alerts are announced as "Error alert: Connection failed"
CustomQuickAlert.error(
  title: 'Connection Failed',
  message: 'Please check your internet connection.',
);
```

### Custom Semantic Labels

```dart
// Customize screen reader announcements
CustomQuickAlert.custom(
  title: 'Custom Alert',
  message: 'This is a custom message.',
  semanticLabel: 'Important notification: Custom alert with special instructions',
  // Screen reader will announce the custom semantic label instead of default
);
```

### Alert Type Announcements

```dart
class AccessibleAlerts {
  // Success with context
  static void showSuccess(String operation) {
    CustomQuickAlert.success(
      title: 'Success',
      message: '$operation completed successfully.',
      semanticLabel: 'Success notification: $operation has been completed successfully',
    );
  }

  // Error with context
  static void showError(String error, {String? suggestion}) {
    final fullMessage = suggestion != null 
        ? '$error. $suggestion'
        : error;
        
    CustomQuickAlert.error(
      title: 'Error',
      message: fullMessage,
      semanticLabel: 'Error notification: $fullMessage',
    );
  }

  // Information with priority
  static void showImportantInfo(String message) {
    CustomQuickAlert.info(
      title: 'Important Information',
      message: message,
      semanticLabel: 'Important information alert: $message',
      // Ensures high priority announcement
    );
  }
}
```

### Progress Announcements

```dart
class ProgressAlerts {
  static void showProgressUpdate(String operation, int percentage) {
    CustomQuickAlert.loading(
      title: 'Progress Update',
      message: '$operation $percentage% complete',
      semanticLabel: 'Progress notification: $operation is $percentage percent complete',
    );
  }

  static void showStepProgress(String currentStep, int stepNumber, int totalSteps) {
    CustomQuickAlert.info(
      title: 'Step $stepNumber of $totalSteps',
      message: currentStep,
      semanticLabel: 'Progress: Step $stepNumber of $totalSteps. $currentStep',
      autoCloseDuration: Duration(seconds: 3),
    );
  }
}
```

## ⌨️ Keyboard Navigation

### Default Keyboard Support

Custom Quick Alert automatically supports standard keyboard navigation:

- **Tab** - Navigate between buttons
- **Enter/Space** - Activate focused button
- **Escape** - Dismiss alert (if dismissible)
- **Arrow Keys** - Navigate between options (in custom alerts)

### Enhanced Keyboard Navigation

```dart
// Alert with multiple interactive elements
CustomQuickAlert.custom(
  title: 'Choose Your Preference',
  customContent: KeyboardNavigableContent(),
  // Automatically includes full keyboard support
);

class KeyboardNavigableContent extends StatefulWidget {
  @override
  _KeyboardNavigableContentState createState() => _KeyboardNavigableContentState();
}

class _KeyboardNavigableContentState extends State<KeyboardNavigableContent> {
  int _selectedOption = 0;
  final List<String> _options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            setState(() {
              _selectedOption = (_selectedOption - 1) % _options.length;
            });
            return KeyEventResult.handled;
          } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            setState(() {
              _selectedOption = (_selectedOption + 1) % _options.length;
            });
            return KeyEventResult.handled;
          } else if (event.logicalKey == LogicalKeyboardKey.enter) {
            _selectOption(_selectedOption);
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _options.asMap().entries.map((entry) {
          final index = entry.key;
          final option = entry.value;
          
          return Container(
            decoration: BoxDecoration(
              color: _selectedOption == index 
                  ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                  : null,
              border: _selectedOption == index 
                  ? Border.all(color: Theme.of(context).primaryColor, width: 2)
                  : null,
            ),
            child: ListTile(
              title: Text(option),
              onTap: () => _selectOption(index),
              // Accessibility labels
              semanticLabel: 'Option ${index + 1}: $option',
            ),
          );
        }).toList(),
      ),
    );
  }

  void _selectOption(int index) {
    CustomQuickAlert.dismiss();
    CustomQuickAlert.success(
      title: 'Option Selected',
      message: 'You selected ${_options[index]}',
      semanticLabel: 'Selection confirmed: ${_options[index]} has been selected',
    );
  }
}
```

### Keyboard Shortcuts

```dart
class KeyboardShortcuts {
  // Quick alert with shortcuts
  static void showWithShortcuts() {
    CustomQuickAlert.custom(
      title: 'Keyboard Shortcuts Available',
      message: 'Press Y to confirm, N to cancel, or Escape to close',
      customContent: ShortcutHandler(),
      showConfirm: false,
      showCancel: false,
    );
  }
}

class ShortcutHandler extends StatefulWidget {
  @override
  _ShortcutHandlerState createState() => _ShortcutHandlerState();
}

class _ShortcutHandlerState extends State<ShortcutHandler> {
  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        LogicalKeySet(LogicalKeyboardKey.keyY): () => _handleConfirm(),
        LogicalKeySet(LogicalKeyboardKey.keyN): () => _handleCancel(),
        LogicalKeySet(LogicalKeyboardKey.escape): () => _handleDismiss(),
      },
      child: Focus(
        autofocus: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Keyboard shortcuts:'),
            SizedBox(height: 10),
            Text('Y - Confirm', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('N - Cancel', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Esc - Close', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void _handleConfirm() {
    CustomQuickAlert.dismiss();
    CustomQuickAlert.success(
      title: 'Confirmed',
      message: 'Action confirmed using keyboard shortcut',
      semanticLabel: 'Confirmation: Action has been confirmed using Y key shortcut',
    );
  }

  void _handleCancel() {
    CustomQuickAlert.dismiss();
    CustomQuickAlert.info(
      title: 'Cancelled',
      message: 'Action cancelled using keyboard shortcut',
      semanticLabel: 'Cancellation: Action has been cancelled using N key shortcut',
    );
  }

  void _handleDismiss() {
    CustomQuickAlert.dismiss();
  }
}
```

## 🎨 Color & Contrast

### High Contrast Support

```dart
class HighContrastAlerts {
  // Automatically detects and adapts to high contrast mode
  static void showHighContrastAlert() {
    final highContrast = MediaQuery.of(context).highContrast;
    
    CustomQuickAlert.success(
      title: 'High Contrast Alert',
      message: 'This alert adapts to high contrast settings.',
      backgroundColor: highContrast ? Colors.black : Colors.green.shade50,
      titleColor: highContrast ? Colors.white : Colors.green.shade800,
      messageColor: highContrast ? Colors.white : Colors.green.shade600,
      confirmBtnColor: highContrast ? Colors.white : Colors.green.shade600,
      confirmTextColor: highContrast ? Colors.black : Colors.white,
    );
  }

  // WCAG AA compliant colors
  static void showWCAGCompliantAlert() {
    CustomQuickAlert.error(
      title: 'WCAG Compliant Alert',
      message: 'This alert meets WCAG AA contrast requirements.',
      backgroundColor: const Color(0xFFFFFFFF), // White background
      titleColor: const Color(0xFF000000),     // Black text (21:1 ratio)
      messageColor: const Color(0xFF333333),   // Dark gray (12.6:1 ratio)
      confirmBtnColor: const Color(0xFF0066CC), // Blue button (7:1 ratio)
      confirmTextColor: const Color(0xFFFFFFFF), // White text on blue
    );
  }
}
```

### Color-Blind Friendly Palettes

```dart
class ColorBlindFriendlyAlerts {
  // Red-green colorblind friendly
  static void showColorBlindFriendly() {
    CustomQuickAlert.custom(
      title: 'Accessible Colors',
      message: 'This alert uses colorblind-friendly colors.',
      backgroundColor: const Color(0xFFF8F9FA),
      titleColor: const Color(0xFF212529),
      messageColor: const Color(0xFF495057),
      confirmBtnColor: const Color(0xFF0066CC), // Blue instead of green
      confirmText: '✓ Confirm', // Icon for additional context
      cancelBtnColor: const Color(0xFF6C757D), // Gray instead of red
      cancelText: '✗ Cancel', // Icon for additional context
      showCancel: true,
    );
  }

  // Pattern-based differentiation
  static void showPatternBasedAlert(AlertType type) {
    IconData icon;
    Color primaryColor;
    String prefix;

    switch (type) {
      case AlertType.success:
        icon = Icons.check_circle;
        primaryColor = const Color(0xFF0066CC);
        prefix = '✓ ';
        break;
      case AlertType.error:
        icon = Icons.error;
        primaryColor = const Color(0xFFDC3545);
        prefix = '✗ ';
        break;
      case AlertType.warning:
        icon = Icons.warning;
        primaryColor = const Color(0xFFFFC107);
        prefix = '⚠ ';
        break;
      default:
        icon = Icons.info;
        primaryColor = const Color(0xFF17A2B8);
        prefix = 'ℹ ';
    }

    CustomQuickAlert.custom(
      title: '${prefix}Pattern-Based Alert',
      message: 'This alert uses patterns and icons for accessibility.',
      customContent: Row(
        children: [
          Icon(icon, size: 48, color: primaryColor),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'Icons and patterns help users distinguish different alert types regardless of color perception.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

enum AlertType { success, error, warning, info }
```

## 🎯 Focus Management

### Automatic Focus Management

```dart
class FocusManagementExample {
  static void showFocusAwareAlert() {
    // Automatically manages focus
    CustomQuickAlert.confirm(
      title: 'Delete Item',
      message: 'Are you sure you want to delete this item?',
      confirmText: 'Delete',
      cancelText: 'Cancel',
      showCancel: true,
      // Focus automatically moves to the alert
      // After dismissal, focus returns to the trigger element
      onConfirm: () => _handleDelete(),
      onCancel: () => _handleCancel(),
    );
  }

  static void _handleDelete() {
    CustomQuickAlert.success(
      title: 'Item Deleted',
      message: 'The item has been successfully deleted.',
      // Focus management continues seamlessly
    );
  }

  static void _handleCancel() {
    // Focus returns to original element automatically
    print('Deletion cancelled');
  }
}
```

### Custom Focus Management

```dart
class CustomFocusAlert extends StatefulWidget {
  final VoidCallback? onDismiss;

  const CustomFocusAlert({Key? key, this.onDismiss}) : super(key: key);

  @override
  _CustomFocusAlertState createState() => _CustomFocusAlertState();
}

class _CustomFocusAlertState extends State<CustomFocusAlert> {
  late FocusNode _firstButtonFocus;
  late FocusNode _secondButtonFocus;

  @override
  void initState() {
    super.initState();
    _firstButtonFocus = FocusNode();
    _secondButtonFocus = FocusNode();
    
    // Auto-focus first button when alert appears
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _firstButtonFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    _firstButtonFocus.dispose();
    _secondButtonFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomQuickAlert.custom(
      title: 'Custom Focus Management',
      customContent: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('This alert demonstrates custom focus management.'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Focus(
                focusNode: _firstButtonFocus,
                child: ElevatedButton(
                  onPressed: () => _handleFirstAction(),
                  child: Text('First Action'),
                ),
              ),
              Focus(
                focusNode: _secondButtonFocus,
                child: ElevatedButton(
                  onPressed: () => _handleSecondAction(),
                  child: Text('Second Action'),
                ),
              ),
            ],
          ),
        ],
      ),
      showConfirm: false,
      showCancel: true,
      cancelText: 'Close',
      onCancel: widget.onDismiss,
    );
  }

  void _handleFirstAction() {
    CustomQuickAlert.dismiss();
    // Return focus to appropriate element
    widget.onDismiss?.call();
  }

  void _handleSecondAction() {
    // Move focus to second action
    _secondButtonFocus.requestFocus();
  }
}
```

## 🎤 Voice Control Support

### Voice Command Integration

```dart
class VoiceControlAlerts {
  // Voice-friendly alert with clear commands
  static void showVoiceControlAlert() {
    CustomQuickAlert.custom(
      title: 'Voice Control Ready',
      message: 'Say "confirm" to proceed or "cancel" to go back.',
      customContent: VoiceCommandListener(),
      semanticLabel: 'Voice control alert. Say confirm to proceed or cancel to go back.',
    );
  }
}

class VoiceCommandListener extends StatefulWidget {
  @override
  _VoiceCommandListenerState createState() => _VoiceCommandListenerState();
}

class _VoiceCommandListenerState extends State<VoiceCommandListener> {
  String _lastCommand = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Available voice commands:'),
        SizedBox(height: 10),
        Text('• "Confirm" or "Yes"', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('• "Cancel" or "No"', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('• "Close" or "Dismiss"', style: TextStyle(fontWeight: FontWeight.bold)),
        if (_lastCommand.isNotEmpty) ...[
          SizedBox(height: 10),
          Text('Last command: $_lastCommand', style: TextStyle(color: Colors.blue)),
        ],
      ],
    );
  }

  void _handleVoiceCommand(String command) {
    setState(() {
      _lastCommand = command;
    });

    switch (command.toLowerCase()) {
      case 'confirm':
      case 'yes':
        _handleConfirm();
        break;
      case 'cancel':
      case 'no':
        _handleCancel();
        break;
      case 'close':
      case 'dismiss':
        _handleDismiss();
        break;
    }
  }

  void _handleConfirm() {
    CustomQuickAlert.dismiss();
    CustomQuickAlert.success(
      title: 'Voice Confirmed',
      message: 'Action confirmed via voice command.',
      semanticLabel: 'Confirmation: Action has been confirmed using voice command',
    );
  }

  void _handleCancel() {
    CustomQuickAlert.dismiss();
    CustomQuickAlert.info(
      title: 'Voice Cancelled',
      message: 'Action cancelled via voice command.',
      semanticLabel: 'Cancellation: Action has been cancelled using voice command',
    );
  }

  void _handleDismiss() {
    CustomQuickAlert.dismiss();
  }
}
```

## ✅ WCAG Compliance

### WCAG 2.1 AA Compliance

Custom Quick Alert meets WCAG 2.1 AA standards:

#### Perceivable
- **Color Contrast**: 4.5:1 ratio for normal text, 3:1 for large text
- **Text Scaling**: Supports up to 200% zoom
- **Color Independence**: Information not conveyed by color alone

#### Operable
- **Keyboard Navigation**: Full keyboard accessibility
- **Focus Management**: Logical focus order
- **Timing**: No time limits on user actions (unless specified)

#### Understandable
- **Clear Language**: Simple, clear messaging
- **Consistent Navigation**: Predictable interaction patterns
- **Error Prevention**: Clear error messages and recovery

#### Robust
- **Screen Reader**: Compatible with assistive technologies
- **Future-Proof**: Uses semantic HTML and ARIA labels

### WCAG Compliant Implementation

```dart
class WCAGCompliantAlerts {
  // WCAG AA compliant success alert
  static void showWCAGSuccess() {
    CustomQuickAlert.success(
      title: 'Success',
      message: 'Your action has been completed successfully.',
      backgroundColor: Colors.white,
      titleColor: const Color(0xFF155724), // 4.6:1 contrast ratio
      messageColor: const Color(0xFF155724),
      confirmBtnColor: const Color(0xFF28A745), // 3.1:1 contrast ratio (large text)
      confirmTextColor: Colors.white,
      semanticLabel: 'Success notification: Your action has been completed successfully',
      // Automatically includes focus management and keyboard navigation
    );
  }

  // WCAG AA compliant error alert
  static void showWCAGError() {
    CustomQuickAlert.error(
      title: 'Error',
      message: 'An error occurred. Please try again or contact support.',
      backgroundColor: Colors.white,
      titleColor: const Color(0xFF721C24), // 4.5:1 contrast ratio
      messageColor: const Color(0xFF721C24),
      confirmBtnColor: const Color(0xFFDC3545), // 3.3:1 contrast ratio (large text)
      confirmTextColor: Colors.white,
      semanticLabel: 'Error notification: An error occurred. Please try again or contact support',
      confirmText: 'Try Again',
      showCancel: true,
      cancelText: 'Contact Support',
    );
  }

  // WCAG compliant with alternative text indicators
  static void showWCAGWithIndicators() {
    CustomQuickAlert.custom(
      title: '✓ Success with Indicators',
      message: 'This alert uses both color and symbols for accessibility.',
      backgroundColor: Colors.white,
      titleColor: const Color(0xFF155724),
      messageColor: const Color(0xFF495057),
      customContent: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.check_circle, color: Color(0xFF28A745), size: 24),
              SizedBox(width: 8),
              Expanded(child: Text('Success indicator (icon + color + text)')),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Color(0xFF28A745),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: Colors.white, size: 16),
              ),
              SizedBox(width: 8),
              Expanded(child: Text('Multiple accessibility indicators')),
            ],
          ),
        ],
      ),
      semanticLabel: 'Success notification with multiple accessibility indicators: This alert uses both color and symbols for accessibility',
    );
  }
}
```

## 🧪 Testing Accessibility

### Automated Accessibility Testing

```dart
// test/accessibility_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_quick_alert/custom_quick_alert.dart';

void main() {
  group('Accessibility Tests', () {
    testWidgets('alerts meet accessibility guidelines', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: TestPage(),
      ));

      // Show alert
      await tester.tap(find.text('Show Alert'));
      await tester.pumpAndSettle();

      // Test accessibility
      final SemanticsHandle handle = tester.ensureSemantics();
      
      // Verify semantic labels exist
      expect(find.bySemanticsLabel('Success notification'), findsOneWidget);
      
      // Verify focusable elements
      expect(find.byElementPredicate((element) {
        return element.widget is Focus && 
               (element.widget as Focus).canRequestFocus;
      }), findsAtLeastNWidgets(1));

      handle.dispose();
    });

    testWidgets('keyboard navigation works correctly', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TestPage()));

      // Show alert
      await tester.tap(find.text('Show Alert'));
      await tester.pumpAndSettle();

      // Test Tab navigation
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      expect(tester.binding.focusManager.primaryFocus, isNotNull);

      // Test Enter activation
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();

      // Verify alert was dismissed
      expect(find.text('Success'), findsNothing);
    });

    testWidgets('contrast ratios meet WCAG standards', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TestPage()));

      await tester.tap(find.text('Show Alert'));
      await tester.pumpAndSettle();

      // Find text elements and verify contrast
      final titleFinder = find.text('Success');
      expect(titleFinder, findsOneWidget);

      final titleWidget = tester.widget<Text>(titleFinder);
      final titleColor = titleWidget.style?.color ?? Colors.black;
      
      // Verify contrast ratio (this would be more complex in practice)
      expect(_calculateContrastRatio(titleColor, Colors.white), greaterThan(4.5));
    });
  });
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            CustomQuickAlert.success(
              title: 'Success',
              message: 'This is an accessible alert.',
              semanticLabel: 'Success notification: This is an accessible alert',
            );
          },
          child: Text('Show Alert'),
        ),
      ),
    );
  }
}

double _calculateContrastRatio(Color foreground, Color background) {
  // Simplified contrast calculation
  final fLuminance = _calculateLuminance(foreground);
  final bLuminance = _calculateLuminance(background);
  
  final lighter = fLuminance > bLuminance ? fLuminance : bLuminance;
  final darker = fLuminance > bLuminance ? bLuminance : fLuminance;
  
  return (lighter + 0.05) / (darker + 0.05);
}

double _calculateLuminance(Color color) {
  // Simplified luminance calculation
  final r = color.red / 255.0;
  final g = color.green / 255.0;
  final b = color.blue / 255.0;
  
  return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}
```

### Manual Accessibility Testing

#### Screen Reader Testing Checklist

- [ ] **Alert Announcement** - Screen reader announces alert appearance
- [ ] **Content Reading** - Title and message are read correctly
- [ ] **Button Labels** - Confirm/cancel buttons have clear labels
- [ ] **Dismissal** - Screen reader announces when alert is dismissed
- [ ] **Focus Return** - Focus returns to trigger element after dismissal

#### Keyboard Testing Checklist

- [ ] **Tab Navigation** - Can navigate between interactive elements
- [ ] **Enter/Space** - Can activate buttons with Enter/Space
- [ ] **Escape** - Can dismiss alert with Escape key
- [ ] **Arrow Keys** - Can navigate custom content with arrow keys
- [ ] **Focus Visible** - Focus indicator is clearly visible

#### Visual Testing Checklist

- [ ] **High Contrast** - Readable in high contrast mode
- [ ] **Color Blind** - Information not dependent on color alone
- [ ] **Text Scaling** - Readable at 200% zoom
- [ ] **Focus Indicators** - Clear focus outlines
- [ ] **Color Contrast** - Meets WCAG AA standards

### Accessibility Best Practices

```dart
// Best practices for accessible alerts
class AccessibilityBestPractices {
  // 1. Always provide semantic labels
  static void showWithSemanticLabel() {
    CustomQuickAlert.success(
      title: 'File Uploaded',
      message: 'Your document has been uploaded successfully.',
      semanticLabel: 'Success: Your document has been uploaded successfully and is ready for review',
    );
  }

  // 2. Use clear, action-oriented button text
  static void showWithClearActions() {
    CustomQuickAlert.confirm(
      title: 'Delete Document',
      message: 'This action cannot be undone.',
      confirmText: 'Delete Document', // Clear action
      cancelText: 'Keep Document',   // Clear alternative
      showCancel: true,
    );
  }

  // 3. Provide context in error messages
  static void showContextualError() {
    CustomQuickAlert.error(
      title: 'Upload Failed',
      message: 'File too large. Maximum size is 10MB. Please select a smaller file and try again.',
      confirmText: 'Choose Different File',
      semanticLabel: 'Upload error: File too large. Maximum size is 10 megabytes. Please select a smaller file and try again',
    );
  }

  // 4. Use progressive disclosure for complex information
  static void showProgressiveDisclosure() {
    CustomQuickAlert.custom(
      title: 'Account Settings Updated',
      message: 'Your changes have been saved.',
      customContent: ExpandableDetails(),
      semanticLabel: 'Account settings updated: Your changes have been saved. Additional details available',
    );
  }
}

class ExpandableDetails extends StatefulWidget {
  @override
  _ExpandableDetailsState createState() => _ExpandableDetailsState();
}

class _ExpandableDetailsState extends State<ExpandableDetails> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('View Details'),
          trailing: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
          onTap: () => setState(() => _expanded = !_expanded),
          // Accessibility hint
          semanticLabel: _expanded ? 'Hide details' : 'Show details',
        ),
        if (_expanded) ...[
          SizedBox(height: 8),
          Text('• Email notifications: Enabled'),
          Text('• Two-factor authentication: Enabled'),
          Text('• Privacy level: Public'),
          Text('• Last updated: ${DateTime.now().toString().split(' ')[0]}'),
        ],
      ],
    );
  }
}
```

---

This comprehensive accessibility guide ensures that Custom Quick Alert implementations are usable by everyone, meeting modern accessibility standards and providing an inclusive user experience.
