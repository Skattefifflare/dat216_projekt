import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 130,
      child: Card(
        margin: .all(AppTheme.categoryCardMargin),
        child: Row(
          children: [
            IconButton(onPressed: () {
              setState(() {
                amount += 1;
              });
              
              }, icon: Icon(Icons.add)),
            VerticalDivider(width: 1),
            Padding(
              padding: const EdgeInsets.only(
                left: AppTheme.paddingMedium,
                right: AppTheme.paddingMedium,
              ),
              child: Text("$amount"),
            ),
            VerticalDivider(width: 1),
            IconButton(onPressed: () {
              setState(() {
                if (amount > 0) {amount -= 1;}
              });
            }, icon: Icon(Icons.remove)),
          ],
        ),
      ),
    );
  }
}
