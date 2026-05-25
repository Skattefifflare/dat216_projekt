import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/shopping_item.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/browse/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  final ShoppingItem item;

  const CartCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Card(
      color: Colors.white,
      clipBehavior: .hardEdge,
      child: SizedBox(
        height: AppTheme.cartCardHeight,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: context.read<ImatDataHandler>().getImage(item.product),
            ),
            Expanded(
              child: Padding(
                padding: .all(AppTheme.paddingSmall),
                child: Column(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(item.product.name, style: AppTheme.textHuge()),
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
                              context
                                  .read<ImatDataHandler>()
                                  .shoppingCartRemove(item);
                            },
                          ),
                        ),
                        AddToCart(product: item.product),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
