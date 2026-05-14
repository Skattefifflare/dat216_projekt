import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class CategoryCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;

  @Preview(name: 'My Sample Text')
  const CategoryCard({super.key, required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          SizedBox(
            width: 340,
            height: 240,
            child: Image(image: image, fit: BoxFit.cover),
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
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppTheme.fontHuge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
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
