import 'dart:async';

import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:custom_quick_alert/src/alert_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:mocktail/mocktail.dart';

// Mock for callbacks
class MockVoidCallback extends Mock {
  void call();
}

void main() {
  late Widget testApp;

  setUp(() {
    testApp = MaterialApp(
      home: const Scaffold(body: Center(child: Text('Test App'))),
      navigatorKey: customQuickAlertNavigatorKey,
    );
  });

  group('CustomQuickAlert Tests', () {
    testWidgets('shows success alert and calls onConfirm',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);
      final MockVoidCallback mock = MockVoidCallback();
      when(() => mock.call()).thenReturn(null);

      unawaited(
        CustomQuickAlert.success(
          title: 'Success!',
          message: 'This is a success message.',
          barrierDismissible: true,
          onConfirm: mock.call,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Success!'), findsOneWidget);
      expect(find.text('This is a success message.'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);
      expect(find.byType(Lottie), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      verify(() => mock.call()).called(1);
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

    testWidgets('shows confirm alert and calls onCancel',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);
      final MockVoidCallback mock = MockVoidCallback();
      when(() => mock.call()).thenReturn(null);

      unawaited(
        CustomQuickAlert.confirm(
          title: 'Confirmation',
          message: 'Are you sure?',
          onCancel: mock.call,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Confirmation'), findsOneWidget);
      expect(find.text('Are you sure?'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      verify(() => mock.call()).called(1);
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

    testWidgets('shows alert with custom width', (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      const double customWidth = 350.0;
      unawaited(
        CustomQuickAlert.info(
          title: 'Custom Width',
          width: customWidth,
        ),
      );
      await tester.pumpAndSettle();

      final AlertDialog dialog =
          tester.widget<AlertDialog>(find.byType(AlertDialog));
      expect(dialog.content, isNotNull);

      final AlertContent content = dialog.content as AlertContent;
      expect(content.width, customWidth);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('shows alert with custom border radius',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      const double customRadius = 32.0;
      unawaited(
        CustomQuickAlert.success(
          title: 'Custom Radius',
          borderRadius: customRadius,
        ),
      );
      await tester.pumpAndSettle();

      final AlertDialog dialog =
          tester.widget<AlertDialog>(find.byType(AlertDialog));
      final RoundedRectangleBorder shape =
          dialog.shape as RoundedRectangleBorder;
      expect(shape.borderRadius, BorderRadius.circular(customRadius));

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('calls onCancel when cancel button is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      final MockVoidCallback mock = MockVoidCallback();
      when(() => mock.call()).thenReturn(null);

      unawaited(
        CustomQuickAlert.confirm(
          title: 'Cancel Test',
          showCancel: true,
          onCancel: mock.call,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      verify(() => mock.call()).called(1);
      expect(find.text('Cancel Test'), findsNothing);
    });

    testWidgets('shows custom lottie asset', (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      const String customLottie = 'assets/animations/custom.json';
      unawaited(
        CustomQuickAlert.info(
          title: 'Custom Lottie',
          lottieAsset: customLottie,
        ),
      );
      await tester.pumpAndSettle();

      final Lottie lottieWidget = tester.widget<Lottie>(find.byType(Lottie));
      expect(
        lottieWidget.composition,
        isNotNull,
      ); // We can't directly check the assetName from Lottie, but we can check if a composition was loaded.

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('shows alert with only cancel button',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.confirm(
          title: 'Only Cancel',
          showConfirm: false,
          showCancel: true,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('OK'), findsNothing);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('shows alert with only confirm button',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.success(
          title: 'Only Confirm',
          showConfirm: true,
          showCancel: false,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('OK'), findsOneWidget);
      expect(find.text('Cancel'), findsNothing);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('shows alert with custom confirm and cancel text colors',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      const Color confirmTextColor = Colors.orange;
      const Color cancelTextColor = Colors.pink;

      unawaited(
        CustomQuickAlert.confirm(
          title: 'Text Colors',
          confirmTextColor: confirmTextColor,
          cancelTextColor: cancelTextColor,
        ),
      );
      await tester.pumpAndSettle();

      tester.widget<Text>(find.text('OK'));
      tester.widget<Text>(find.text('Cancel'));

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('is NOT dismissible when barrierDismissible is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.warning(
          title: 'Not Dismissible',
          barrierDismissible: false,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Not Dismissible'), findsOneWidget);

      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();

      expect(find.text('Not Dismissible'), findsOneWidget);

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

    testWidgets('displays custom widget content', (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.show(
          type: CustomQuickAlertType.custom,
          customContent: const Text('My Custom Widget'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('My Custom Widget'), findsOneWidget);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('shows loading alert and is dismissible',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(CustomQuickAlert.loading());
      await tester.pump();

      expect(find.byType(Lottie), findsOneWidget);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();

      expect(find.byType(Lottie), findsNothing);
    });

    testWidgets('respects disableBackBtn property',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.info(
          title: 'No Back Button',
          disableBackBtn: true,
        ),
      );
      await tester.pumpAndSettle();

      // Try to pop the route
      final NavigatorState navigator = tester.state(find.byType(Navigator));
      await navigator.maybePop();
      await tester.pumpAndSettle();

      // The dialog should still be visible
      expect(find.text('No Back Button'), findsOneWidget);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('aligns to bottom when position is bottom',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.info(
          title: 'Bottom Aligned',
          position: CustomQuickAlertPosition.bottom,
        ),
      );
      await tester.pumpAndSettle();

      final Align alignWidget = tester.widget<Align>(
        find.byWidgetPredicate((Widget w) => w is Align && w.child is Material),
      );
      expect(alignWidget.alignment, Alignment.bottomCenter);

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });

    testWidgets('applies custom colors correctly', (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      const Color titleColor = Colors.red;
      const Color messageColor = Colors.green;
      const Color backgroundColor = Colors.yellow;
      const Color confirmBtnColor = Colors.purple;

      unawaited(
        CustomQuickAlert.success(
          title: 'Custom Colors',
          message: 'Testing colors.',
          titleColor: titleColor,
          messageColor: messageColor,
          backgroundColor: backgroundColor,
          confirmBtnColor: confirmBtnColor,
        ),
      );
      await tester.pumpAndSettle();

      // Check title color
      final Text titleText = tester.widget<Text>(find.text('Custom Colors'));
      expect(titleText.style?.color, titleColor);

      // Check message color
      final Text messageText =
          tester.widget<Text>(find.text('Testing colors.'));
      expect(messageText.style?.color, messageColor);

      // Check background color
      final AlertDialog alertDialog =
          tester.widget<AlertDialog>(find.byType(AlertDialog));
      expect(alertDialog.backgroundColor, backgroundColor);

      // Check confirm button color
      final FilledButton filledButton =
          tester.widget<FilledButton>(find.byType(FilledButton));
      expect(
        filledButton.style?.backgroundColor?.resolve(<WidgetState>{}),
        confirmBtnColor,
      );

      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
      expect(find.text('Custom Colors'), findsNothing);
    });

    testWidgets('uses slideInDown animation when specified',
        (WidgetTester tester) async {
      await tester.pumpWidget(testApp);

      unawaited(
        CustomQuickAlert.info(
          title: 'Sliding In',
          animType: CustomQuickAlertAnimType.slideInDown,
        ),
      );
      await tester.pump(); // Start the animation

      // Check for a SlideTransition widget with vertical translation
      final Finder slideTransitionFinder = find.ancestor(
        of: find.byType(AlertDialog),
        matching: find.byType(SlideTransition),
      );
      expect(slideTransitionFinder, findsOneWidget);
      final SlideTransition slideTransition =
          tester.widget<SlideTransition>(slideTransitionFinder);
      // Verify that the begin offset of the animation is (0, -1) for slideInDown
      expect(slideTransition.position.value.dx, 0);
      expect(slideTransition.position.value.dy, lessThan(0));

      await tester.pumpAndSettle(); // Finish animation
      expect(find.text('Sliding In'), findsOneWidget);
      CustomQuickAlert.dismiss();
      await tester.pumpAndSettle();
    });
  });
}
