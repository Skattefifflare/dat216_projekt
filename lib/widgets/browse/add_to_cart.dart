import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/model/imat/shopping_item.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final iMat = context.watch<ImatDataHandler>();
    final colorTheme = Theme.of(context).colorScheme;

    final amount = iMat.getShoppingCart().getProductAmount(product);

    const dividerSize = 10.0;
    final dividerColor = colorTheme.onPrimaryFixed;

    return Container(
      height: AppTheme.productCardButtonHeight,
      alignment: .center,
      child: (amount > 0)
          ? Card(
              color: colorTheme.primaryFixedDim,
              margin: .zero,
              child: Row(
                mainAxisAlignment: .center,
                mainAxisSize: .min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      iMat.shoppingCartUpdate(ShoppingItem(product), delta: -1);
                    },
                  ),
                  VerticalDivider(width: dividerSize, color: dividerColor),
                  Container(
                    padding: const .only(
                      left: AppTheme.paddingMedium,
                      right: AppTheme.paddingMedium,
                    ),
                    child: Text(
                      amount.toString(),
                      style: TextStyle(fontSize: AppTheme.fontLarge),
                    ),
                  ),
                  VerticalDivider(width: dividerSize, color: dividerColor),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      iMat.shoppingCartUpdate(ShoppingItem(product), delta: 1);
                    },
                  ),
                ],
              ),
            )
          : ElevatedButton.icon(
              label: Text(
                'Lägg i kundvagn',
                style: TextStyle(fontSize: AppTheme.fontLarge),
              ),
              icon: Icon(Icons.add_shopping_cart),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorTheme.primaryFixedDim,
                foregroundColor: colorTheme.onPrimaryFixed,
                minimumSize: Size(0, .infinity),
              ),
              onPressed: () {
                iMat.shoppingCartAdd(ShoppingItem(product));
              },
            ),
    );
  }
}
