import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class VertDivide extends StatelessWidget {
  const VertDivide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppTheme.paddingMedium,
        right: AppTheme.paddingMedium,
      ),
      child: SizedBox(height: 460, child: VerticalDivider(width: 2)),
    );
  }
}
