import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/widgets/browse/filter/label_checkbox.dart';
import 'package:flutter/material.dart';

class FoodLabels extends StatelessWidget {
  const FoodLabels({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Märkningar', style: AppTheme.textMediumThick()),
        Material(
          color: Colors.transparent,
          child: Column(
            spacing: AppTheme.paddingMediumSmall,
            children: [
              LabelCheckbox(text: 'Ekologiskt', label: Product.ecoKey),
            ],
          ),
        ),
      ],
    );
  }
}
