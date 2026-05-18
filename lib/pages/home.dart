import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/home/category_grid.dart';
import 'package:dat216_projekt/widgets/home/home_text.dart';
import 'package:dat216_projekt/widgets/home/home_search.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        HomeText(),
        SizedBox(height: AppTheme.paddingHuge),
        HomeSearch(),
        SizedBox(height: AppTheme.paddingHuge),
        CategoryGrid(),
      ],
    );
  }
}
