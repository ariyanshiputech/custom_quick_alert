import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Position and Animation Tests', () {
    late GlobalKey<NavigatorState> navigatorKey;

    setUp(() {
      navigatorKey = GlobalKey<NavigatorState>();
      CustomQuickAlert.initialize(navigatorKey);
    });

    testWidgets('Success alert displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.success(
                  title: 'Success',
                  message: 'Test successful',
                );
              },
              child: const Text('Show Alert'),
            ),
          ),
        ),
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Success'), findsOneWidget);
      expect(find.text('Test successful'), findsOneWidget);
    });

    testWidgets('Error alert displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.error(
                  title: 'Error',
                  message: 'Test error',
                );
              },
              child: const Text('Show Alert'),
            ),
          ),
        ),
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Error'), findsOneWidget);
      expect(find.text('Test error'), findsOneWidget);
    });

    testWidgets('Warning alert displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.warning(
                  title: 'Warning',
                  message: 'Test warning',
                );
              },
              child: const Text('Show Alert'),
            ),
          ),
        ),
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Warning'), findsOneWidget);
      expect(find.text('Test warning'), findsOneWidget);
    });

    testWidgets('Info alert displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.info(
                  title: 'Info',
                  message: 'Test info',
                );
              },
              child: const Text('Show Alert'),
            ),
          ),
        ),
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Info'), findsOneWidget);
      expect(find.text('Test info'), findsOneWidget);
    });

    testWidgets('Confirm alert displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.confirm(
                  title: 'Confirm',
                  message: 'Test confirm',
                );
              },
              child: const Text('Show Alert'),
            ),
          ),
        ),
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Confirm'), findsOneWidget);
      expect(find.text('Test confirm'), findsOneWidget);
    });

    testWidgets('Loading alert displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.loading(
                  title: 'Loading',
                  message: 'Test loading',
                );
              },
              child: const Text('Show Alert'),
            ),
          ),
        ),
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Loading'), findsOneWidget);
      expect(find.text('Test loading'), findsOneWidget);
    });

    testWidgets('Custom alert displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.custom(
                  title: 'Custom',
                  message: 'Test custom',
                  lottieAsset: 'assets/animations/custom.json',
                );
              },
              child: const Text('Show Alert'),
            ),
          ),
        ),
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Custom'), findsOneWidget);
      expect(find.text('Test custom'), findsOneWidget);
    });

    testWidgets('Position parameter works for top',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.success(
                  title: 'Top Position',
                  message: 'This is at top',
                  position: CustomQuickAlertPosition.top,
                );
              },
              child: const Text('Show Alert'),
            ),
          ),
        ),
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Top Position'), findsOneWidget);
      expect(find.text('This is at top'), findsOneWidget);
    });

    testWidgets('Position parameter works for bottom',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.success(
                  title: 'Bottom Position',
                  message: 'This is at bottom',
                  position: CustomQuickAlertPosition.bottom,
                );
              },
              child: const Text('Show Alert'),
            ),
          ),
        ),
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Bottom Position'), findsOneWidget);
      expect(find.text('This is at bottom'), findsOneWidget);
    });
  });
}
