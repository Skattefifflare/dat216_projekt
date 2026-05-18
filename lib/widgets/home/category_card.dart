import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final GeneralProductCategory category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          SizedBox(
            width: 320,
            height: 200,
            child: Image(
              image: AssetImage('assets/images/${category.image}'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 130),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.7],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppTheme.fontHuge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(category.description, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          Positioned(
            bottom: 10,
            right: 10,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
              color: Colors.white,
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.colorScheme.primary,
                shape: const CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
