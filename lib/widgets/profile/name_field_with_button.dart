import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class NameFieldWithButton extends StatelessWidget {
  final String label;
  final String hintTxt;
  final double? width;
  final bool enabled;

  const NameFieldWithButton({
    super.key,
    required this.label,
    required this.hintTxt,
    this.width,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.paddingSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: AppTheme.fontMedium),
          ),
          const SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: width ?? 250,
            height: 32,
            child: TextField(
              enabled: enabled,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: hintTxt,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                fillColor: theme.surface,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  borderSide: BorderSide(
                    color: theme.secondary,
                    width: AppTheme.strokeTiny,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
