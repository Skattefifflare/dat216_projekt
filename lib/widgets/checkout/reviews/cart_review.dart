import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/checkout/misc/vert_divide.dart';
import 'package:dat216_projekt/widgets/checkout/navigation_button.dart';
import 'package:dat216_projekt/widgets/checkout/review_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartReview extends StatelessWidget {
  const CartReview({super.key});

  @override
  Widget build(BuildContext context) {
    final iMat = context.watch<ImatDataHandler>();
    final cart = iMat.getShoppingCart();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 480,
          width: 500,
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              return ReviewCard(item: cart.items[index]);
            },
          ),
        ),
        VertDivide(),
        SizedBox(
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sammanfattning:", style: TextStyle(fontSize: AppTheme.fontHuge),),
              Divider(thickness: 2,),
              Text("${cart.items.length} st. varor", style: TextStyle(fontSize: AppTheme.fontLarge),),
              SizedBox(height: AppTheme.paddingMedium,),
              Text("0kr rabatt (finns ens rabatt i backend?)", style: TextStyle(fontSize: AppTheme.fontLarge),),
              SizedBox(height: 200),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text("Totalpris:  ", style: TextStyle(fontSize: AppTheme.fontLarge),),
                  ),
                  Text('${iMat.shoppingCartTotal().toString()} SEK', style: TextStyle(fontSize: AppTheme.fontHuge),)
                ],
              ),
              NavigationButton(goesForward: true),
            ],
          ),
        )
      ],
    );
  }
}
