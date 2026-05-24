import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/filter_handler.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodLabels extends StatelessWidget {
  const FoodLabels({super.key});
  @override
  Widget build(BuildContext context) {
    final filterState = context.watch<FilterHandler>();
    final theme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Märkningar', style: AppTheme.textMediumThick()),
        Container(
          padding: .symmetric(horizontal: AppTheme.paddingTiny),
          decoration: BoxDecoration(
            borderRadius: .circular(AppTheme.radiusMedium),
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: [
                CheckboxListTile(
                  title: Text(
                    'Ekologiskt',
                    style: AppTheme.textMediumThin(color: theme.surface),
                  ),
                  contentPadding: .symmetric(horizontal: AppTheme.paddingSmall),
                  activeColor: theme.tertiary,
                  tileColor: theme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: .circular(AppTheme.radiusMedium),
                  ),
                  onChanged: (_) {
                    filterState.toggleLabel(Product.ecoKey);
                  },
                  side: BorderSide(
                    color: theme.outline,
                    width: AppTheme.strokeSmall,
                  ),
                  value: filterState.labels.contains(Product.ecoKey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
