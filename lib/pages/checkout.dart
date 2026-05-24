import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/checkout/reviews/cart_review.dart';
import 'package:dat216_projekt/widgets/checkout/checkout_navigation.dart';
import 'package:dat216_projekt/widgets/checkout/checkout_numbers.dart';
import 'package:dat216_projekt/widgets/checkout/reviews/confirmation_review.dart';
import 'package:dat216_projekt/widgets/checkout/reviews/delivery_review.dart';
import 'package:dat216_projekt/widgets/checkout/reviews/payment_review.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  Widget getCurrentTab(int currentStep) {
    switch (currentStep) {
      case 1:
        return CartReview();
      case 2:
        return DeliveryReview();
      case 3:
        return PaymentReview();
      case 4:
        return ConfirmationReview();
    }
    return Placeholder();
  }

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<CheckoutNavigation>();

    return Column(
      children: [
        SizedBox(height: AppTheme.paddingLarge),
        Center(
          child: CheckoutNumbers(
            currentStep: nav.currentStep,
          ),
        ),
        SizedBox(height: AppTheme.paddingLarge),
        Container(
          width: 1200,
          height: 550,
          child: Card(
            
            child: Column(
              children: [
                SizedBox(height: AppTheme.paddingMedium),
                Text(
                  "Steg ${nav.currentStep} av 4",
                  style: TextStyle(fontSize: 20),
                ),
                getCurrentTab(nav.currentStep),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
