import 'package:custom_quick_alert/custom_quick_alert.dart';

/// Helper class for managing Lottie animation assets.
class CustomQuickAlertAssetHelper {
  CustomQuickAlertAssetHelper._(); // Private constructor

  /// Base path for animation assets
  static const String _basePath =
      'packages/custom_quick_alert/assets/animations';

  /// Default Lottie assets for each alert type
  static const Map<CustomQuickAlertType, String> _defaultAssets =
      <CustomQuickAlertType, String>{
    CustomQuickAlertType.success: '$_basePath/success.json',
    CustomQuickAlertType.error: '$_basePath/error.json',
    CustomQuickAlertType.warning: '$_basePath/warning.json',
    CustomQuickAlertType.info: '$_basePath/info.json',
    CustomQuickAlertType.confirm: '$_basePath/confirm.json',
    CustomQuickAlertType.loading: '$_basePath/loading.json',
    CustomQuickAlertType.custom: '$_basePath/custom.json',
  };

  /// Gets the default Lottie asset path for the given alert type.
  static String getDefaultAsset(CustomQuickAlertType type) =>
      _defaultAssets[type] ?? _defaultAssets[CustomQuickAlertType.custom]!;

  /// Validates if an asset path exists and is valid.
  static bool isValidAssetPath(String assetPath) =>
      assetPath.isNotEmpty &&
      (assetPath.endsWith('.json') || assetPath.endsWith('.zip'));

  /// Gets all available default asset paths.
  static List<String> getAllDefaultAssets() => _defaultAssets.values.toList();

  /// Gets the asset name from a full path.
  static String getAssetName(String assetPath) =>
      assetPath.split('/').last.split('.').first;
}
