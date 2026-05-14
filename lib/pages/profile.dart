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
          SizedBox(height: 55),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 1.5),
            ),
            child: CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('assets/images/holgerson.png'),
            ),
          ),
          SizedBox(height: 12),
          Text('Hjördis', style: TextStyle(fontSize: 40)),
          _buildFormCard(),
        ],
      ),
    );
  }

  Widget _buildFormCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
      );
  }
}
