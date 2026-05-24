import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    this.labelText = 'Lösenord',
    this.width = 250,
    this.enabled = true,
    required this.hintTxt,
  });

  final String labelText;
  final double width;
  final bool enabled;
  final String hintTxt;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            textAlign: TextAlign.left,
            style: AppTheme.textMediumNormal(),
          ),
          const SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: width,
            height: 32,
            child: TextField(
              enabled: enabled,
              textAlign: TextAlign.center,
            
              obscureText: true,
              obscuringCharacter: '*',
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
