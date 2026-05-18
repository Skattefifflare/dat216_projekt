import 'package:flutter/material.dart';

class HomeText extends StatelessWidget {
  const HomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Välkommen till iMat!",
          style: TextStyle(
            fontSize: 82, 
            fontWeight: FontWeight.bold
          ),
        ),
        Text( 
          "Utforska vårt breda sortiment och hitta dina favoriter",
          style: TextStyle(
            fontSize: 32, 
            color: Color.fromARGB(255, 41, 41, 41),
            fontWeight: FontWeight.normal
          ),
        ),
      ],
    );
  }
}