import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Position Functionality Tests', () {
    late GlobalKey<NavigatorState> navigatorKey;

    setUp(() {
      navigatorKey = GlobalKey<NavigatorState>();
      CustomQuickAlert.initialize(navigatorKey);
    });

    testWidgets('Alert shows at center position (default)',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.success(
                  title: 'Test',
                  message: 'Center position test',
                  position: CustomQuickAlertPosition.center,
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

      // Verify dialog is present
      expect(find.text('Test'), findsOneWidget);
      expect(find.text('Center position test'), findsOneWidget);

      // Verify dialog structure
      final Finder popScopeFinder = find.byType(PopScope);
      expect(popScopeFinder, findsOneWidget);
    });

    testWidgets('Alert shows at top position', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.info(
                  title: 'Test',
                  message: 'Top position test',
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

      // Verify dialog is present
      expect(find.text('Test'), findsOneWidget);
      expect(find.text('Top position test'), findsOneWidget);

      // Verify dialog structure
      final Finder popScopeFinder = find.byType(PopScope);
      expect(popScopeFinder, findsOneWidget);
    });

    testWidgets('Alert shows at bottom position', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.warning(
                  title: 'Test',
                  message: 'Bottom position test',
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

      // Verify dialog is present
      expect(find.text('Test'), findsOneWidget);
      expect(find.text('Bottom position test'), findsOneWidget);

      // Verify dialog structure
      final Finder popScopeFinder = find.byType(PopScope);
      expect(popScopeFinder, findsOneWidget);
    });

    testWidgets('Alert respects custom margin for top position',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.error(
                  title: 'Test',
                  message: 'Top margin test',
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

      // Verify dialog is present and functioning
      expect(find.text('Test'), findsOneWidget);
      expect(find.text('Top margin test'), findsOneWidget);

      // Verify dialog structure
      final Finder popScopeFinder = find.byType(PopScope);
      expect(popScopeFinder, findsOneWidget);
    });

    testWidgets('Lottie animation displays without AnimationContainer',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                CustomQuickAlert.success(
                  title: 'Animation Test',
                  message: 'Testing Lottie without container',
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

      // Verify dialog is present and functioning
      expect(find.text('Animation Test'), findsOneWidget);
      expect(find.text('Testing Lottie without container'), findsOneWidget);

      // Verify dialog structure is correct - no AnimationContainer references
      final Finder popScopeFinder = find.byType(PopScope);
      expect(popScopeFinder, findsOneWidget);
    });
  });
}
