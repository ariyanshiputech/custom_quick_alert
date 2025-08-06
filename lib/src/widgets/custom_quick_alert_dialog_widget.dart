import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// The main alert dialog widget that displays the alert content.
class CustomQuickAlertDialogWidget extends StatelessWidget {
  /// Creates a CustomQuickAlertDialogWidget.
  const CustomQuickAlertDialogWidget({
    required this.config,
    required this.lottieAsset,
    super.key,
  });

  /// The configuration for this alert
  final CustomQuickAlertConfig config;

  /// The Lottie asset path to display
  final String lottieAsset;

  @override
  Widget build(BuildContext context) => Container(
        margin: CustomQuickAlertPositionHelper.getMargin(config.position),
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: config.width,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              minWidth: 280,
            ),
            decoration: BoxDecoration(
              color: config.backgroundColor,
              borderRadius: BorderRadius.circular(config.borderRadius),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: config.padding ?? const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Lottie Animation
                  if (lottieAsset.isNotEmpty) _buildLottieAnimation(),

                  // Custom Content (if provided)
                  if (config.customContent != null) config.customContent!,

                  // Title
                  if (config.title != null) _buildTitle(),

                  // Message
                  if (config.message != null) _buildMessage(),

                  // Spacing before buttons
                  if (_shouldShowButtons()) const SizedBox(height: 24),

                  // Buttons
                  if (_shouldShowButtons()) _buildButtons(),
                ],
              ),
            ),
          ),
        ),
      );

  /// Builds the Lottie animation widget
  Widget _buildLottieAnimation() => Container(
        height: 80,
        width: 80,
        margin: const EdgeInsets.only(bottom: 16),
        child: Lottie.asset(
          lottieAsset,
          repeat: config.lottieRepeat,
          animate: true,
          fit: BoxFit.contain,
        ),
      );

  /// Builds the title widget
  Widget _buildTitle() => Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Text(
          config.title!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: config.titleColor,
          ),
          textAlign: TextAlign.center,
        ),
      );

  /// Builds the message widget
  Widget _buildMessage() => Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Text(
          config.message!,
          style: TextStyle(
            fontSize: 16,
            color: config.messageColor,
          ),
          textAlign: TextAlign.center,
        ),
      );

  /// Builds the action buttons
  Widget _buildButtons() => Builder(
        builder: (BuildContext context) {
          final List<Widget> buttons = <Widget>[];

          if (config.showCancel) {
            buttons.add(
              Expanded(
                child: CustomQuickAlertButton(
                  text: config.cancelText,
                  color: config.cancelBtnColor,
                  textColor: config.cancelTextColor,
                  onPressed: () {
                    config.onCancel?.call();
                    Navigator.of(context).pop();
                  },
                  isOutlined: true,
                ),
              ),
            );
          }

          if (config.showCancel && config.showConfirm) {
            buttons.add(const SizedBox(width: 12));
          }

          if (config.showConfirm) {
            buttons.add(
              Expanded(
                child: CustomQuickAlertButton(
                  text: config.confirmText,
                  color: config.confirmBtnColor,
                  textColor: config.confirmTextColor,
                  onPressed: () {
                    config.onConfirm?.call();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            );
          }

          return Row(children: buttons);
        },
      );

  /// Determines if buttons should be shown
  bool _shouldShowButtons() => config.showCancel || config.showConfirm;
}
