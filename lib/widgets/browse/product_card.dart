import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/browse/add_to_cart.dart';
import 'package:dat216_projekt/widgets/browse/favorite_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    final iMat = context.read<ImatDataHandler>();
    final image = iMat.getImage(product);

    return Card(
      // Some images have white background, and there is no perfect white in the color theme
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: colorTheme.primary,
          width: AppTheme.strokeMedium,
        ),
        borderRadius: .circular(AppTheme.radiusMedium),
      ),
      elevation: AppTheme.productCardElevation,
      child: Padding(
        padding: const .all(AppTheme.paddingMediumSmall),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    product.name,
                    style: TextStyle(fontSize: AppTheme.fontHuge),
                  ),
                ),
                FavoriteIcon(product: product),
              ],
            ),
            SizedBox(height: AppTheme.paddingSmall),
            AspectRatio(
              aspectRatio: AppTheme.productCardImageAR,
              child: FittedBox(
                fit: .cover,
                clipBehavior: .hardEdge,
                child: image,
              ),
            ),
            SizedBox(height: AppTheme.paddingSmall),
            Text(
              '${product.price} ${product.unit}',
              style: TextStyle(fontSize: AppTheme.fontLarge),
            ),
            Spacer(),
            AddToCart(product: product),
          ],
        ),
      ),
    );
  }
}
