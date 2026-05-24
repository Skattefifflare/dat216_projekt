import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/checkout/misc/checkout_panel.dart';
import 'package:dat216_projekt/widgets/checkout/misc/navigation_button.dart';
import 'package:dat216_projekt/widgets/checkout/review_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartReview extends StatelessWidget {
  const CartReview({super.key});

  @override
  Widget build(BuildContext context) {
    final iMat = context.watch<ImatDataHandler>();
    final cart = iMat.getShoppingCart();

    Widget left = ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) {
        return ReviewCard(item: cart.items[index]);
      },
    );

    Widget right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text("Sammanfattning:", style: AppTheme.textMediumSerif()),
            Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${cart.items.length} st. varor",
                  style: AppTheme.textMediumThin(),
                ),
                Text(
                  '${iMat.shoppingCartTotal().toString()} kr',
                  style: AppTheme.textMediumNormal(),
                ),
              ],
            ),
            SizedBox(height: AppTheme.paddingMedium,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Leverans", style: AppTheme.textMediumThin()),
                Text("Gratis", style: AppTheme.textMediumNormal()),
              ],
            ),
            SizedBox(height: AppTheme.paddingMedium,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rabatt", style: AppTheme.textMediumThin()),
                Text("____", style: AppTheme.textMediumNormal()),
              ],
            ),
            SizedBox(height: AppTheme.paddingMedium,),
            Divider(thickness: 1),
            SizedBox(height: AppTheme.paddingHuge,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Totalt", style: AppTheme.textMediumThick()),
                Text(
                  "${iMat.shoppingCartTotal().toString()} kr",
                  style: AppTheme.textLargeThick(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("inkl. moms", style: AppTheme.textSmall(),)
              ],
            ),
            SizedBox(height: AppTheme.paddingHuge,),
            NavigationButton(goesForward: true, width: 300)
          ],
        ),
      ],
    );

    return CheckoutPanel(leftPanel: left, rightPanel: right);
  }
}
