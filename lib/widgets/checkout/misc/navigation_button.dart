import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/checkout/checkout_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationButton extends StatelessWidget {
  final bool goesForward; // jättedumt egentligen
  final double width;
  const NavigationButton({super.key, required this.goesForward, required this.width});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme; 
    
    return SizedBox(
      width: width,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        onPressed: goesForward
            ? context.read<CheckoutNavigation>().nextStep
            : context.read<CheckoutNavigation>().previousStep,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              goesForward ? "Gå Vidare" : "Gå Tillbaka",
              style: AppTheme.textMediumThick(color: theme.surface),
              
            ),
            SizedBox(width: 10,),
            Icon(
              goesForward ? Icons.arrow_forward : Icons.arrow_back,
              color: AppTheme.colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
