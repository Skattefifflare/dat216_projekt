import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/filter_handler.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final GeneralProductCategory category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Card(
      margin: .all(AppTheme.categoryCardMargin),
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap: () {
          context.read<FilterHandler>().reset();
          context.read<FilterHandler>().category = category;
          context.go('/browse');
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
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
                      style: AppTheme.textHuge(color: colorTheme.onPrimary),
                    ),
                    Text(
                      category.description,
                      style: TextStyle(color: colorTheme.onPrimary),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: AppTheme.categoryCardPadding,
                right: AppTheme.categoryCardPadding,
                child: Container(
                  padding: const .all(AppTheme.paddingSmall),
                  decoration: BoxDecoration(
                    color: colorTheme.tertiary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: colorTheme.onTertiary,
                    size: AppTheme.categoryCardIconSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
