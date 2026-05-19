import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/browse/grid.dart';
import 'package:dat216_projekt/widgets/home/better_search.dart';
import 'package:flutter/material.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100,),
        BetterSearch(),
        SizedBox(height: AppTheme.paddingGiant),
        ProductGrid(),
      ],
    );
  }
}
