import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomQuickAlertAssets {
  static const String _packageName = 'custom_quick_alert';

  /// Load an Image widget from the package.
  static Widget image(
    String assetName, {
    Key? key,
    AssetBundle? bundle,
    ImageErrorWidgetBuilder? errorBuilder,
    ImageFrameBuilder? frameBuilder,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
    String? semanticLabel,
    bool excludeFromSemantics = false,
  }) {
    return Image.asset(
      assetName,
      key: key,
      bundle: bundle,
      package: _packageName,
      errorBuilder: errorBuilder,
      frameBuilder: frameBuilder,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }

  /// Load a Lottie animation widget from the package.
  static Widget lottie(
    String assetName, {
    Key? key,
    bool animate = true,
    bool repeat = true,
    bool reverse = false,
    double? width,
    double? height,
    BoxFit? fit,
    Alignment alignment = Alignment.center,
    AssetBundle? bundle,
    bool addRepaintBoundary = true,
    void Function(LottieComposition)? onLoaded,
    LottieDelegates? delegates,
    AnimationController? controller,
  }) {
    return Lottie.asset(
      assetName,
      key: key,
      package: _packageName,
      animate: animate,
      repeat: repeat,
      reverse: reverse,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      bundle: bundle,
      addRepaintBoundary: addRepaintBoundary,
      onLoaded: onLoaded,
      delegates: delegates,
      controller: controller,
    );
  }
}
