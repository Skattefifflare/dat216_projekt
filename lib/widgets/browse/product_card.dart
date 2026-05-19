import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});
  
  @override
  Widget build(BuildContext context) {
    final imat = context.read<ImatDataHandler>();
    final image = imat.getImage(product);
    return Card(
      child: Column(
        children: [
          Text(product.name),
          image
        ],
      ),
    );
  }
}

/*
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});
  
  @override
  Widget build(BuildContext context) {
    final imat = context.read<ImatDataHandler>();
    final image = imat.getImage(product);
    return Card(
      child: Column(
        children: [
          Text(product.name),
          image
        ],
      ),
    );
  }
}
*/