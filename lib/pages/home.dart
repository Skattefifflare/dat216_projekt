import 'package:dat216_projekt/widgets/home/category_grid.dart';
import 'package:dat216_projekt/widgets/home/home_text.dart';
import 'package:dat216_projekt/widgets/home/home_search.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 42),
        HomeText(),
        SizedBox(height: 42),
        HomeSearch(),
        SizedBox(height: 80),
        CategoryGrid()
      ],
    );
  }
}
