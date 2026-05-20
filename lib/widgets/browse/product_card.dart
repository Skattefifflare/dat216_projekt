import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/browse/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final iMat = context.read<ImatDataHandler>();
    final image = iMat.getImage(product);

    return Card(
      margin: const .all(AppTheme.categoryCardMargin),
      clipBehavior: Clip.antiAlias,

      child: SizedBox(
        width: 260,
        height: 360,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 60,
              child: SizedBox(
                width: double.infinity,
                height: 120,
                child: FittedBox(fit: BoxFit.cover, child: image),
              ),
            ),
            Positioned(
              top: AppTheme.paddingTiny,
              child: Text(
                product.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: AppTheme.fontLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Positioned(
              bottom: AppTheme.paddingMedium,
              right: AppTheme.paddingMedium,
              child: AddToCart(),
            ),
          ],
        ),
      ),
    );
  }
}
