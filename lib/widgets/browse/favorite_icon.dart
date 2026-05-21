import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final iMat = context.read<ImatDataHandler>();

    void onPressed() => iMat.toggleFavorite(product);

    if (iMat.isFavorite(product)) {
      return IconButton(
        icon: Icon(Icons.favorite, color: Colors.red),
        iconSize: AppTheme.productCardFavoriteIconSize,
        onPressed: onPressed,
      );
    } else {
      return IconButton(
        icon: Icon(Icons.favorite_border),
        iconSize: AppTheme.productCardFavoriteIconSize,
        onPressed: onPressed,
      );
    }
  }
}
