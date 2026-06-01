import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/model/imat/product_detail.dart';
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
    final iMat = context.read<ImatDataHandler>();
    final image = iMat.getImage(product);

    final ProductDetail? details = iMat.getDetail(product);

    // Not all products have details, without them the card cant be filled out with info
    if (details == null) {
      return SizedBox.shrink();
    }

    return Card(
      child: Padding(
        padding: const .all(AppTheme.paddingMediumSmall),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(product.name, style: AppTheme.textMediumThick()),
                      Text(details.brand, style: AppTheme.textSmall()),
                    ],
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
            Text(
              '${product.price} ${product.unit}',
              style: AppTheme.textLargeNormal(),
            ),
            Text(details.description),
            Spacer(),
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                Flexible(child: Text(details.origin)),
              ],
            ),
            SizedBox(height: AppTheme.paddingMediumSmall),
            AddToCart(product: product),
          ],
        ),
      ),
    );
  }
}
