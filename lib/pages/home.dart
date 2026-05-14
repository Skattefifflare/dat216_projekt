import 'package:dat216_projekt/widgets/home_widgets/category_card.dart';
import 'package:dat216_projekt/widgets/home_widgets/category_grid.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Välkommen till iMat!",
          style: TextStyle(
            fontSize: 82, 
            fontWeight: FontWeight.bold
          ),
        ),
        const Text( 
          "Utforska vårt breda sortiment och hitta dina favoriter",
          style: TextStyle(
            fontSize: 32, 
            color: Color.fromARGB(255, 41, 41, 41),
            fontWeight: FontWeight.normal
          ),
        ),


        
        CategoryGrid()
      ],
    );
  }
}
