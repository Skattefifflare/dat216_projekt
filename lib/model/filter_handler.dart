import 'dart:math';

import 'package:dat216_projekt/model/imat/product.dart';
import 'package:flutter/material.dart';

class FilterHandler extends ChangeNotifier {
  var sorting = SortingOption.alphabetical;
  var category = GeneralProductCategory.ALL;

  var minPrice = 0.0;
  var maxPrice = 0.0;
  var currentPrice = 0.0;

  Set<String> labels = {};

  void update(double price) {
    currentPrice = price;

    notifyListeners();
  }

  void updateBounds(List<Product> products) {
    if (products.isEmpty) return;
    minPrice = products.map((p) => p.price).reduce(min);
    maxPrice = products.map((p) => p.price).reduce(max);

    // Only change if on default
    if (currentPrice == 0.0) {
      currentPrice = maxPrice;
    }

    Future.microtask(() {
      notifyListeners();
    });
  }

  void toggleLabel(String label) {
    if (labels.contains(label)) {
      labels.remove(label);
    } else {
      labels.add(label);
    }

    notifyListeners();
  }

  List<Product> matchingProducts(List<Product> products) {
    return products.where((product) {
      final categoryMatch = category.subCategories.contains(product.category);
      final priceMatch = product.price <= currentPrice;
      final labelMatch = product.activeLabels.containsAll(labels);

      return categoryMatch && priceMatch && labelMatch;
    }).toList();
  }
}

enum SortingOption {
  alphabetical(displayName: 'Alfabetiskt'),
  priceRising(displayName: 'Stigande pris'),
  priceFalling(displayName: 'Fallande pris');

  final String displayName;
  const SortingOption({required this.displayName});
}
