import '../enums/custom_quick_alert_position.dart';
import 'package:flutter/material.dart';

Alignment getAlignment(CustomQuickAlertPosition position) {
  switch (position) {
    case CustomQuickAlertPosition.top:
      return Alignment.topCenter;
    case CustomQuickAlertPosition.center:
      return Alignment.center;
    case CustomQuickAlertPosition.bottom:
      return Alignment.bottomCenter;
  }
}
