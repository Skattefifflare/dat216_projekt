import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/filter_handler.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/widgets/browse/filter/app_dropdown.dart';
import 'package:dat216_projekt/widgets/browse/filter/food_labels.dart';
import 'package:dat216_projekt/widgets/browse/filter/price_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterPanel extends StatelessWidget {
  const FilterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = TextTheme.of(context);
    final filterState = context.watch<FilterHandler>();

    // Wait for data provider to finalize
    if (filterState.minPrice == filterState.maxPrice) {
      return Text('Laddar data');
    }

    return Container(
      width: AppTheme.filterWidth,
      padding: .all(AppTheme.containerPadding),
      decoration: BoxDecoration(
        color: colorTheme.surfaceContainer,
        borderRadius: .circular(AppTheme.radiusMedium),
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          // Sorting
          Text('Sortera efter', style: textTheme.titleLarge),
          AppDropdown<SortingStrategy>(
            onSelected: (value) {
              if (value != null) {
                filterState.sortingStrategy = value;
              }
            },
            initial: filterState.sortingStrategy,
            entries: [
              for (final option in SortingStrategy.values)
                DropdownMenuEntry<SortingStrategy>(
                  label: option.displayName,
                  value: option,
                ),
            ],
          ),

          Divider(),

          // Categories
          Text('Kategori', style: textTheme.titleLarge),
          AppDropdown<GeneralProductCategory>(
            onSelected: (value) {
              if (value != null) {
                filterState.category = value;
              }
            },
            initial: filterState.category,
            entries: [
              for (final category in GeneralProductCategory.values)
                DropdownMenuEntry<GeneralProductCategory>(
                  label: category.title,
                  value: category,
                ),
            ],
          ),

          Divider(),
          PriceSlider(),
          Divider(),
          FoodLabels(),

          //TODO Remove
          // SizedBox(height: 100),
          // Text('The lazy dog', style: textTheme.displayMedium),
          // Text('The lazy dog', style: textTheme.headlineMedium),
          // Text('The lazy dog', style: textTheme.titleMedium),
          // Text('The lazy dog', style: textTheme.bodyMedium),
          // Text('The lazy dog', style: textTheme.labelMedium),
        ],
      ),
    );
  }
}
