import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = customQuickAlertNavigatorKey;

void main() {
  runApp(const MyApp());
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          centerTitle: true,
          elevation: 2,
        ),
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
    final Card successAlert = buildButton(
      onTap: () {
        CustomQuickAlert.success(
          title: 'Success',
          message: 'Transaction Completed Successfully!',
          onConfirm: () {},
        );
      },
      title: 'Success',
      text: 'Transaction Completed Successfully!',
      leadingImage: 'assets/icons/success.png',
    );

    final Card errorAlert = buildButton(
      onTap: () {
        CustomQuickAlert.error(
          title: 'Oops...',
          message: 'Sorry, something went wrong',
        );
      },
      title: 'Error',
      text: 'Sorry, something went wrong',
      leadingImage: 'assets/icons/error.png',
    );

    final Card warningAlert = buildButton(
      onTap: () {
        CustomQuickAlert.warning(
          title: 'Warning',
          message: 'You just broke protocol',
        );
      },
      title: 'Warning',
      text: 'You just broke protocol',
      leadingImage: 'assets/icons/warning.png',
    );

    final Card infoAlert = buildButton(
      onTap: () {
        CustomQuickAlert.info(title: 'Info', message: 'Buy two, get one free');
      },
      title: 'Info',
      text: 'Buy two, get one free',
      leadingImage: 'assets/icons/info.png',
    );

    final Card confirmAlert = buildButton(
      onTap: () {
        CustomQuickAlert.confirm(
          title: 'Confirm',
          message: 'Do you want to logout?',
          confirmText: 'Yes',
          cancelText: 'No',
          confirmBtnColor: Colors
              .green, // This parameter is not defined in CustomQuickAlert.confirm
          onConfirm: () {
            // You can add your own logic here for the confirm action.
          },
          onCancel: () {
            // You can add your own logic here for the cancel action.
          },
        );
      },
      title: 'Confirm',
      text: 'Do you want to logout?',
      leadingImage: 'assets/icons/confirm.png',
    );
    final Card customAlert = buildButton(
      onTap: () {
        CustomQuickAlert.show(
          type: CustomQuickAlertType.custom,
          title: 'Custom Alert',
          message: 'This is a custom alert with your own widget.',
          lottieAsset: 'assets/animations/custom.json',
          confirmText: 'Confirm',
          cancelText: 'Cancel',
          confirmBtnColor: Colors.blue,
          cancelBtnColor: Colors.red,
          onConfirm: () {
            // You can add your own logic here for the confirm action.
          },
          onCancel: () {
            // You can add your own logic here for the cancel action.
          },
          position: CustomQuickAlertPosition.center,
          animType: CustomQuickAlertAnimType.scale,
          customContent: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.star, color: Colors.amber, size: 48),
                const SizedBox(height: 12),
                Text(
                  'This is a custom widget inside the alert!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
      title: 'Custom',
      text: 'This is a custom alert dialog',
      leadingImage: 'assets/icons/custom.png',
    );

    final Card loadingAlert = buildButton(
      onTap: () {
        CustomQuickAlert.loading();
      },
      title: 'Loading',
      text: 'Fetching your data',
      leadingImage: 'assets/icons/loading.png',
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('🚀 Custom Quick Alert'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Show next alert',
        onPressed: () {},
        child: const Icon(Icons.next_plan),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          successAlert,
          const SizedBox(height: 20),
          errorAlert,
          const SizedBox(height: 20),
          warningAlert,
          const SizedBox(height: 20),
          infoAlert,
          const SizedBox(height: 20),
          confirmAlert,
          const SizedBox(height: 20),
          customAlert,
          const SizedBox(height: 20),
          loadingAlert,
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Card buildButton({
    required VoidCallback onTap,
    required String title,
    required String text,
    required String leadingImage,
  }) {
    return Card(
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 1,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Image.asset(leadingImage, fit: BoxFit.cover),
        ),
        title: Text(title),
        subtitle: Text(text),
        trailing: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
