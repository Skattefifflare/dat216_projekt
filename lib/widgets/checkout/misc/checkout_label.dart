import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class CheckoutLabel extends StatelessWidget {
  final String label;
  const CheckoutLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppTheme.paddingSmall),
        SizedBox(
          width: 140,
          child: Center(child: Text(label, style: AppTheme.textMediumThick())),
        ),
      ],
    );
  }
}
