import 'package:dat216_projekt/widgets/profile_widgets/name_field_with_button.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              Text("lorem ipsum"),
              NameFieldWithButton(label: "Namn", hintTxt: "Förnamn Efternamn")
            ],
          ),
          Column(
            children: [
              Text("lorem ipsum"),
              NameFieldWithButton(label: "Namn", hintTxt: "Förnamn Efternamn")
            ],
          ),
        ],
      )
    );
  }
}