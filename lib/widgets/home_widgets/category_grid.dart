import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/home_widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        spacing: AppTheme.paddingMedium,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppTheme.paddingLarge,
            children: [
              CategoryCard(
                image: AssetImage("assets/images/pasta.jpg"),
                title: "Pasta",
                description: "Lorem ipsum dolor sit amet",
              ),
              CategoryCard(
                image: AssetImage("assets/images/fika.jpg"),
                title: "Fika",
                description: "Lorem ipsum dolor sit amet",
              ),
              CategoryCard(
                image: AssetImage("assets/images/fruits.jpg"),
                title: "Frukter",
                description: "Lorem ipsum dolor sit amet",
              ),
              CategoryCard(
                image: AssetImage("assets/images/meat.jpg"),
                title: "Kött",
                description: "Lorem ipsum dolor sit amet",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppTheme.paddingLarge,
            children: [
              CategoryCard(
                image: AssetImage("assets/images/vegetables.jpg"),
                title: "Grönsaker",
                description: "Lorem ipsum dolor sit amet",
              ),
              CategoryCard(
                image: AssetImage("assets/images/drinks.jpg"),
                title: "Dryck",
                description: "Lorem ipsum dolor sit amet",
              ),
              CategoryCard(
                image: AssetImage("assets/images/dairy.jpg"),
                title: "Mejeri",
                description: "Lorem ipsum dolor sit amet",
              ),
              CategoryCard(
                image: AssetImage("assets/images/fish.jpg"),
                title: "Fisk & Skaldjur",
                description: "Lorem ipsum dolor sit amet",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
