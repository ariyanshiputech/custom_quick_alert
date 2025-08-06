# 🧪 Testing Guide

This guide provides comprehensive testing strategies and examples for applications using Custom Quick Alert.

## 📋 Table of Contents

- [Testing Setup](#-testing-setup)
- [Unit Testing](#-unit-testing)
- [Widget Testing](#-widget-testing)
- [Integration Testing](#-integration-testing)
- [Mocking Custom Quick Alert](#-mocking-custom-quick-alert)
- [Test Utilities](#-test-utilities)
- [Best Practices](#-best-practices)

## 🛠️ Testing Setup

### Dependencies

Add these testing dependencies to your `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.4.0
  build_runner: ^2.4.0
  mocktail: ^0.3.0
  patrol: ^2.0.0  # For integration tests
  integration_test:
    sdk: flutter
```

### Test Environment Setup

```dart
// test/test_setup.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_quick_alert/custom_quick_alert.dart';

class TestSetup {
  static late GlobalKey<NavigatorState> navigatorKey;
  
  static void setupTests() {
    navigatorKey = GlobalKey<NavigatorState>();
    CustomQuickAlert.initialize(navigatorKey);
  }
  
  static Widget createTestApp({required Widget child}) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: child,
    );
  }
  
  static void tearDown() {
    // Clean up any persistent alerts
    if (CustomQuickAlert.isShowing()) {
      CustomQuickAlert.dismiss();
    }
  }
}
```

## 🔧 Unit Testing

### Testing Alert Service Logic

```dart
// test/alert_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:custom_quick_alert/custom_quick_alert.dart';

// Mock class for CustomQuickAlert
class MockCustomQuickAlert extends Mock implements CustomQuickAlert {}

void main() {
  group('AlertService Tests', () {
    late MockCustomQuickAlert mockAlert;
    
    setUp(() {
      mockAlert = MockCustomQuickAlert();
    });

    test('should show success alert with correct parameters', () {
      // Arrange
      const title = 'Success';
      const message = 'Operation completed';
      
      // Act
      AlertService.showSuccess(title, message);
      
      // Assert
      verify(CustomQuickAlert.success(
        title: title,
        message: message,
      )).called(1);
    });

    test('should show error alert with retry callback', () {
      // Arrange
      const title = 'Error';
      const message = 'Something went wrong';
      bool retryCallbackCalled = false;
      void retryCallback() => retryCallbackCalled = true;
      
      // Act
      AlertService.showError(title, message, onRetry: retryCallback);
      
      // Assert
      verify(CustomQuickAlert.error(
        title: title,
        message: message,
        confirmText: 'Retry',
        onConfirm: retryCallback,
      )).called(1);
    });

    test('should show loading alert and dismiss correctly', () async {
      // Arrange
      const title = 'Loading';
      const message = 'Please wait...';
      
      // Act
      AlertService.showLoading(title, message);
      await Future.delayed(Duration(milliseconds: 100));
      AlertService.dismissLoading();
      
      // Assert
      verify(CustomQuickAlert.loading(
        title: title,
        message: message,
      )).called(1);
      verify(CustomQuickAlert.dismiss()).called(1);
    });
  });
}

class AlertService {
  static void showSuccess(String title, String message) {
    CustomQuickAlert.success(title: title, message: message);
  }
  
  static void showError(String title, String message, {VoidCallback? onRetry}) {
    CustomQuickAlert.error(
      title: title,
      message: message,
      confirmText: onRetry != null ? 'Retry' : 'OK',
      onConfirm: onRetry,
    );
  }
  
  static void showLoading(String title, String message) {
    CustomQuickAlert.loading(title: title, message: message);
  }
  
  static void dismissLoading() {
    CustomQuickAlert.dismiss();
  }
}
```

### Testing Business Logic

```dart
// test/user_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ApiService, AlertService])
void main() {
  group('UserService Tests', () {
    late UserService userService;
    late MockApiService mockApiService;
    late MockAlertService mockAlertService;
    
    setUp(() {
      mockApiService = MockApiService();
      mockAlertService = MockAlertService();
      userService = UserService(mockApiService, mockAlertService);
    });

    test('should show success alert on successful login', () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password123';
      const user = User(id: '1', email: email, name: 'Test User');
      
      when(mockApiService.login(email, password))
          .thenAnswer((_) async => user);
      
      // Act
      await userService.login(email, password);
      
      // Assert
      verify(mockAlertService.showLoading('Signing In', any)).called(1);
      verify(mockAlertService.dismissLoading()).called(1);
      verify(mockAlertService.showSuccess('Welcome Back!', any)).called(1);
    });

    test('should show error alert on failed login', () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'wrongpassword';
      
      when(mockApiService.login(email, password))
          .thenThrow(Exception('Invalid credentials'));
      
      // Act
      await userService.login(email, password);
      
      // Assert
      verify(mockAlertService.showLoading('Signing In', any)).called(1);
      verify(mockAlertService.dismissLoading()).called(1);
      verify(mockAlertService.showError('Login Failed', any)).called(1);
    });

    test('should show confirmation alert before logout', () async {
      // Arrange
      bool confirmCallbackCalled = false;
      
      // Act
      await userService.requestLogout();
      
      // Assert
      verify(mockAlertService.showConfirmation(
        'Sign Out',
        'Are you sure you want to sign out?',
        onConfirm: anyNamed('onConfirm'),
      )).called(1);
    });
  });
}

class UserService {
  final ApiService apiService;
  final AlertService alertService;
  
  UserService(this.apiService, this.alertService);
  
  Future<void> login(String email, String password) async {
    alertService.showLoading('Signing In', 'Authenticating your credentials...');
    
    try {
      final user = await apiService.login(email, password);
      alertService.dismissLoading();
      alertService.showSuccess('Welcome Back!', 'You have been successfully signed in.');
    } catch (e) {
      alertService.dismissLoading();
      alertService.showError('Login Failed', 'Invalid credentials. Please try again.');
    }
  }
  
  Future<void> requestLogout() async {
    alertService.showConfirmation(
      'Sign Out',
      'Are you sure you want to sign out?',
      onConfirm: () => _performLogout(),
    );
  }
  
  Future<void> _performLogout() async {
    await apiService.logout();
    alertService.showSuccess('Signed Out', 'You have been successfully signed out.');
  }
}

class User {
  final String id;
  final String email;
  final String name;
  
  User({required this.id, required this.email, required this.name});
}

class ApiService {
  Future<User> login(String email, String password) async {
    throw UnimplementedError();
  }
  
  Future<void> logout() async {
    throw UnimplementedError();
  }
}
```

## 🎯 Widget Testing

### Testing Widget Interactions

```dart
// test/widget/login_form_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_setup.dart';

void main() {
  group('LoginForm Widget Tests', () {
    setUp(() {
      TestSetup.setupTests();
    });
    
    tearDown(() {
      TestSetup.tearDown();
    });

    testWidgets('should show validation alert on empty form submission', (tester) async {
      // Arrange
      await tester.pumpWidget(TestSetup.createTestApp(child: LoginForm()));
      
      // Act
      final submitButton = find.text('Login');
      await tester.tap(submitButton);
      await tester.pumpAndSettle();
      
      // Assert
      expect(find.text('Form Validation Error'), findsOneWidget);
      expect(find.text('Please fill in all required fields correctly.'), findsOneWidget);
    });

    testWidgets('should show loading alert during form submission', (tester) async {
      // Arrange
      await tester.pumpWidget(TestSetup.createTestApp(child: LoginForm()));
      
      // Fill in form
      await tester.enterText(find.byKey(Key('email_field')), 'test@example.com');
      await tester.enterText(find.byKey(Key('password_field')), 'password123');
      
      // Act
      final submitButton = find.text('Login');
      await tester.tap(submitButton);
      await tester.pump(); // Don't settle, so we can see loading state
      
      // Assert
      expect(find.text('Signing In'), findsOneWidget);
      expect(find.text('Authenticating your credentials...'), findsOneWidget);
      
      // Wait for completion
      await tester.pumpAndSettle();
    });

    testWidgets('should show success alert on successful submission', (tester) async {
      // Arrange
      await tester.pumpWidget(TestSetup.createTestApp(child: LoginForm()));
      
      // Fill in valid credentials
      await tester.enterText(find.byKey(Key('email_field')), 'valid@example.com');
      await tester.enterText(find.byKey(Key('password_field')), 'validpassword');
      
      // Act
      final submitButton = find.text('Login');
      await tester.tap(submitButton);
      await tester.pumpAndSettle();
      
      // Assert
      expect(find.text('Welcome Back!'), findsOneWidget);
      expect(find.text('You have been successfully signed in.'), findsOneWidget);
    });

    testWidgets('should dismiss alert when OK button is tapped', (tester) async {
      // Arrange
      await tester.pumpWidget(TestSetup.createTestApp(child: LoginForm()));
      
      // Trigger validation error
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();
      
      // Act
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      
      // Assert
      expect(find.text('Form Validation Error'), findsNothing);
    });
  });
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  void _handleLogin() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      CustomQuickAlert.warning(
        title: 'Form Validation Error',
        message: 'Please fill in all required fields correctly.',
      );
      return;
    }
    
    CustomQuickAlert.loading(
      title: 'Signing In',
      message: 'Authenticating your credentials...',
    );
    
    // Simulate API call
    await Future.delayed(Duration(seconds: 1));
    CustomQuickAlert.dismiss();
    
    if (_emailController.text == 'valid@example.com' && 
        _passwordController.text == 'validpassword') {
      CustomQuickAlert.success(
        title: 'Welcome Back!',
        message: 'You have been successfully signed in.',
      );
    } else {
      CustomQuickAlert.error(
        title: 'Login Failed',
        message: 'Invalid credentials. Please try again.',
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              key: Key('email_field'),
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              key: Key('password_field'),
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Testing Custom Alert Components

```dart
// test/widget/custom_alert_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_setup.dart';

void main() {
  group('Custom Alert Components', () {
    setUp(() {
      TestSetup.setupTests();
    });
    
    tearDown(() {
      TestSetup.tearDown();
    });

    testWidgets('should display custom content in alert', (tester) async {
      // Arrange
      await tester.pumpWidget(TestSetup.createTestApp(child: CustomAlertDemo()));
      
      // Act
      await tester.tap(find.text('Show Custom Alert'));
      await tester.pumpAndSettle();
      
      // Assert
      expect(find.text('Rate Our App'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsNWidgets(5));
    });

    testWidgets('should handle star rating interaction', (tester) async {
      // Arrange
      await tester.pumpWidget(TestSetup.createTestApp(child: CustomAlertDemo()));
      
      // Show custom alert
      await tester.tap(find.text('Show Custom Alert'));
      await tester.pumpAndSettle();
      
      // Act
      await tester.tap(find.byIcon(Icons.star).first);
      await tester.pumpAndSettle();
      
      // Assert
      expect(find.text('Thanks for Rating!'), findsOneWidget);
      expect(find.text('You rated us 1 star(s)'), findsOneWidget);
    });
  });
}

class CustomAlertDemo extends StatelessWidget {
  void _showCustomAlert() {
    CustomQuickAlert.custom(
      title: 'Rate Our App',
      customContent: RatingWidget(),
      showConfirm: false,
      showCancel: true,
      cancelText: 'Later',
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _showCustomAlert,
          child: Text('Show Custom Alert'),
        ),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  void _handleRating(int rating) {
    CustomQuickAlert.dismiss();
    
    CustomQuickAlert.success(
      title: 'Thanks for Rating!',
      message: 'You rated us $rating star(s)',
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('How would you rate your experience?'),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) => 
            IconButton(
              icon: Icon(Icons.star, color: Colors.amber),
              onPressed: () => _handleRating(index + 1),
            ),
          ),
        ),
      ],
    );
  }
}
```

## 🔄 Integration Testing

### E2E Testing with Integration Tests

```dart
// integration_test/app_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:custom_quick_alert_example/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Custom Quick Alert Integration Tests', () {
    testWidgets('complete user flow with alerts', (tester) async {
      // Initialize app
      app.main();
      await tester.pumpAndSettle();

      // Navigate to login
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Test invalid login
      await tester.enterText(find.byKey(Key('email')), 'invalid@test.com');
      await tester.enterText(find.byKey(Key('password')), 'wrongpassword');
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // Verify error alert
      expect(find.text('Login Failed'), findsOneWidget);
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Test valid login
      await tester.enterText(find.byKey(Key('email')), 'user@example.com');
      await tester.enterText(find.byKey(Key('password')), 'password123');
      await tester.tap(find.text('Sign In'));
      
      // Wait for loading alert
      await tester.pump(Duration(milliseconds: 100));
      expect(find.text('Signing In'), findsOneWidget);
      
      // Wait for success
      await tester.pumpAndSettle();
      expect(find.text('Welcome Back!'), findsOneWidget);
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      // Test logout flow
      await tester.tap(find.byIcon(Icons.logout));
      await tester.pumpAndSettle();
      
      // Verify confirmation alert
      expect(find.text('Sign Out'), findsOneWidget);
      await tester.tap(find.text('Sign Out'));
      await tester.pumpAndSettle();
      
      // Verify success
      expect(find.text('Signed Out'), findsOneWidget);
    });

    testWidgets('form validation flow', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to form
      await tester.tap(find.text('Contact Form'));
      await tester.pumpAndSettle();

      // Submit empty form
      await tester.tap(find.text('Submit'));
      await tester.pumpAndSettle();

      // Verify validation alert
      expect(find.text('Form Validation Error'), findsOneWidget);
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Fill form correctly
      await tester.enterText(find.byKey(Key('name')), 'John Doe');
      await tester.enterText(find.byKey(Key('email')), 'john@example.com');
      await tester.enterText(find.byKey(Key('message')), 'Hello world');
      
      // Submit form
      await tester.tap(find.text('Submit'));
      
      // Wait for loading
      await tester.pump(Duration(milliseconds: 100));
      expect(find.text('Submitting Form'), findsOneWidget);
      
      // Wait for success
      await tester.pumpAndSettle();
      expect(find.text('Form Submitted!'), findsOneWidget);
    });
  });
}
```

### Performance Testing

```dart
// test/performance/alert_performance_test.dart
import 'package:flutter_test/flutter_test.dart';
import '../test_setup.dart';

void main() {
  group('Alert Performance Tests', () {
    setUp(() {
      TestSetup.setupTests();
    });

    testWidgets('alert display performance', (tester) async {
      await tester.pumpWidget(TestSetup.createTestApp(
        child: PerformanceTestWidget(),
      ));

      // Measure alert display time
      final stopwatch = Stopwatch()..start();
      
      await tester.tap(find.text('Show Alert'));
      await tester.pump(); // Single pump to measure initial display
      
      stopwatch.stop();
      
      // Assert reasonable display time (under 16ms for 60fps)
      expect(stopwatch.elapsedMilliseconds, lessThan(16));
      
      await tester.pumpAndSettle();
    });

    testWidgets('multiple alerts memory usage', (tester) async {
      await tester.pumpWidget(TestSetup.createTestApp(
        child: PerformanceTestWidget(),
      ));

      // Show and dismiss multiple alerts
      for (int i = 0; i < 100; i++) {
        await tester.tap(find.text('Show Alert'));
        await tester.pump();
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();
      }

      // Verify no memory leaks by checking widget tree
      expect(find.text('Success!'), findsNothing);
    });
  });
}

class PerformanceTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            CustomQuickAlert.success(
              title: 'Success!',
              message: 'This is a performance test alert.',
            );
          },
          child: Text('Show Alert'),
        ),
      ),
    );
  }
}
```

## 🎭 Mocking Custom Quick Alert

### Creating Mock Classes

```dart
// test/mocks/mock_custom_quick_alert.dart
import 'package:mockito/mockito.dart';
import 'package:custom_quick_alert/custom_quick_alert.dart';

class MockCustomQuickAlert extends Mock {
  static void success({
    String? title,
    String? message,
    VoidCallback? onConfirm,
  }) {
    _instance.success(
      title: title,
      message: message,
      onConfirm: onConfirm,
    );
  }

  static void error({
    String? title,
    String? message,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    _instance.error(
      title: title,
      message: message,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  static void loading({String? title, String? message}) {
    _instance.loading(title: title, message: message);
  }

  static void dismiss() {
    _instance.dismiss();
  }

  static bool isShowing() {
    return _instance.isShowing();
  }

  static MockCustomQuickAlert _instance = MockCustomQuickAlert();
  
  void success({String? title, String? message, VoidCallback? onConfirm});
  void error({String? title, String? message, VoidCallback? onConfirm, VoidCallback? onCancel});
  void loading({String? title, String? message});
  void dismiss();
  bool isShowing();
}
```

### Using Mocks in Tests

```dart
// test/services/auth_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../mocks/mock_custom_quick_alert.dart';

void main() {
  group('AuthService with Mock Alerts', () {
    late MockCustomQuickAlert mockAlert;
    late AuthService authService;

    setUp(() {
      mockAlert = MockCustomQuickAlert();
      authService = AuthService();
    });

    test('should call success alert on successful login', () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password123';

      // Act
      await authService.login(email, password);

      // Assert
      verify(mockAlert.loading(
        title: 'Signing In',
        message: any,
      )).called(1);
      
      verify(mockAlert.dismiss()).called(1);
      
      verify(mockAlert.success(
        title: 'Welcome Back!',
        message: any,
      )).called(1);
    });

    test('should call error alert on failed login', () async {
      // Arrange
      const email = 'invalid@example.com';
      const password = 'wrongpassword';

      // Act
      await authService.login(email, password);

      // Assert
      verify(mockAlert.loading(
        title: 'Signing In',
        message: any,
      )).called(1);
      
      verify(mockAlert.dismiss()).called(1);
      
      verify(mockAlert.error(
        title: 'Login Failed',
        message: any,
      )).called(1);
    });
  });
}
```

## 🛠️ Test Utilities

### Alert Test Utilities

```dart
// test/utils/alert_test_utils.dart
import 'package:flutter_test/flutter_test.dart';

class AlertTestUtils {
  /// Finds alert dialog in the widget tree
  static Finder findAlert() {
    return find.byType(Dialog);
  }

  /// Finds alert title by text
  static Finder findAlertTitle(String title) {
    return find.text(title);
  }

  /// Finds alert message by text
  static Finder findAlertMessage(String message) {
    return find.text(message);
  }

  /// Finds confirm button
  static Finder findConfirmButton([String? text]) {
    return find.text(text ?? 'OK');
  }

  /// Finds cancel button
  static Finder findCancelButton([String? text]) {
    return find.text(text ?? 'Cancel');
  }

  /// Verifies alert is displayed with expected content
  static void verifyAlertDisplayed(
    WidgetTester tester, {
    String? title,
    String? message,
    String? confirmText,
    String? cancelText,
  }) {
    expect(findAlert(), findsOneWidget);
    
    if (title != null) {
      expect(findAlertTitle(title), findsOneWidget);
    }
    
    if (message != null) {
      expect(findAlertMessage(message), findsOneWidget);
    }
    
    if (confirmText != null) {
      expect(findConfirmButton(confirmText), findsOneWidget);
    }
    
    if (cancelText != null) {
      expect(findCancelButton(cancelText), findsOneWidget);
    }
  }

  /// Dismisses current alert by tapping confirm button
  static Future<void> dismissAlert(WidgetTester tester, [String? buttonText]) async {
    await tester.tap(findConfirmButton(buttonText));
    await tester.pumpAndSettle();
  }

  /// Cancels current alert by tapping cancel button
  static Future<void> cancelAlert(WidgetTester tester, [String? buttonText]) async {
    await tester.tap(findCancelButton(buttonText));
    await tester.pumpAndSettle();
  }

  /// Waits for alert to appear
  static Future<void> waitForAlert(WidgetTester tester) async {
    await tester.pumpAndSettle();
    expect(findAlert(), findsOneWidget);
  }

  /// Waits for alert to disappear
  static Future<void> waitForAlertToDismiss(WidgetTester tester) async {
    await tester.pumpAndSettle();
    expect(findAlert(), findsNothing);
  }
}
```

### Form Test Utilities

```dart
// test/utils/form_test_utils.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class FormTestUtils {
  /// Fills a text field by key
  static Future<void> fillTextField(
    WidgetTester tester,
    String key,
    String value,
  ) async {
    await tester.enterText(find.byKey(Key(key)), value);
    await tester.pump();
  }

  /// Submits form by finding submit button
  static Future<void> submitForm(
    WidgetTester tester, [
    String buttonText = 'Submit',
  ]) async {
    await tester.tap(find.text(buttonText));
    await tester.pumpAndSettle();
  }

  /// Fills multiple fields at once
  static Future<void> fillForm(
    WidgetTester tester,
    Map<String, String> fieldValues,
  ) async {
    for (final entry in fieldValues.entries) {
      await fillTextField(tester, entry.key, entry.value);
    }
  }

  /// Verifies field validation error
  static void verifyFieldError(String fieldKey, String errorMessage) {
    expect(find.text(errorMessage), findsOneWidget);
  }

  /// Clears all form fields
  static Future<void> clearForm(
    WidgetTester tester,
    List<String> fieldKeys,
  ) async {
    for (final key in fieldKeys) {
      await tester.enterText(find.byKey(Key(key)), '');
    }
    await tester.pump();
  }
}
```

## 📋 Best Practices

### Test Organization

```dart
// test/integration/user_journey_test.dart
import 'package:flutter_test/flutter_test.dart';
import '../utils/alert_test_utils.dart';
import '../utils/form_test_utils.dart';
import '../test_setup.dart';

void main() {
  group('User Journey Tests', () {
    setUp(() {
      TestSetup.setupTests();
    });
    
    tearDown(() {
      TestSetup.tearDown();
    });

    group('Authentication Flow', () {
      testWidgets('successful login journey', (tester) async {
        // Arrange
        await tester.pumpWidget(TestSetup.createTestApp(child: LoginPage()));
        
        // Act & Assert
        await _performSuccessfulLogin(tester);
        await _verifyWelcomeMessage(tester);
      });

      testWidgets('failed login journey', (tester) async {
        // Arrange
        await tester.pumpWidget(TestSetup.createTestApp(child: LoginPage()));
        
        // Act & Assert
        await _performFailedLogin(tester);
        await _verifyErrorMessage(tester);
      });
    });

    group('Form Validation', () {
      testWidgets('empty form validation', (tester) async {
        await tester.pumpWidget(TestSetup.createTestApp(child: ContactForm()));
        
        await FormTestUtils.submitForm(tester);
        AlertTestUtils.verifyAlertDisplayed(
          tester,
          title: 'Form Validation Error',
          message: 'Please fill in all required fields correctly.',
        );
      });
    });
  });
}

Future<void> _performSuccessfulLogin(WidgetTester tester) async {
  await FormTestUtils.fillForm(tester, {
    'email': 'user@example.com',
    'password': 'password123',
  });
  await FormTestUtils.submitForm(tester, 'Login');
}

Future<void> _verifyWelcomeMessage(WidgetTester tester) async {
  AlertTestUtils.verifyAlertDisplayed(
    tester,
    title: 'Welcome Back!',
    message: 'You have been successfully signed in.',
  );
}

Future<void> _performFailedLogin(WidgetTester tester) async {
  await FormTestUtils.fillForm(tester, {
    'email': 'invalid@example.com',
    'password': 'wrongpassword',
  });
  await FormTestUtils.submitForm(tester, 'Login');
}

Future<void> _verifyErrorMessage(WidgetTester tester) async {
  AlertTestUtils.verifyAlertDisplayed(
    tester,
    title: 'Login Failed',
    message: 'Invalid credentials. Please try again.',
  );
}
```

### Testing Checklist

#### ✅ Unit Tests
- [ ] Alert service methods
- [ ] Business logic validation
- [ ] Error handling scenarios
- [ ] Callback functions
- [ ] State management

#### ✅ Widget Tests
- [ ] Alert display verification
- [ ] User interaction testing
- [ ] Form validation flows
- [ ] Loading state testing
- [ ] Alert dismissal

#### ✅ Integration Tests
- [ ] Complete user flows
- [ ] Cross-screen navigation
- [ ] Real API integration
- [ ] Performance testing
- [ ] Memory usage

#### ✅ Performance Tests
- [ ] Alert display speed
- [ ] Memory leak detection
- [ ] Animation performance
- [ ] Large dataset handling
- [ ] Device compatibility

### Common Testing Patterns

```dart
// Common test patterns for Custom Quick Alert

// Pattern 1: Test Alert Display
void testAlertDisplay(String scenario, VoidCallback trigger, {
  String? expectedTitle,
  String? expectedMessage,
}) {
  testWidgets('should display $scenario alert', (tester) async {
    await tester.pumpWidget(TestSetup.createTestApp(child: TestWidget()));
    
    trigger();
    await tester.pumpAndSettle();
    
    if (expectedTitle != null) {
      expect(find.text(expectedTitle), findsOneWidget);
    }
    if (expectedMessage != null) {
      expect(find.text(expectedMessage), findsOneWidget);
    }
  });
}

// Pattern 2: Test User Interaction
void testUserInteraction(String action, String buttonText, VoidCallback? expectedCallback) {
  testWidgets('should handle $action correctly', (tester) async {
    bool callbackExecuted = false;
    
    await tester.pumpWidget(TestSetup.createTestApp(child: TestWidget()));
    
    // Show alert with callback
    CustomQuickAlert.confirm(
      title: 'Test',
      message: 'Test message',
      onConfirm: () => callbackExecuted = true,
    );
    await tester.pumpAndSettle();
    
    // Tap button
    await tester.tap(find.text(buttonText));
    await tester.pumpAndSettle();
    
    if (expectedCallback != null) {
      expect(callbackExecuted, isTrue);
    }
  });
}

// Pattern 3: Test Loading States
void testLoadingState(String operation, Future<void> Function() asyncOperation) {
  testWidgets('should show loading during $operation', (tester) async {
    await tester.pumpWidget(TestSetup.createTestApp(child: TestWidget()));
    
    // Start operation
    final future = asyncOperation();
    await tester.pump(Duration(milliseconds: 100));
    
    // Verify loading is shown
    expect(find.text('Loading'), findsOneWidget);
    
    // Wait for completion
    await future;
    await tester.pumpAndSettle();
    
    // Verify loading is dismissed
    expect(find.text('Loading'), findsNothing);
  });
}
```

---

This comprehensive testing guide provides everything you need to thoroughly test applications using Custom Quick Alert, ensuring reliability and quality in your Flutter applications.
