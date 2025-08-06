import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Animation Curve Fix Tests', () {
    testWidgets('Scale animation should not throw assertion error', (WidgetTester tester) async {
      final navigatorKey = GlobalKey<NavigatorState>();
      CustomQuickAlert.initialize(navigatorKey);
      
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigatorKey,
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomQuickAlert.success(
                      title: 'Test',
                      message: 'This should not cause an assertion error',
                      animationType: CustomQuickAlertAnimationType.scale,
                      showConfirm: false,
                      autoCloseDuration: const Duration(milliseconds: 100),
                    );
                  },
                  child: const Text('Test Button'),
                );
              },
            ),
          ),
        ),
      );
      
      // Trigger the alert
      await tester.tap(find.text('Test Button'));
      await tester.pumpAndSettle();
      
      // If we get here without assertion errors, the fix is working
      expect(tester.takeException(), isNull);
    });

    testWidgets('Slide animation should not throw assertion error', (WidgetTester tester) async {
      final navigatorKey = GlobalKey<NavigatorState>();
      CustomQuickAlert.initialize(navigatorKey);
      
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigatorKey,
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomQuickAlert.info(
                      title: 'Test',
                      message: 'This should not cause an assertion error',
                      animationType: CustomQuickAlertAnimationType.slideInDown,
                      showConfirm: false,
                      autoCloseDuration: const Duration(milliseconds: 100),
                    );
                  },
                  child: const Text('Test Button'),
                );
              },
            ),
          ),
        ),
      );
      
      // Trigger the alert
      await tester.tap(find.text('Test Button'));
      await tester.pumpAndSettle();
      
      // If we get here without assertion errors, the fix is working
      expect(tester.takeException(), isNull);
    });

    testWidgets('Rotate animation should not throw assertion error', (WidgetTester tester) async {
      final navigatorKey = GlobalKey<NavigatorState>();
      CustomQuickAlert.initialize(navigatorKey);
      
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigatorKey,
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomQuickAlert.warning(
                      title: 'Test',
                      message: 'This should not cause an assertion error',
                      animationType: CustomQuickAlertAnimationType.rotate,
                      showConfirm: false,
                      autoCloseDuration: const Duration(milliseconds: 100),
                    );
                  },
                  child: const Text('Test Button'),
                );
              },
            ),
          ),
        ),
      );
      
      // Trigger the alert
      await tester.tap(find.text('Test Button'));
      await tester.pumpAndSettle();
      
      // If we get here without assertion errors, the fix is working
      expect(tester.takeException(), isNull);
    });
  });
}
