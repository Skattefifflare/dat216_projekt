import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/checkout/checkout_step.dart';
import 'package:flutter/material.dart';

class CheckoutCircle extends StatelessWidget {
  final int step;
  final CircleState state;
  final String label;
  const CheckoutCircle({
    super.key,
    required this.step,
    required this.state,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2),
            color: getCircleColor(state),
          ),
          child: getCircleIcon(state),
        ),
        SizedBox(height: AppTheme.paddingSmall),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: 150,
            child: Center(child: Text(label, style: TextStyle(fontSize: 28))),
          ),
        ),
      ],
    );
  }

  Color getCircleColor(CircleState state) {
    if (state == CircleState.active) return AppTheme.colorScheme.inversePrimary;
    if (state == CircleState.done) return AppTheme.colorScheme.primary;
    return Colors.grey;
  }

  Widget getCircleIcon(CircleState state) {
    if (state == CircleState.done) return Icon(size: 75, Icons.check);
    return Center(child: Text("$step", style: TextStyle(fontSize: 70)));
  }
}
