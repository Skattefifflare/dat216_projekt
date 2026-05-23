import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/checkout/checkout_step.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppTheme.paddingGiant),
        Center(child: CheckoutStep(currentStep: currentStep)),
        SizedBox(height: AppTheme.paddingGiant),
        Container(width: 1100, height: 450, child: Card(
          child: Column(
            children: [
              SizedBox(height: AppTheme.paddingMedium,),
              Text("Steg $currentStep av 4", style: TextStyle(fontSize: 20,)),
            ],
          ),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: (() {
                setState(() {
                  if (currentStep > 1) currentStep--;
                });
              }),
              child: Text("tillbaka"),
            ),
            ElevatedButton(
              onPressed: (() {
                setState(() {
                  currentStep++;
                });
              }),
              child: Text("vidare"),
            ),
          ],
        ),
      ],
    );
  }
}
