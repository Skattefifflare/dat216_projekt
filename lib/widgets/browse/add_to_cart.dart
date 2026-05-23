import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/model/imat/shopping_item.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/appIconButton.dart';
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

    return Container(
      height: AppTheme.addToCartButtonHeight,
      alignment: .center,
      child: (amount > 0)
          ? Card(
              color: colorTheme.primaryFixedDim,
              margin: .zero,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(AppTheme.addToCartButtonHeight / 2),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                mainAxisSize: .min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, size: AppTheme.iconLarge),
                    onPressed: () {
                      iMat.shoppingCartUpdate(ShoppingItem(product), delta: -1);
                    },
                  ),
                  Container(
                    width: AppTheme.addToCartAmountWidth,
                    color: colorTheme.surfaceContainer,
                    alignment: .center,
                    padding: const .only(
                      left: AppTheme.paddingMedium,
                      right: AppTheme.paddingMedium,
                    ),
                    child: Text(
                      amount.toString(),
                      overflow: .fade,
                      softWrap: false,
                      style: TextStyle(fontSize: AppTheme.fontLarge),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, size: AppTheme.iconLarge),
                    onPressed: () {
                      iMat.shoppingCartUpdate(ShoppingItem(product), delta: 1);
                    },
                  ),
                ],
              ),
            )
          : AppIconButton(
              text: 'Lägg till',
              icon: Icons.add_shopping_cart,
              onPressed: () => iMat.shoppingCartAdd(ShoppingItem(product)),
            ),
    );
  }
}
