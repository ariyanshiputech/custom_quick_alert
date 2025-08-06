import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PositionTestApp());
}

class PositionTestApp extends StatelessWidget {
  const PositionTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    CustomQuickAlert.initialize(navigatorKey);

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Position Test',
      home: const PositionTestScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PositionTestScreen extends StatelessWidget {
  const PositionTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Position Test'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                CustomQuickAlert.success(
                  title: 'Top Position',
                  message: 'This should appear at the top',
                  position: CustomQuickAlertPosition.top,
                );
              },
              child: const Text('Show Top Alert'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                CustomQuickAlert.info(
                  title: 'Center Position',
                  message: 'This should appear at the center',
                  position: CustomQuickAlertPosition.center,
                );
              },
              child: const Text('Show Center Alert'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                CustomQuickAlert.warning(
                  title: 'Bottom Position',
                  message: 'This should appear at the bottom',
                  position: CustomQuickAlertPosition.bottom,
                );
              },
              child: const Text('Show Bottom Alert'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                CustomQuickAlert.error(
                  title: 'No Container',
                  message:
                      'Testing clean Lottie animation without AnimationContainer',
                );
              },
              child: const Text('Show Animation Test'),
            ),
          ],
        ),
      ),
    );
  }
}
