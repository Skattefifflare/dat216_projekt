import 'package:flutter/material.dart';

class CheckoutLine extends StatelessWidget {
  final Color leftColor;
  final Color rightColor;
  
  const CheckoutLine({super.key, required this.leftColor, required this.rightColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [leftColor, rightColor]),
        ),
        child: const SizedBox(height: 6),
      ),
    );
  }
}
