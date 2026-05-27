import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/checkout/checkout_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationButton extends StatelessWidget {
  final bool goesForward; // jättedumt egentligen
  final double width;
  const NavigationButton({
    super.key,
    required this.goesForward,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      height: 60,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: goesForward
              ? AppTheme.colorScheme.primary
              : AppTheme.colorScheme.surfaceContainerHigh,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        icon: Icon(
          goesForward ? Icons.arrow_forward : Icons.arrow_back,
          color: goesForward ? theme.surface : theme.inverseSurface,
        ),
        onPressed: goesForward
            ? context.read<CheckoutNavigation>().nextStep
            : context.read<CheckoutNavigation>().previousStep,
        label: Text(
          goesForward ? "Gå Vidare" : "Gå Tillbaka",
          style: AppTheme.textMediumThick(
            color: goesForward ? theme.surface : theme.inverseSurface,
          ),
        ),
        iconAlignment: goesForward ? .end : .start,
      ),
    );
  }
}
