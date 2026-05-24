import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String? text;

  const HeaderButton({
    required this.icon,
    this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    List<Widget> content = [
      Icon(icon, size: AppTheme.headerButton, color: theme.primary),
    ];

    if (text != null) {
      content.add(
        Text(text!, style: AppTheme.textLargeThick(color: theme.primary)),
      );
    }

    return SizedBox(
      height: 82,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.onPrimary,
          shape: (text == null) ? CircleBorder() : null,
          padding: .all(AppTheme.paddingLarge),
        ),

        onPressed: onPressed,
        child: Row(children: content),
      ),
    );
  }
}
