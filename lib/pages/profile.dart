import 'package:dat216_projekt/widgets/home_widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class Profile extends StatelessWidget {
  @Preview(name: 'My Sample Text')
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/images/holgerson.png'),
          ),
           SizedBox(height: 12),
          // Name text below like in your design
           Text(
            'Hjördis'
              ),
            ],
          ),
        );
  }
}
