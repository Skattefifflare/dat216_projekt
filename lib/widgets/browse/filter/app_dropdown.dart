import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class AppDropdown<T> extends StatelessWidget {
  final ValueChanged<T?> onSelected;
  final T initial;
  final List<DropdownMenuEntry<T>> entries;

  const AppDropdown({
    super.key,
    required this.onSelected,
    required this.initial,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final color = colorTheme.primaryFixedDim;

    final width = AppTheme.filterWidth - 2 * AppTheme.edgePadding;

    return DropdownMenu<T>(
      requestFocusOnTap: false,

      // Style changes
      // Larger icon
      trailingIcon: Icon(Icons.arrow_drop_down, size: 32),
      selectedTrailingIcon: Icon(Icons.arrow_drop_up, size: 32),

      // Sizing
      width: width,
      expandedInsets: EdgeInsets.zero,

      // Looks
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: color,

        border: OutlineInputBorder(
          borderRadius: .circular(AppTheme.radiusMedium),
          borderSide: .none,
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(color),
        padding: const WidgetStatePropertyAll(.zero),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: .only(
              bottomLeft: .circular(AppTheme.radiusLarge),
              bottomRight: .circular(AppTheme.radiusLarge),
            ),
          ),
        ),
      ),

      // Functionality
      initialSelection: initial,
      dropdownMenuEntries: entries,
      onSelected: onSelected,
    );
  }
}
