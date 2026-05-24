import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/checkout/misc/checkout_circle.dart';
import 'package:dat216_projekt/widgets/checkout/misc/checkout_label.dart';
import 'package:dat216_projekt/widgets/checkout/misc/checkout_line.dart';
import 'package:flutter/material.dart';

class CheckoutNumbers extends StatefulWidget {
  final int currentStep;
  const CheckoutNumbers({super.key, required this.currentStep});

  @override
  State<CheckoutNumbers> createState() => _CheckoutNumbersState();
}

class _CheckoutNumbersState extends State<CheckoutNumbers> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme; 

    return Column(
      children: [
        SizedBox(
          width: 780,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CheckoutCircle(step: 1, state: getState(1, widget.currentStep)),
              CheckoutLine(leftColor: getLineColor(1, widget.currentStep, theme), rightColor: getLineColor(2, widget.currentStep, theme)),
              CheckoutCircle(step: 2, state: getState(2, widget.currentStep)),
              CheckoutLine(leftColor: getLineColor(2, widget.currentStep, theme), rightColor: getLineColor(3, widget.currentStep, theme)),
              CheckoutCircle(step: 3, state: getState(3, widget.currentStep)),
              CheckoutLine(leftColor: getLineColor(3, widget.currentStep, theme ), rightColor: getLineColor(4, widget.currentStep, theme)),
              CheckoutCircle(step: 4, state: getState(4, widget.currentStep)),
            ],
          ),
        ),
        SizedBox(
          width: 910,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CheckoutLabel(label: "Kundvagn"),
              CheckoutLabel(label: "Leverans"),
              CheckoutLabel(label: "Betalning"),
              CheckoutLabel(label: "Bekräftelse"),
            ],
          ),
        )
      ],
    );
  }

  CircleState getState(int step, int currentStep) {
    if (step == currentStep) return CircleState.active;
    if (step > currentStep) return CircleState.notDone;
    return CircleState.done;
  }
  Color getLineColor(int step, int currentStep, ColorScheme theme){
    if (step <= currentStep) {
      return theme.secondary;
    } else {
      return theme.outline;
    }
  }
}

enum CircleState { done, active, notDone }
