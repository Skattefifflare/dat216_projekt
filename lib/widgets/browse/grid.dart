import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/browse/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1200,
        height: 700,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: AppTheme.paddingSmall,
            mainAxisSpacing: AppTheme.paddingSmall,
            childAspectRatio: 260 / 360,
          ),
          itemCount: context.watch<ImatDataHandler>().products.length,
          itemBuilder: (context, index) =>
              ProductCard(product: context.read<ImatDataHandler>().selectProducts[index],),
        ),
      ),
    );
  }
}
