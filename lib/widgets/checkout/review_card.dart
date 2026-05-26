import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/shopping_item.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/browse/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewCard extends StatelessWidget {
  final ShoppingItem item;
  const ReviewCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Card(
      color: Colors.white,
      clipBehavior: .hardEdge,
      child: Padding(
        padding: const .all(AppTheme.paddingTiny),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: context.read<ImatDataHandler>().getImage(item.product),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppTheme.paddingSmall,
                right: AppTheme.paddingSmall,
              ),
              child: SizedBox(height: 80, child: VerticalDivider(width: 2)),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        item.product.name,
                        style: AppTheme.textLargeNormal(),
                      ),
                      Text(
                        '${item.product.price} ${item.product.unit}',
                        style: AppTheme.textLargeNormal(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      SizedBox(
                        height: AppTheme.addToCartButtonHeight,
                        width: AppTheme.addToCartButtonHeight,
                        child: IconButton(
                          icon: Icon(Icons.delete_outline),
                          color: colorTheme.onTertiary,
                          style: IconButton.styleFrom(
                            backgroundColor: colorTheme.tertiary,
                          ),
                          onPressed: () {
                            context.read<ImatDataHandler>().shoppingCartRemove(
                              item,
                            );
                          },
                        ),
                      ),
                      AddToCart(product: item.product),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
