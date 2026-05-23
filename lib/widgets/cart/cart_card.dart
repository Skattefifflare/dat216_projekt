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
      child: Padding(
        padding: const .all(AppTheme.paddingSmall),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  item.product.name,
                  style: TextStyle(fontSize: AppTheme.fontHuge),
                ),
                Text(
                  '${item.product.price} ${item.product.unit}',
                  style: TextStyle(fontSize: AppTheme.fontLarge),
                ),
              ],
            ),
            SizedBox(height: AppTheme.paddingMedium),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                SizedBox(
                  height: AppTheme.addToCartButtonHeight,
                  width: AppTheme.addToCartButtonHeight,
                  child: IconButton(
                    icon: Icon(Icons.delete_outline),
                    style: IconButton.styleFrom(
                      backgroundColor: colorTheme.primaryFixedDim,
                    ),
                    onPressed: () {
                      context.read<ImatDataHandler>().shoppingCartRemove(item);
                    },
                  ),
                ),
                AddToCart(product: item.product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
