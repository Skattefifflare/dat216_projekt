import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/appIconButton.dart';
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
          style: AppTheme.textHuge(),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('Totalt', style: AppTheme.textLargeNormal(color: Colors.black),),
              Text('${iMat.shoppingCartTotal().toString()} SEK', style: AppTheme.textLargeThick(color: Colors.black),),
            ],
          ),
        ),
        SizedBox(height: AppTheme.paddingMedium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIconButton(
              text: 'Töm',
              icon: Icons.remove_shopping_cart_outlined,
              onPressed: () => iMat.shoppingCartClear(),
            ),
            AppIconButton(
              text: 'Till kassan',
              icon: Icons.arrow_forward,
              onPressed: () {
                context.go('/checkout');
                OverlayController.close();
              },
            ),
          ],
        ),
      ],
    );
  }
}
