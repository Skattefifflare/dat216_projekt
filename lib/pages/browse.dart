import 'package:flutter/material.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
