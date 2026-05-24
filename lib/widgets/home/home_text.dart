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
          style: AppTheme.textTitle()
        ),
        Text(
          "Utforska vårt breda sortiment och hitta dina favoriter",
          style: AppTheme.textHuge()
        ),
      ],
    );
  }
}
