import 'dart:async';

import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Mock for callbacks
class MockVoidCallback extends Mock {
  void call();
}

void main() {
  late Widget testApp;

  setUp(() {
    testApp = MaterialApp(
      home: const Scaffold(body: Center(child: Text('Test App'))),
      navigatorKey: navigatorKey,
    );

    // Initialize CustomQuickAlert with the navigator key
    CustomQuickAlert.initialize(navigatorKey);
  });

  group('CustomQuickAlert Tests', () {
    testWidgets('shows success alert with title and message',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.success(
          title: 'Success!',
          message: 'This is a success message.',
          barrierDismissible: true,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Success!'), findsOneWidget);
      expect(find.text('This is a success message.'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(find.text('Success!'), findsNothing);
    });

    testWidgets('shows error alert with custom button text',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.error(
          title: 'Error!',
          message: 'Something went wrong.',
          barrierDismissible: true,
          confirmText: 'Got it',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Error!'), findsOneWidget);
      expect(find.text('Something went wrong.'), findsOneWidget);
      expect(find.text('Got it'), findsOneWidget);

      await tester.tap(find.text('Got it'));
      await tester.pumpAndSettle();
    });

    testWidgets('shows confirm alert with both buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);
      final MockVoidCallback mockConfirm = MockVoidCallback();
      final MockVoidCallback mockCancel = MockVoidCallback();
      when(mockConfirm.call).thenReturn(null);
      when(mockCancel.call).thenReturn(null);

      unawaited(
        CustomQuickAlert.confirm(
          title: 'Confirmation',
          message: 'Are you sure?',
          onConfirm: mockConfirm.call,
          onCancel: mockCancel.call,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Confirmation'), findsOneWidget);
      expect(find.text('Are you sure?'), findsOneWidget);
      expect(find.text('Yes'), findsOneWidget);
      expect(find.text('No'), findsOneWidget);

      await tester.tap(find.text('No'));
      await tester.pumpAndSettle();

      verify(mockCancel.call).called(1);
      expect(find.text('Confirmation'), findsNothing);
    });

    testWidgets('auto closes after duration', (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.info(
          title: 'Auto-closing',
          barrierDismissible: true,
          autoCloseDuration: const Duration(milliseconds: 500),
        ),
      );
      await tester.pump();

      expect(find.text('Auto-closing'), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();

      expect(find.text('Auto-closing'), findsNothing);
    });

    testWidgets('shows warning alert', (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.warning(
          title: 'Warning!',
          message: 'Please check your input.',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Warning!'), findsOneWidget);
      expect(find.text('Please check your input.'), findsOneWidget);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('shows info alert with position', (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.info(
          title: 'Information',
          message: 'Here is some info.',
          position: CustomQuickAlertPosition.center,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Information'), findsOneWidget);
      expect(find.text('Here is some info.'), findsOneWidget);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('shows loading alert', (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(CustomQuickAlert.loading(
        title: 'Loading...',
        message: 'Please wait.',
      ));
      await tester.pump();

      expect(find.text('Loading...'), findsOneWidget);
      expect(find.text('Please wait.'), findsOneWidget);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();

      expect(find.text('Loading...'), findsNothing);
    });

    testWidgets('shows custom alert', (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.custom(
          title: 'Custom Alert',
          message: 'This is a custom alert.',
          lottieAsset: 'assets/animations/custom.json',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Custom Alert'), findsOneWidget);
      expect(find.text('This is a custom alert.'), findsOneWidget);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('dismiss() closes dialog programmatically',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(CustomQuickAlert.info(title: 'Info Dialog'));
      await tester.pumpAndSettle();
      expect(find.text('Info Dialog'), findsOneWidget);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();

      expect(find.text('Info Dialog'), findsNothing);
    });

    testWidgets('respects animation type', (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.info(
          title: 'Animated Alert',
          animationType: CustomQuickAlertAnimationType.scale,
        ),
      );
      await tester.pump();

      expect(find.text('Animated Alert'), findsOneWidget);

      await tester.pumpAndSettle();
      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('respects barrier dismissible setting',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.warning(
          title: 'Not Dismissible',
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Not Dismissible'), findsOneWidget);

      // Try to tap outside - dialog should remain
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();

      expect(find.text('Not Dismissible'), findsOneWidget);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('handles custom colors', (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.success(
          title: 'Custom Colors',
          message: 'Testing colors.',
          backgroundColor: Colors.blue,
          titleColor: Colors.white,
          messageColor: Colors.white70,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Custom Colors'), findsOneWidget);
      expect(find.text('Testing colors.'), findsOneWidget);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });
  });
}
