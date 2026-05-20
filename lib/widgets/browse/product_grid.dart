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
    print(iMat.selectProducts.length);

    return Container(
      alignment: .topCenter,
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            for (final product in filterState.matchingProducts(
              iMat.selectProducts,
            ))
              ProductCard(product: product),
          ],
        ),
      ),
    );
  }
}
