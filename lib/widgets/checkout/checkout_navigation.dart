import 'package:flutter/material.dart';

class CheckoutNavigation extends ChangeNotifier {
  int currentStep = 1;
  DateTime deliveryDate = DateTime.now();

  void nextStep() {
    currentStep++;
    notifyListeners();
  }

  void previousStep() {
    if (currentStep > 1) currentStep--;
    notifyListeners();
  }
  void reset() {
    currentStep = 1;
    notifyListeners();
  }


  void setDeliveryDate(DateTime date) {
    deliveryDate = date;
    notifyListeners();
  }
}
