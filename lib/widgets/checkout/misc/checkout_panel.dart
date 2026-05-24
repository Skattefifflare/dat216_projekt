import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/checkout/misc/vert_divide.dart';
import 'package:flutter/material.dart';

class CheckoutPanel extends StatelessWidget {
  final Widget leftPanel;
  final Widget rightPanel;
  const CheckoutPanel({super.key, required this.leftPanel, required this.rightPanel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 480,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.only(
              right: AppTheme.paddingLarge,
              left: AppTheme.paddingLarge,
            ),
            child: leftPanel,
          ),
        ),
        VertDivide(),
        SizedBox(
          height: 480,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.only(
              right: AppTheme.paddingLarge,
              left: AppTheme.paddingLarge,
            ),
            child: rightPanel,
          ),
        ),
      ],
    );
  }
}
