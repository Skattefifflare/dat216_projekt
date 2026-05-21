import 'package:flutter/material.dart';
import 'package:dat216_projekt/widgets/overlay/overlay_base.dart';

class OverlayController {
  static OverlayEntry? _currentOverlay;

  static void open(
    BuildContext context, {
    required Widget child,
    required width,
  }) {
    if (_currentOverlay != null) close();

    _currentOverlay = OverlayEntry(
      builder: (context) {
        return OverlayBase(onClose: close, width: width, child: child);
      },
    );

    Overlay.of(context).insert(_currentOverlay!);
  }

  static void close() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }
}
