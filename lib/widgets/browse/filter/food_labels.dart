import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/filter_handler.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodLabels extends StatelessWidget {
  const FoodLabels({super.key});
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = TextTheme.of(context);
    final filterState = context.watch<FilterHandler>();

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Märkningar', style: textTheme.titleLarge),
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
                  title: const Text('Ekolokiskt'),
                  contentPadding: .symmetric(horizontal: AppTheme.paddingSmall),
                  activeColor: colorTheme.secondary,
                  tileColor: colorTheme.primaryFixedDim,
                  shape: RoundedRectangleBorder(
                    borderRadius: .circular(AppTheme.radiusMedium),
                  ),
                  onChanged: (_) {
                    filterState.toggleLabel(Product.ecoKey);
                  },
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
