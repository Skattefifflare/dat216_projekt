import 'package:dat216_projekt/widgets/checkout/checkout_circle.dart';
import 'package:flutter/material.dart';

class CheckoutStep extends StatefulWidget {
  final int currentStep;
  const CheckoutStep({super.key, required this.currentStep});

  @override
  State<CheckoutStep> createState() => _CheckoutStepState();
}

class _CheckoutStepState extends State<CheckoutStep> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 830,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CheckoutCircle(step: 1, state: getState(1, widget.currentStep), label: "Kundvagn"),
              Column(
                children: [
                  SizedBox(width: 110, child: Divider(thickness: 6)),
                  Padding(padding: EdgeInsetsGeometry.only(bottom: 45))
                ],
              ),
              CheckoutCircle(step: 2, state: getState(2, widget.currentStep), label: "Leverans",),
              Column(
                children: [
                  SizedBox(width: 110, child: Divider(thickness: 6)),
                  Padding(padding: EdgeInsetsGeometry.only(bottom: 45))
                ],
              ),
              CheckoutCircle(step: 3, state: getState(3, widget.currentStep), label: "Betalning"),
              Column(
                children: [
                  SizedBox(width: 110, child: Divider(thickness: 6)),
                  Padding(padding: EdgeInsetsGeometry.only(bottom: 45))
                ],
              ),
              CheckoutCircle(step: 4, state: getState(4, widget.currentStep), label: "Bekräftelse"),
            ],
          ),
        ],
      ),
    );
  }

  CircleState getState(int step, int currentStep) {
    if (step == currentStep) return CircleState.active;
    if (step > currentStep) return CircleState.notDone;
    return CircleState.done;
  }
}

enum CircleState { done, active, notDone }
