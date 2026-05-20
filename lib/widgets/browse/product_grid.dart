import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/filter_handler.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});
  @override
  Widget build(BuildContext context) {
    final filterState = context.watch<FilterHandler>();
    var iMat = context.read<ImatDataHandler>();

    return Container(
      alignment: .topCenter,
      padding: const .symmetric(horizontal: AppTheme.edgePadding),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            for (final product in filterState.matchingProducts(iMat.products))
              SizedBox(width: 150, height: 300, child: Placeholder()),
          ],
        ),
      ),
    );
  }
}
