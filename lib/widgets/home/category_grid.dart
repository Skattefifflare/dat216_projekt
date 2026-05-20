import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/widgets/home/category_card.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var categories = GeneralProductCategory.values;

    return SizedBox(
      width: AppTheme.contentMaxWidth,
      child: Wrap(
        alignment: .center,
        children: [
          // Exclude first category ALL
          for (final category in categories.sublist(1)) CategoryCard(category: category),
        ],
      ),
    );
  }
}
