import 'package:dat216_projekt/model/filter_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceSlider extends StatelessWidget {
  const PriceSlider({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorTheme = Theme.of(context).colorScheme;
    final filterState = context.watch<FilterHandler>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text('Maxpris', style: textTheme.titleLarge),
            Text(
              '${filterState.currentPrice} SEK',
              style: textTheme.titleMedium,
            ),
          ],
        ),
        Slider(
          activeColor: colorTheme.primary,
          inactiveColor: colorTheme.inverseSurface,
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
