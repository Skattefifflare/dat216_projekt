import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/checkout/checkout_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationButton extends StatelessWidget {
  final bool goesForward; // jättedumt egentligen
  const NavigationButton({super.key, required this.goesForward});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.colorScheme.primary,
      ),
      onPressed: goesForward
          ? context.read<CheckoutNavigation>().nextStep
          : context.read<CheckoutNavigation>().previousStep,
      child: Text(
        goesForward ? "Gå Vidare" : "Gå Tillbaka",
        style: TextStyle(color: AppTheme.colorScheme.onPrimary, fontSize: AppTheme.fontLarge),
      ),
    );
  }
}
