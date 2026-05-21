import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/filter_handler.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/browse/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final filterState = context.watch<FilterHandler>();
    var iMat = context.read<ImatDataHandler>();

    final displayProducts = filterState.match(iMat.selectProducts);

    return Container(
      alignment: Alignment.topCenter,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: AppTheme.productGridExtent,

          mainAxisExtent: AppTheme.productCardHeight,
          crossAxisSpacing: AppTheme.paddingSmall,
          mainAxisSpacing: AppTheme.paddingSmall,
        ),
        itemCount: displayProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(product: displayProducts[index]);
        },
      ),
    );
  }
}
