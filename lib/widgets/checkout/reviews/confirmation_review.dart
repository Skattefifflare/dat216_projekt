import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/model/internet_handler.dart';
import 'package:dat216_projekt/widgets/checkout/checkout_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ConfirmationReview extends StatefulWidget {
  const ConfirmationReview({super.key});

  @override
  State<ConfirmationReview> createState() => _ConfirmationReviewState();
}

class _ConfirmationReviewState extends State<ConfirmationReview> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<ImatDataHandler>().placeOrder();
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckoutNavigation navigation = context.read<CheckoutNavigation>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: AppTheme.paddingGiant),
        Text("Tack för din beställning!", style: AppTheme.textGiantThick()),
        SizedBox(height: AppTheme.paddingMedium),
        SizedBox(width: 400, child: Divider(thickness: AppTheme.strokeTiny)),
        SizedBox(
          width: 700,
          child: Text(
            "Din beställning har tagits emot och kommer att levereras ${navigation.deliveryDate.day}/${navigation.deliveryDate.month}/${navigation.deliveryDate.year}.",
            style: AppTheme.textMediumThick(),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: AppTheme.paddingGiant),
        SizedBox(
          height: 60,
          width: 250,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            onPressed: () {
              navigation.reset();
              context.go('/');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Gå till startsidan",
                  style: AppTheme.textMediumThick(
                    color: AppTheme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
