import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class OverlayBase extends StatefulWidget {
  final Widget child;
  final VoidCallback onClose;
  final double width;

  const OverlayBase({
    super.key,
    required this.width,
    required this.child,
    required this.onClose,
  });

  @override
  State<OverlayBase> createState() => _OverlayBaseState();
}

class _OverlayBaseState extends State<OverlayBase> {
  bool _visible = false;

  // Schedules animation immediately after creation
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _visible = true;
      });
    });
  }

  void _triggerClose() async {
    setState(() {
      _visible = false;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Material(
      type: .transparency,
      child: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _triggerClose,
            child: const SizedBox.expand(),
          ),
          AnimatedPositioned(
            top: AppTheme.headerHeight,
            right: _visible ? 0 : -AppTheme.cartWidth,
            curve: Curves.easeInOutQuad,
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: widget.width,
              padding: .all(AppTheme.edgePadding),
              constraints: BoxConstraints(
                maxHeight:
                    MediaQuery.of(context).size.height - AppTheme.headerHeight,
              ),
              decoration: BoxDecoration(
                color: colorTheme.surfaceContainerHighest,
                border: .fromLTRB(
                  left: BorderSide(
                    color: colorTheme.primary,
                    width: AppTheme.strokeLarge,
                  ),
                  bottom: BorderSide(
                    color: colorTheme.primary,
                    width: AppTheme.strokeLarge,
                  ),
                ),
                borderRadius: .only(
                  bottomLeft: .circular(AppTheme.radiusLarge),
                ),
              ),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
