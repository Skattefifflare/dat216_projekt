import 'dart:math';

import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:flutter/material.dart';

class FilterHandler extends ChangeNotifier {
  var _sortingStrategy = SortingStrategy.alphabetical;
  var _category = GeneralProductCategory.ALL;
  var _searchString = '';
  var _onlyFavorites = false;

  var minPrice = 0.0;
  var maxPrice = 0.0;
  var _currentPrice = 0.0;

  Set<String> labels = {};

  GeneralProductCategory get category => _category;
  set category(GeneralProductCategory category) {
    _category = category;

    notifyListeners();
  }

  double get currentPrice => _currentPrice;

  set currentPrice(double price) {
    _currentPrice = price;

    notifyListeners();
  }

  bool get onlyFavorites => _onlyFavorites;

  set onlyFavorites(bool value) {
    _onlyFavorites = value;

    notifyListeners();
  }

  String get searchString => _searchString;

  set searchString(String string) {
    _searchString = string;

    notifyListeners();
  }

  SortingStrategy get sortingStrategy => _sortingStrategy;

  set sortingStrategy(SortingStrategy strategy) {
    _sortingStrategy = strategy;

    notifyListeners();
  }

  List<Product> match(ImatDataHandler iMat) {
    final products = iMat.products.where((product) {
      return product.price <= currentPrice && // Price
          (!onlyFavorites || iMat.isFavorite(product)) && // Favorite
          category.subCategories.contains(product.category) && // Categories
          product.activeLabels.containsAll(labels) && // Food labels
          product.name.toLowerCase().contains(
            searchString.toLowerCase(),
          ); // Search
    }).toList();
    products.sort(sortingStrategy.compare);

    return products;
  }

  void reset({bool clearSearch = true}) {
    category = GeneralProductCategory.ALL;
    currentPrice = maxPrice;
    labels = {};
    onlyFavorites = false;
    if (clearSearch)  searchString = "";
  }

  void toggleLabel(String label) {
    if (labels.contains(label)) {
      labels.remove(label);
    } else {
      labels.add(label);
    }

    notifyListeners();
  }

  void updateBounds(List<Product> products) {
    if (products.isEmpty) return;
    minPrice = products.map((p) => p.price).reduce(min);
    maxPrice = products.map((p) => p.price).reduce(max);

    // Only change if outside bounds
    if (currentPrice < minPrice || maxPrice > currentPrice) {
      currentPrice = maxPrice;
    }

    Future.microtask(() {
      notifyListeners();
    });
  }
}

enum SortingStrategy {
  alphabetical(displayName: 'Alfabetiskt', compare: _alphabetical),
  priceRising(displayName: 'Stigande pris', compare: _priceRising),
  priceFalling(displayName: 'Fallande pris', compare: _priceFalling);

  final String displayName;

  final int Function(Product a, Product b) compare;

  const SortingStrategy({required this.displayName, required this.compare});

  static int _alphabetical(Product a, Product b) {
    return a.name.toLowerCase().compareTo(b.name.toLowerCase());
  }

  static int _priceFalling(Product a, Product b) {
    return b.price.compareTo(a.price);
  }

  static int _priceRising(Product a, Product b) {
    return a.price.compareTo(b.price);
  }
}
