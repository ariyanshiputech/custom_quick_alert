import 'dart:async';

import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:custom_quick_alert_example/alert_example_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());

  // Initialize CustomQuickAlert with the navigator key
  CustomQuickAlert.initialize(navigatorKey);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('🚀 Custom Quick Alert'),
      ),
      body: Column(
        children: <Widget>[
          // Header section with navigation to examples
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Colors.blue.shade600, Colors.blue.shade800],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: <Widget>[
                const Icon(Icons.lightbulb, color: Colors.white, size: 48),
                const SizedBox(height: 12),
                const Text(
                  'Comprehensive Examples',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Explore basic, advanced, and real-world examples',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const AlertExamplesPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade800,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'View All Examples',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Quick demo section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: <Widget>[
                const Text(
                  'Quick Demo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                buildButton(
                  onTap: () {
                    CustomQuickAlert.success(
                      title: 'Success',
                      message: 'Transaction Completed Successfully!',
                    );
                  },
                  title: 'Success',
                  text: 'Enhanced Success with Gradient',
                  leadingImage: 'assets/icons/success.png',
                ),
                const SizedBox(height: 12),
                buildButton(
                  onTap: () {
                    CustomQuickAlert.error(
                      title: 'Oops...',
                      message: 'Sorry, something went wrong',
                    );
                  },
                  title: 'Error',
                  text: 'Professional Error Dialog',
                  leadingImage: 'assets/icons/error.png',
                ),
                const SizedBox(height: 12),
                buildButton(
                  onTap: () {
                    CustomQuickAlert.warning(
                      title: 'Warning',
                      message: 'You just broke protocol',
                    );
                  },
                  title: 'Warning',
                  text: 'Modern Warning Style',
                  leadingImage: 'assets/icons/warning.png',
                ),
                const SizedBox(height: 12),
                buildButton(
                  onTap: () {
                    CustomQuickAlert.info(
                      title: 'Info',
                      message: 'Buy two, get one free',
                    );
                  },
                  title: 'Info',
                  text: 'Animated Info with Style',
                  leadingImage: 'assets/icons/info.png',
                ),
                const SizedBox(height: 12),
                buildButton(
                  onTap: () {
                    CustomQuickAlert.confirm(
                      title: 'Confirm',
                      message: 'Do you want to logout?',
                      onConfirm: () {
                        if (kDebugMode) {
                          debugPrint('User confirmed logout');
                        }
                      },
                      onCancel: () {
                        if (kDebugMode) {
                          debugPrint('User cancelled logout');
                        }
                      },
                    );
                  },
                  title: 'Confirm',
                  text: 'Do you want to logout?',
                  leadingImage: 'assets/icons/confirm.png',
                ),
                const SizedBox(height: 12),
                buildButton(
                  onTap: () {
                    CustomQuickAlert.custom(
                      title: 'Custom Alert',
                      message: 'This is a custom alert with beautiful styling.',
                      animationType: CustomQuickAlertAnimationType.scale,
                      position: CustomQuickAlertPosition.center,
                      backgroundColor: Colors.deepPurple,
                      titleColor: Colors.white,
                      messageColor: Colors.white70,
                      borderRadius: 20,
                      confirmText: 'Awesome!',
                      confirmBtnColor: Colors.pinkAccent,
                      onConfirm: () {
                        if (kDebugMode) {
                          debugPrint('Custom alert confirmed');
                        }
                      },
                    );
                  },
                  title: 'Custom',
                  text: 'This is a custom alert dialog',
                  leadingImage: 'assets/icons/custom.png',
                ),
                const SizedBox(height: 12),
                buildButton(
                  onTap: () async {
                    unawaited(CustomQuickAlert.loading());
                    await Future<void>.delayed(const Duration(seconds: 3), () {
                      CustomQuickAlert.dismiss(); // Dismiss loading
                      CustomQuickAlert.success(
                        title: 'Done!',
                        message: 'Your request has been processed successfully.',
                      );
                    });
                  
                  },
                  title: 'Loading',
                  text: 'Fetching your data',
                  leadingImage: 'assets/icons/loading.png',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Show demo sequence',
        onPressed: _showDemoSequence,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  Future<void> _showDemoSequence() async {
    // Show success
    await CustomQuickAlert.success(
      title: 'Step 1: Success',
      message: 'This is a success alert with enhanced styling.',
      autoCloseDuration: const Duration(seconds: 2),
      showConfirm: false,
    );

    await Future<void>.delayed(const Duration(seconds: 3));

    // Show warning
    await CustomQuickAlert.warning(
      title: 'Step 2: Warning',
      message: 'This is a warning alert with modern design.',
      autoCloseDuration: const Duration(seconds: 2),
      showConfirm: false,
    );

    await Future<void>.delayed(const Duration(seconds: 3));

    // Show info
    await CustomQuickAlert.info(
      title: 'Step 3: Information',
      message: 'This is an info alert with smooth animations.',
      autoCloseDuration: const Duration(seconds: 2),
      showConfirm: false,
    );

    await Future<void>.delayed(const Duration(seconds: 3));

    // Show final success
    await CustomQuickAlert.success(
      title: 'Demo Complete!',
      message: "You've seen the power of Custom Quick Alert.",
      confirmText: 'Awesome!',
    );
  }

  Card buildButton({
    required VoidCallback onTap,
    required String title,
    required String text,
    required String leadingImage,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          backgroundImage: AssetImage(leadingImage),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        subtitle: Text(text),
        trailing: const Icon(
          Icons.keyboard_arrow_right_rounded,
        ),
      ),
    );
  }
}
