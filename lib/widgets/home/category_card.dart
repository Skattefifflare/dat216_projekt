import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final GeneralProductCategory category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Card(
      margin: .all(AppTheme.categoryCardMargin),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          SizedBox(
            width: AppTheme.categoryCardWidth,
            height: AppTheme.categoryCardHeight,
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
                    Colors.black.withValues(alpha: 100),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.7],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: AppTheme.categoryCardPadding,
            left: AppTheme.categoryCardPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  style: AppTheme.textHuge(color: theme.onPrimary)
                ),
                Text(
                  category.description,
                  style: TextStyle(color: theme.onPrimary),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: AppTheme.categoryCardPadding,
            right: AppTheme.categoryCardPadding,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
              color: theme.surface,
              style: IconButton.styleFrom(
                backgroundColor: theme.tertiary,
                shape: const CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
