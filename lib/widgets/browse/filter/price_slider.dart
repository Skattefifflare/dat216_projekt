import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/filter_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceSlider extends StatelessWidget {
  const PriceSlider({super.key});
  @override
  Widget build(BuildContext context) {
    final filterState = context.watch<FilterHandler>();
    final theme = Theme.of(context).colorScheme; 
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text('Maxpris', style: AppTheme.textMediumThick()),
            Text(
              '${filterState.currentPrice} SEK',
              style: AppTheme.textMediumNormal(),
            ),
          ],
        ),
        Slider(
          activeColor: theme.secondary,
          thumbColor: theme.tertiary,
          inactiveColor: theme.outline,
          divisions: (filterState.maxPrice - filterState.minPrice).round(),
          value: filterState.currentPrice,
          min: filterState.minPrice,
          max: filterState.maxPrice,
          onChanged: (price) {
            filterState.currentPrice = price;
          },
        ),
      ],
    );
  }
}
