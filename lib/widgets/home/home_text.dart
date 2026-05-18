import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class HomeText extends StatelessWidget {
  const HomeText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          "Välkommen till iMat!",
          style: TextStyle(
            fontSize: AppTheme.fontTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Utforska vårt breda sortiment och hitta dina favoriter",
          style: TextStyle(
            fontSize: AppTheme.fontHuge,
            color: theme.onSurface,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
