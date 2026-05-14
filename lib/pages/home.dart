import 'package:dat216_projekt/widgets/home_widgets/category_card.dart';
import 'package:dat216_projekt/widgets/home_widgets/category_grid.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Placeholder(),
        CategoryGrid()
      ],
    );
  }
}
