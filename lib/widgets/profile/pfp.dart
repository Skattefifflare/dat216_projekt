import 'package:dat216_projekt/widgets/profile/details.dart';
import 'package:flutter/material.dart';

class Pfp extends StatelessWidget {
  const Pfp({super.key});

  @override
  Widget build(BuildContext context) {
       return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 55),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color.fromARGB(255, 110, 173, 113), width: 3.5),
            ),
            child: CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('assets/images/holgerson.png'),
            ),
          ),
          SizedBox(height: 12),
          Text('Hjördis', style: TextStyle(fontSize: 40)),
          SizedBox(height: 29),
          Details(),
          ],
      ),
    );
  }
}
