import 'package:flutter/material.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(width: 320), //TODO add filters
          Expanded(
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
          ),
          SizedBox(width: 320),
        ],
      ),
    );
  }
}
