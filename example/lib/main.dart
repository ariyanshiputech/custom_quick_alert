import 'package:flutter/material.dart';
import 'package:custom_quick_alert/custom_quick_alert.dart';

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
    final successAlert = buildButton(
      onTap: () {
        CustomQuickAlert.success(
          title: 'Success',
          message: 'Transaction Completed Successfully!',
        );
      },
      title: 'Success',
      text: 'Transaction Completed Successfully!',
      leadingImage: 'assets/icons/success.png',
    );

    final errorAlert = buildButton(
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

    final warningAlert = buildButton(
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

    final infoAlert = buildButton(
      onTap: () {
        CustomQuickAlert.info(
          title: 'Info',
          message: 'Buy two, get one free',
        );
      },
      title: 'Info',
      text: 'Buy two, get one free',
      leadingImage: 'assets/icons/info.png',
    );

    final confirmAlert = buildButton(
      onTap: () {
        CustomQuickAlert.confirm(
          title: 'Confirm',
          message: 'Do you want to logout?',
          showCancel: true,
          confirmText: 'Yes',
          cancelText: 'No',
          confirmBtnColor: Colors.green,
          onConfirm: () {
              Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
          },
          onCancel: () {
              Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
          },
        );
      },
      title: 'Confirm',
      text: 'Do you want to logout?',
      leadingImage: 'assets/icons/confirm.png',
    );

    final loadingAlert = buildButton(
      onTap: () {
        // CustomQuickAlert.loading();
      },
      title: 'Loading',
      text: 'Fetching your data',
      leadingImage: 'assets/icons/loading.png',
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('🚀 Custom Quick Alert'),
      ),
      body: ListView(
        children: [
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
          child: Image.asset(leadingImage, fit: BoxFit.cover)
        ),
        title: Text(title),
        subtitle: Text(text),
        trailing: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
