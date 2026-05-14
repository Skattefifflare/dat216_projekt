import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60,
      child: Center(
        child: Text('© 2024 iMat. All rights reserved.'),
      ),
    );
  }
}