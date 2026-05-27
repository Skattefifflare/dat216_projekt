import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/checkout/checkout_numbers.dart';
import 'package:flutter/material.dart';

class CheckoutCircle extends StatelessWidget {
  final int step;
  final CircleState state;

  const CheckoutCircle({
    super.key,
    required this.step,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme; 

    return SizedBox(
      child: Column(
        children: [
          Container(
            width: 105,
            height: 105,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: getCircleBorderColor(state, theme)),
              color: getCircleColor(state, theme),
            ),
            child: getCircleIcon(state, theme ),
          ),          
        ],
      ),
    );
  }

  Color getCircleColor(CircleState state, ColorScheme theme) {
    if (state == CircleState.done) return theme.secondary;
    if (state == CircleState.active) return theme.onPrimary;
    return AppTheme.colorScheme.surface;
  }

  Widget getCircleIcon(CircleState state, ColorScheme theme) {
    if (state == CircleState.done) return Icon(color: theme.onPrimary,size: 75, Icons.check);
    return Center(child: Text("$step", style: AppTheme.textLargeThick()));
  }

  Color getCircleBorderColor(CircleState state, ColorScheme theme){
    if (state == CircleState.active) return theme.secondary;
    if (state == CircleState.done) return AppTheme.colorScheme.secondary;
    return theme.outline;
  }
}
