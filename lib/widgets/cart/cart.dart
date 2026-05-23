import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/cart/cart_card.dart';
import 'package:dat216_projekt/widgets/overlay/overlay_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final iMat = context.watch<ImatDataHandler>();
    final cart = iMat.getShoppingCart();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              return CartCard(item: cart.items[index]);
            },
          ),
        ),
        SizedBox(height: AppTheme.paddingMedium),
        DefaultTextStyle(
          style: TextStyle(fontSize: AppTheme.fontHuge),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('Totalt'),
              Text('${iMat.shoppingCartTotal().toString()} SEK'),
            ],
          ),
        ),
        SizedBox(height: AppTheme.paddingMedium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _elevatedIconButton(
              context,
              'Töm',
              Icons.remove_shopping_cart_outlined,
              () => iMat.shoppingCartClear(),
            ),
            _elevatedIconButton(
              context,
              'Till kassan',
              Icons.arrow_forward,
              () {
                context.go('/checkout');
                OverlayController.close();
              },
            ),
          ],
        ),
      ],
    );
  }

  ElevatedButton _elevatedIconButton(
    BuildContext context,
    String text,
    IconData icon,
    VoidCallback onPressed,
  ) {
    final colorTheme = Theme.of(context).colorScheme;

    return ElevatedButton.icon(
      label: Text(text, style: TextStyle(fontSize: AppTheme.fontHuge)),
      icon: Icon(icon, size: AppTheme.iconLarge),
      iconAlignment: .end,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorTheme.primaryFixedDim,
        foregroundColor: colorTheme.onPrimaryFixed,
      ),
      onPressed: onPressed,
    );
  }
}
