import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const AppIconButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return ElevatedButton.icon(
      label: Text(text, style: AppTheme.textHuge()),
      icon: Icon(icon, size: AppTheme.iconLarge),
      style: ElevatedButton.styleFrom(
        backgroundColor: colorTheme.tertiary,
        foregroundColor: colorTheme.onTertiary,
      ),
      onPressed: onPressed,
    );
  }
}
