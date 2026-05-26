import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class FilterCheckbox extends StatelessWidget {
  final String text;

  final ValueChanged<bool> onChanged;
  final bool enabled;

  const FilterCheckbox({
    super.key,
    required this.text,
    required this.onChanged,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return CheckboxListTile(
      title: Text(
        text,
        style: AppTheme.textMediumThin(color: colorTheme.surface),
      ),
      contentPadding: .symmetric(horizontal: AppTheme.paddingSmall),
      activeColor: colorTheme.tertiary,
      tileColor: colorTheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(AppTheme.radiusMedium),
      ),
      // Guarantee existing bool. null => false
      onChanged: (value) {
        onChanged(value ?? false);
      },
      side: BorderSide(color: colorTheme.outline, width: AppTheme.strokeSmall),
      value: enabled,
    );
  }
}
