import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/filter_handler.dart';
import 'package:dat216_projekt/widgets/browse/filter/filter_panel.dart';
import 'package:dat216_projekt/widgets/browse/product_grid.dart';
import 'package:flutter/material.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      children: [
        FilterPanel(),
        Expanded(child: ProductGrid()),
        SizedBox(width: AppTheme.filterWidth),
      ],
    );
  }
}
