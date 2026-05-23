import 'package:flutter/material.dart';

class CheckoutNavigation extends ChangeNotifier {
  int currentStep = 1;

  void nextStep() {
    currentStep++;
    notifyListeners();
  }

  void previousStep() {
    if (currentStep > 1) currentStep--;
    notifyListeners();
  }
}
