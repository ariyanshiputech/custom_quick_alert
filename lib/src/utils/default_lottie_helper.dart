import '../enums/custom_quick_alert_type.dart';

String getDefaultLottieForType(CustomQuickAlertType type) {
  switch (type) {
    case CustomQuickAlertType.success:
      return 'assets/animations/success.json';
    case CustomQuickAlertType.error:
      return 'assets/animations/error.json';
    case CustomQuickAlertType.warning:
      return 'assets/animations/warning.json';
    case CustomQuickAlertType.info:
      return 'assets/animations/info.json';
    case CustomQuickAlertType.confirm:
      return 'assets/animations/confirm.json';
    case CustomQuickAlertType.loading:
      return 'assets/animations/loading.json';
    case CustomQuickAlertType.custom:
      return 'assets/animations/custom.json'; // Or a default Lottie for custom type if needed
  }
}
