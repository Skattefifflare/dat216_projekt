import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/checkout/checkout_navigation.dart';
import 'package:dat216_projekt/widgets/checkout/review_field.dart';
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
    final isValid = goesForward
        ? context.watch<FormatNotifier>().isValid
        : true;
    return SizedBox(
      width: width,
      height: 60,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: goesForward
              ? (isValid
                    ? AppTheme.colorScheme.primary
                    : AppTheme.colorScheme.surfaceContainerHigh)
              : AppTheme.colorScheme.surfaceContainerHigh,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        icon: Icon(
          goesForward
              ? (isValid ? Icons.arrow_forward : Icons.lock)
              : Icons.arrow_back,
          color: goesForward
              ? (isValid ? theme.surface : theme.inverseSurface)
              : theme.inverseSurface,
        ),
        onPressed: (!goesForward || isValid)
            ? (goesForward
                  ? context.read<CheckoutNavigation>().nextStep
                  : context.read<CheckoutNavigation>().previousStep)
            : null,
        label: Text(
          goesForward ? (isValid ? "Gå Vidare" : "Fel Format") : "Gå Tillbaka",
          style: AppTheme.textMediumThick(
            color: goesForward
                ? (isValid ? theme.surface : theme.inverseSurface)
                : theme.inverseSurface,
          ),
        ),
        iconAlignment: goesForward ? IconAlignment.end : IconAlignment.start,
      ),
    );
  }
}
